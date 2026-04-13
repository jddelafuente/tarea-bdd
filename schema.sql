CREATE TABLE Torneos (
    torneo_id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    videojuego VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    prize_pool INT NOT NULL, 
    max_equipos INT NOT NULL);

CREATE TABLE Sponsors (
    sponsor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    industria VARCHAR(100) NOT NULL);

CREATE TABLE Equipos (
    equipo_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    fecha_creacion DATE NOT NULL);

CREATE TABLE Jugadores (
    jugador_id SERIAL PRIMARY KEY,
    gamertag VARCHAR(50) UNIQUE NOT NULL,
    nombre_real VARCHAR(150) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    pais_origen VARCHAR(100) NOT NULL,
    equipo_id INT NOT NULL,
    es_capitan BOOLEAN DEFAULT FALSE, -- Solución instantánea sin usar ALTER TABLE
    FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id));

CREATE TABLE Inscripciones (
    torneo_id INT NOT NULL,
    equipo_id INT NOT NULL,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    grupo VARCHAR(1) CHECK (grupo IN ('A', 'B')), 
    PRIMARY KEY (torneo_id, equipo_id),
    FOREIGN KEY (torneo_id) REFERENCES Torneos(torneo_id),
    FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id));

CREATE TABLE Partidas (
    partida_id SERIAL PRIMARY KEY,
    torneo_id INT NOT NULL,
    equipo_a_id INT NOT NULL,
    equipo_b_id INT NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    puntaje_a INT DEFAULT 0,
    puntaje_b INT DEFAULT 0,
    fase VARCHAR(50) NOT NULL CHECK (fase IN ('fase de grupos', 'cuartos de final', 'semifinal', 'final')),
    FOREIGN KEY (torneo_id) REFERENCES Torneos(torneo_id),
    FOREIGN KEY (equipo_a_id) REFERENCES Equipos(equipo_id),
    FOREIGN KEY (equipo_b_id) REFERENCES Equipos(equipo_id),
    CONSTRAINT equipos_distintos CHECK (equipo_a_id <> equipo_b_id) );

CREATE TABLE Estadisticas_Jugadores (
    partida_id INT NOT NULL,
    jugador_id INT NOT NULL,
    kos INT DEFAULT 0,
    restarts INT DEFAULT 0,
    assists INT DEFAULT 0,
    PRIMARY KEY (partida_id, jugador_id),
    FOREIGN KEY (partida_id) REFERENCES Partidas(partida_id),
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(jugador_id));

CREATE TABLE Patrocinios (
    sponsor_id INT NOT NULL,
    torneo_id INT NOT NULL,
    monto_usd INT NOT NULL, -- Reemplazo de DECIMAL por INT
    PRIMARY KEY (sponsor_id, torneo_id),
    FOREIGN KEY (sponsor_id) REFERENCES Sponsors(sponsor_id),
    FOREIGN KEY (torneo_id) REFERENCES Torneos(torneo_id));
