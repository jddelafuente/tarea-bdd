# Tarea 1: Torneo de Gaming - IIC2413

**Integrantes:** José Daniel De La Fuente Werlinger, Jorge Antonio Muena Hidalgo


# Credenciales 

 - la tarea solicita las credenciales con valores por defecto, db_host = localhost, db_port = 5432, db_user = postgres, db_password = postgres, db_name = tarea 1. Tenerlo en cuenta

# Dependencias

-pip install Flask
-pip install psycopg2-binary

# Requisitos:

- PostgreSQL (14 o superior)
- Python 3.12 o superior

# Configuracion de la base de datos:

- paso 1: crear una base de datos en PosgreSQL llamada tarea1

- paso 2: copiar y pegar el esquema (schema.sql) y despues los datos que usamos nosotros basados en valorant o cualquier dato correspondiente a la tabla 

# Correr la app:

- correr el archivo app.py, esto puede hacerlo de la consola de su escritor de codigo como VS o en la consola hacer un "cd ruta de la tarea en una consola" y hacer python prueba.py (prueba es el nombre de el programa main)

- Irse al navegador y escribir http://localhost:5000 en el buscador

#  Aclaraciones:

- Durante la creacion notamos algunos datos curiosos que no iban incluidos en la tarea pero creemos son importantes de explicar.

- La tarea no solicita la creacion de brackets o fases de grupos, por lo que un equipo al inscribirse Solo aparecera como inscrito en la pagina de torneos, pero no aparecera en ningun bracket ni grupo.

- La Tarea solicita los sponsors que han auspiciado TODOS los torneos de un videojuego especifico (nuestra base de datos no incluye ningun sponsor que cumpla la condicion por lo que para facilitar la prueba facilitamos un codigo para copiar y pegar en PostgreSQL):

WITH nuevo_sponsor AS (
    INSERT INTO Sponsors (nombre, industria)
    VALUES ('SPONSOR_TEST', 'INDUSTRIA_TEST')
    RETURNING sponsor_id)
INSERT INTO Patrocinios (sponsor_id, torneo_id, monto_usd)
SELECT 
    (SELECT sponsor_id FROM nuevo_sponsor), -- ID del sponsor recién creado
    torneo_id,                              -- ID de cada torneo que cumpla la condición
    5000                                    -- Monto en USD (puedes ajustar este valor)
FROM Torneos
WHERE videojuego = 'Valorant'

- Como explicamos en el Informe, nuestro esquema para tener al capitan de un equipo es que jugadores tienen una columna extra con valor booleano para saber si un jugador es capitan de un equipo, la tarea no lo exige pero en caso de tener que controlar eso lo hariamos del backend. tener consideracion de esto en caso de agregar data.

- en la parte de requerimientos del cliente dice :
    Las fases posibles son: fase de grupos, cuartos de final, semifinal,
    final. El formato del torneo es: 8 equipos divididos en 2 grupos de 4, round-robin dentro de cada grupo, los 2 mejores de cada grupo avanzan a semifinales, luego final.
 esto es contradictorio debido a que jamas podemos llegar a cuartos de final si solo tenemos dos grupos (para llegar a cuartos necesitariamos 4 grupos y el enunciado dice que solo trabajemos con 2 "El formato del torneo es: 8 equipos divididos en 2 grupos de 4"). Nuestra desicion de diseño fue mantener la fase en el dominio del esquema (cuartos) por si en algun contexto especifico (los 4 ganadores anteriores estan automaticamente en cuartos de final, por ejemplo) o algun razonamiento diferente tenemos cuartos de final de todos modos.
 




