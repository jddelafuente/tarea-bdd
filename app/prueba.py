from flask import Flask, render_template, request
import psycopg2

app = Flask(__name__)

def obtener_conexion():
    """Abre la conexión a la base de datos Tarea1"""
    return psycopg2.connect(database="Tarea1", user="postgres", password="postgres", host="localhost", port="5432")

def obtener_equipos():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    cursor.execute("SELECT equipo_id, nombre, fecha_creacion FROM Equipos")
    equipos = cursor.fetchall()
    cursor.close()
    conexion.close()
    return equipos


##############MUERTA
def buscar_datos(tipo_busqueda, texto_buscar):
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    resultados = []
    parametro = f"%{texto_buscar}%"

    try:
        if tipo_busqueda == "jugador_gamertag":
            cursor.execute("SELECT GAMERTAG, NOMBRE_REAL, PAIS_ORIGEN FROM JUGADORES WHERE GAMERTAG ILIKE %s", (parametro,))
            resultados = cursor.fetchall()
            
        elif tipo_busqueda == "jugador_pais":
            cursor.execute("SELECT GAMERTAG, NOMBRE_REAL, PAIS_ORIGEN FROM JUGADORES WHERE PAIS_ORIGEN ILIKE %s", (parametro,))
            resultados = cursor.fetchall()
            
        elif tipo_busqueda == "equipo_nombre":
            cursor.execute("SELECT e.NOMBRE, e.FECHA_CREACION, j.gamertag  FROM EQUIPOS e JOIN JUGADORES j on e.equipo_id = j.equipo_id where es_capitan = true AND e.NOMBRE ILIKE %s", (parametro,))
            resultados = cursor.fetchall()
            
    except Exception as e:
        print(f"Error al buscar: {e}")
        
    cursor.close()
    conexion.close()
    return resultados
##############MUERTA

@app.route("/")
def pagina_equipos():
    lista_equipos = obtener_equipos()
    return render_template("equipos.html", equipos=lista_equipos)


@app.route("/buscar")
def pagina_buscar():
    tipo = request.args.get("tipo_filtro")
    resultados = []
    gamertag = request.args.get("gamertag")
    pais = request.args.get("pais")
    nombre_equipo = request.args.get("nombre_equipo")
    fecha_creacion = request.args.get("fecha_creacion")
    operador = request.args.get("operador_mmi")
    if operador == None:
        operador = "="
    
    conexion = obtener_conexion()
    cursor = conexion.cursor()

    if tipo == "jugador":
        consulta = "SELECT e.NOMBRE, e.FECHA_CREACION, j.gamertag  FROM EQUIPOS e JOIN JUGADORES j on e.equipo_id = j.equipo_id where es_capitan = true"
        parametros = []
        if gamertag:
            consulta += " AND gamertag ILIKE %s"
            parametros.append(f"%{gamertag}%")
        if pais:
            consulta += " AND pais_origen ILIKE %s"
            parametros.append(f"%{pais}%")
        cursor.execute(consulta, tuple(parametros))
        resultados = cursor.fetchall()

    elif tipo == "equipo":
        consulta = "SELECT e.NOMBRE, e.FECHA_CREACION, j.gamertag  FROM EQUIPOS e JOIN JUGADORES j on e.equipo_id = j.equipo_id where es_capitan = true "
        parametros = []
        if nombre_equipo:
            consulta += " AND nombre ILIKE %s"
            parametros.append(f"%{nombre_equipo}%")
        if fecha_creacion:
            consulta += f" AND fecha_creacion {operador} %s"
            parametros.append(fecha_creacion)
        cursor.execute(consulta, tuple(parametros))
        resultados = cursor.fetchall()
    cursor.close()
    conexion.close()

    return render_template(
        "buscador.html",
        resultados=resultados,
        tipo=tipo,
        gamertag=gamertag,
        pais=pais,
        nombre_equipo=nombre_equipo,
        fecha_creacion=fecha_creacion)


@app.route("/bracket")
def pagina_bracket():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    videojuego = request.args.get("videojuego")
    torneo_id = request.args.get("torneo_id")
    cursor.execute("SELECT DISTINCT videojuego FROM Torneos")
    juegos = cursor.fetchall()
    torneos = []
    fase_de_grupos = []
    semifinal = []
    final = []
    sponsors = []
    if videojuego:
        cursor.execute(
            "SELECT torneo_id, nombre FROM Torneos WHERE videojuego = %s",
            (videojuego,)
        )
        torneos = cursor.fetchall()

    if torneo_id:
        # fase de grupos
        cursor.execute("SELECT partida_id,e1.nombre, e2.nombre, p.puntaje_a, p.puntaje_b FROM Partidas p JOIN Equipos e1 ON p.equipo_a_id = e1.equipo_id JOIN Equipos e2 ON p.equipo_b_id = e2.equipo_id WHERE p.fase = 'fase de grupos' AND p.torneo_id = %s", (torneo_id,))
        fase_de_grupos = cursor.fetchall()

        # semifinal
        cursor.execute("Select partida_id,e1.nombre, e2.nombre, p.puntaje_a, p.puntaje_b FROM partidas p JOIN Equipos e1 ON p.equipo_a_id = e1.equipo_id JOIN Equipos e2 ON p.equipo_b_id = e2.equipo_id WHERE p.fase = 'semifinal' AND p.torneo_id = %s", (torneo_id,))
        semifinal = cursor.fetchall()

        # final
        cursor.execute("SELECT partida_id,e1.nombre, e2.nombre, p.puntaje_a, p.puntaje_b FROM partidas p JOIN Equipos e1 ON p.equipo_a_id = e1.equipo_id JOIN Equipos e2 ON p.equipo_b_id = e2.equipo_id WHERE p.fase = 'final' AND p.torneo_id = %s", (torneo_id,))
        final = cursor.fetchall()

        # SPONSORS
        cursor.execute("SELECT s.nombre, p.monto_usd FROM patrocinios p JOIN Sponsors s ON p.sponsor_id = s.sponsor_id WHERE p.torneo_id = %s ", (torneo_id,))
        sponsors = cursor.fetchall()

        # RESUltados
    cursor.close()
    conexion.close()

    return render_template(
        "bracket.html",
        juegos=juegos,
        torneos=torneos,
        videojuego=videojuego,
        torneo_id=torneo_id,
        fase_de_grupos = fase_de_grupos,
        semifinal=semifinal,
        final=final,
        sponsors=sponsors)

@app.route("/estadisticas")
def pagina_estadisticas():
    conexion = obtener_conexion()
    cursor = conexion.cursor()

    #recibimos lo del html
    eq = request.args.get("eq")
    jugador_elegido = request.args.get("estadisticas_jugador")
    nombre_torneo = request.args.get("nombre_torneo")
    id_partida = request.args.get("id_partida")

    equipos_inicio = [] 
    lista_jugadores = []
    lista_torneos = []
    lista_partidas = []
    mostrar = []

    #sacamos lsos equiipos de la base de datos
    cursor.execute("select nombre from equipos")
    equipos_inicio = cursor.fetchall() #nombres equipos

    # 1er if (me traigo los jugadores)
    if eq:
        cursor.execute("SELECT gamertag FROM jugadores WHERE equipo_id = (SELECT equipo_id FROM equipos WHERE nombre = %s)", (eq,))
        lista_jugadores = cursor.fetchall()

    # 2do if (me traigo los torneos)
    if jugador_elegido:
        # fase de grupos
        cursor.execute("SELECT DISTINCT t.nombre FROM torneos t JOIN partidas p ON t.torneo_id = p.torneo_id JOIN jugadores j ON (j.equipo_id = p.equipo_a_id OR j.equipo_id = p.equipo_b_id) WHERE j.gamertag = %s", (jugador_elegido,))
        lista_torneos = cursor.fetchall()

    # 3er if (me traigo las partidas de el jugador en el torneo)
    if nombre_torneo:
        cursor.execute("SELECT p.partida_id FROM partidas p JOIN torneos t ON p.torneo_id = t.torneo_id JOIN jugadores j ON (j.equipo_id = p.equipo_a_id OR j.equipo_id = p.equipo_b_id) WHERE j.gamertag = %s AND t.nombre = %s", (jugador_elegido, nombre_torneo))
        lista_partidas = cursor.fetchall()

    if id_partida:
        # fase de grupos
        cursor.execute("SELECT j.gamertag, j.nombre_real, j.email, j.fecha_nacimiento, j.pais_origen, ej.kos, ej.restarts, ej.assists FROM Jugadores j JOIN Estadisticas_Jugadores ej ON j.jugador_id = ej.jugador_id WHERE ej.partida_id = %s AND j.gamertag = %s", (id_partida, jugador_elegido))
        mostrar = cursor.fetchall()

    cursor.close()
    conexion.close()

    return render_template(
        "estadisticas.html",
        equipos_inicio = equipos_inicio,
        lista_jugadores = lista_jugadores,
        lista_torneos = lista_torneos,
        lista_partidas = lista_partidas,
        mostrar = mostrar,
        eq = eq,
        jugador_elegido = jugador_elegido,
        nombre_torneo = nombre_torneo,
        id_partida = id_partida) 



if __name__ == "__main__":
    print("Iniciando el servidor en http://localhost:5000 ...")
    app.run(debug=True)