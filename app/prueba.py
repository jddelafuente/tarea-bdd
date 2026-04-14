from flask import Flask, render_template, request, flash, url_for, redirect
import psycopg2

app = Flask(__name__)
app.secret_key = "clave-secreta-tarea"

def obtener_conexion():
    """Abre la conexión a la base de datos Tarea1"""
    return psycopg2.connect(database="tarea1", user="postgres", password="postgres", host="localhost", port="5432")

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
        consulta = "SELECT j.gamertag, j.nombre_real, j.pais_origen, j.email, j.fecha_nacimiento FROM jugadores j WHERE true "
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
        consulta = "SELECT e.NOMBRE, e.FECHA_CREACION, j.gamertag FROM EQUIPOS e JOIN JUGADORES j on e.equipo_id = j.equipo_id WHERE j.es_capitan = true "
        parametros = []
        if nombre_equipo:
            consulta += " AND e.nombre ILIKE %s"
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

@app.route("/estadisticas2")
def pagina_estadisticas2():
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
        # datos por partida
        cursor.execute("SELECT j.gamertag, j.nombre_real, j.email, j.fecha_nacimiento, j.pais_origen, ej.kos, ej.restarts, ej.assists FROM Jugadores j JOIN Estadisticas_Jugadores ej ON j.jugador_id = ej.jugador_id WHERE ej.partida_id = %s AND j.gamertag = %s", (id_partida, jugador_elegido))
        mostrar = cursor.fetchall()

    cursor.close()
    conexion.close()

    return render_template(
        "estadisticas2.html",
        equipos_inicio = equipos_inicio,
        lista_jugadores = lista_jugadores,
        lista_torneos = lista_torneos,
        lista_partidas = lista_partidas,
        mostrar = mostrar,
        eq = eq,
        jugador_elegido = jugador_elegido,
        nombre_torneo = nombre_torneo,
        id_partida = id_partida) 


@app.route("/inscribirse", methods = ["GET", "POST"])
def pagina_inscribirse():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    #obtengo torneos
    cursor.execute("SELECT torneo_id, nombre, max_equipos FROM Torneos ORDER BY torneo_id")
    torneos = cursor.fetchall()
    #obtengo equipos
    cursor.execute("SELECT equipo_id, nombre FROM Equipos ORDER BY nombre")
    equipos = cursor.fetchall()

    if request.method == "POST":
        torneo_id = request.form.get("torneo_id")
        equipo_id = request.form.get("equipo_id")

        if not torneo_id or not equipo_id:
            flash("Debes seleccionar un torneo y un equipo.")
            cursor.close()
            conexion.close()
            return render_template("inscribirse.html", torneos = torneos, equipos=equipos)
        
        try:
            #1. Verificar equipos ya inscritos en el torneo
            cursor.execute("SELECT COUNT(*) FROM Inscripciones WHERE torneo_id = %s", (torneo_id,))
            inscritos = cursor.fetchone()[0]
            #2 obtener el max de equipos
            cursor.execute("SELECT max_equipos FROM Torneos WHERE torneo_id = %s", (torneo_id,))
            resultado_max_equipos = cursor.fetchone()

            if resultado_max_equipos is None:
                flash("El torneo no existe")
                cursor.close()
                conexion.close()
                return render_template("inscribirse.html", torneos = torneos, equipos=equipos)
            
            max_equipos = resultado_max_equipos[0]

            #3 Verificar si el equipo ya esta en el torneo
            cursor.execute("SELECT COUNT(*) FROM Inscripciones WHERE torneo_id = %s AND equipo_id = %s", (torneo_id, equipo_id))
            esta_inscrito = cursor.fetchone()[0]

            if esta_inscrito > 0:
                flash("Equipo ya inscrito en el torneo")
                cursor.close()
                conexion.close()
                return render_template("inscribirse.html", torneos = torneos, equipos=equipos)
            
            if inscritos >= max_equipos:
                flash("No se puede inscribir el equipo. Torneo lleno")
                cursor.close()
                conexion.close()
                return render_template("inscribirse.html", torneos = torneos, equipos=equipos)
            
            #si pasa todos los filtros se puede inscribir el equipo en la bdd
            cursor.execute("INSERT INTO Inscripciones(torneo_id, equipo_id) VALUES (%s, %s)", (torneo_id, equipo_id)
                           )
            
            conexion.commit()
            flash("Inscrito correctamente")
            cursor.close()
            conexion.close()
            return redirect(url_for("pagina_inscribirse"))
        
        except Exception as e:
            conexion.rollback()
            flash(f"Error al inscribir {e}")
    cursor.close()
    conexion.close()
    return render_template("inscribirse.html", torneos = torneos, equipos=equipos)


@app.route("/sponsors")
def pagina_sponsors():
    conexion = obtener_conexion()
    cursor= conexion.cursor()

    videojuego_selected = request.args.get("videojuego")
    cursor.execute("SELECT DISTINCT videojuego FROM Torneos")
    juegos = cursor.fetchall()

    sponsors = []
    if videojuego_selected:
        #division
        consulta = """ SELECT s.nombre, s.industria, SUM(p.monto_usd) AS monto_total
        FROM Sponsors s, Patrocinios p, Torneos t
        WHERE s.sponsor_id = p.sponsor_id AND p.torneo_id = t.torneo_id
        AND t.videojuego = %s
        GROUP BY s.sponsor_id, s.nombre, s.industria
        HAVING COUNT(DISTINCT t.torneo_id) = (SELECT COUNT(*) FROM Torneos WHERE videojuego = %s)
        ORDER BY monto_total DESC;"""
        cursor.execute(consulta, (videojuego_selected, videojuego_selected))
        sponsors = cursor.fetchall()
    cursor.close()
    conexion.close()

    return render_template(
        "sponsors.html", juegos=juegos, videojuego_selected=videojuego_selected, sponsors=sponsors
    )

@app.route("/torneos")
def pagina_torneos():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    id_torneo = request.args.get("id_torneo")
    
    lista_torneos = []
    posiciones = []
    partidas = []
    equipos_inscritos = []
    sponsors = []

    cursor.execute("SELECT torneo_id, nombre, videojuego FROM torneos")
    lista_torneos = cursor.fetchall()



    # primer SUM  CUENTA LOS GANADOS
    # segundo SUM CUENTA LOS EMPATES
    # tercer SUM CUENTA LAS DERROTAS
    # cuarto SUM calcula los puntos totales
    #Con el JOIN agarramos las partidas donde el equipo sea A o B
    # el Where para filtrar un torneo especifico y solo la fase de grupos
    # el group by para agrupar por equipo para usar COUNT y SUM
    #  Order By para ordenar las columas de la mayor a la menos (para abajo)
    if id_torneo:
        cursor.execute("""
            SELECT e.nombre,
            COUNT(p.partida_id),
            SUM(CASE WHEN (p.equipo_a_id = e.equipo_id AND p.puntaje_a > p.puntaje_b) OR (p.equipo_b_id = e.equipo_id AND p.puntaje_b > p.puntaje_a) THEN 1 ELSE 0 END),
            SUM(CASE WHEN p.puntaje_a = p.puntaje_b THEN 1 ELSE 0 END),
            SUM(CASE WHEN (p.equipo_a_id = e.equipo_id AND p.puntaje_a < p.puntaje_b) OR (p.equipo_b_id = e.equipo_id AND p.puntaje_b < p.puntaje_a) THEN 1 ELSE 0 END),
            SUM(CASE WHEN (p.equipo_a_id = e.equipo_id AND p.puntaje_a > p.puntaje_b) OR (p.equipo_b_id = e.equipo_id AND p.puntaje_b > p.puntaje_a) THEN 3 WHEN p.puntaje_a = p.puntaje_b THEN 1 ELSE 0 END)
            FROM equipos e
            JOIN partidas p ON e.equipo_id = p.equipo_a_id OR e.equipo_id = p.equipo_b_id
            WHERE p.torneo_id = %s AND p.fase = 'fase de grupos'
            GROUP BY e.equipo_id, e.nombre
            ORDER BY 6 DESC
        """, (id_torneo,))
        posiciones = cursor.fetchall()

        cursor.execute("""
            SELECT ea.nombre, eb.nombre, p.puntaje_a, p.puntaje_b, p.fase
            FROM partidas p
            JOIN equipos ea ON p.equipo_a_id = ea.equipo_id
            JOIN equipos eb ON p.equipo_b_id = eb.equipo_id
            WHERE p.torneo_id = %s
        """, (id_torneo,))
        partidas = cursor.fetchall()



        cursor.execute("""
            SELECT e.nombre, i.grupo
            FROM equipos e
            JOIN inscripciones i ON e.equipo_id = i.equipo_id
            WHERE i.torneo_id = %s
        """, (id_torneo,))
        equipos_inscritos = cursor.fetchall()


        
        cursor.execute("""
            SELECT s.nombre, s.industria
            FROM sponsors s
            JOIN patrocinios p ON s.sponsor_id = p.sponsor_id
            WHERE p.torneo_id = %s
        """, (id_torneo,))
        sponsors = cursor.fetchall()

    cursor.close()
    conexion.close()

    return render_template(
        "torneos.html",
        lista_torneos=lista_torneos,
        id_torneo=id_torneo,
        posiciones=posiciones,
        partidas=partidas,
        equipos_inscritos=equipos_inscritos,
        sponsors=sponsors)


@app.route("/estadisticas")
def pagina_estadisticas():
    conexion = obtener_conexion()
    cursor = conexion.cursor()

    #recibimos lo del html
    torneo_enviado = request.args.get("torneo_enviado")
    
    torneo_elegido = [] 
    datos_filtrados = []
    #sacamos lsos torneos de la base de datos
    cursor.execute("select torneo_id,nombre from torneos")
    torneo_elegido = cursor.fetchall() 

    print(type(torneo_enviado), torneo_enviado)
    print(type(torneo_enviado), torneo_enviado)
    print(type(torneo_enviado), torneo_enviado)
    print(type(torneo_enviado), torneo_enviado)
    print(type(torneo_enviado), torneo_enviado)
    print(type(torneo_enviado), torneo_enviado)

    if torneo_enviado:
        torneo_enviado = int(torneo_enviado)
        cursor.execute("""select j.gamertag, e.nombre, SUM (est.kos), SUM (est.restarts), SUM (est.assists), round(SUM(est.kos) * 1.0 / NULLIF(SUM(est.restarts), 0), 2) as ratio
        from estadisticas_jugadores est
        JOIN jugadores j on est.jugador_id = j.jugador_id
        join equipos e on j.equipo_id = e.equipo_id
        join partidas p on est.partida_id = p.partida_id
        where p.torneo_id = %s
        GROUP BY j.gamertag, e.nombre
        ORDER BY ratio DESC """,(torneo_enviado,))

        datos_filtrados = cursor.fetchall()
    print("RESULTADOS:", datos_filtrados)
    print("RESULTADOS:", datos_filtrados)
    print("RESULTADOS:", datos_filtrados)
    print("RESULTADOS:", datos_filtrados)

    cursor.close()
    conexion.close()

    return render_template(
        "estadisticas.html",
        torneo_elegido = torneo_elegido,
        torneo_enviado = torneo_enviado,
        datos_filtrados = datos_filtrados) 

    

if __name__ == "__main__":
    print("Iniciando el servidor en http://localhost:5000")
    app.run(debug=True)
