CREATE TABLE Equipos (
    equipo_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    fecha_creacion DATE NOT NULL,
    capitan_id INT
);

CREATE TABLE Jugadores (
    jugador_id SERIAL PRIMARY KEY,
    gamertag VARCHAR(50) UNIQUE NOT NULL,
    nombre_real VARCHAR(150) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    pais_origen VARCHAR(100) NOT NULL,
    equipo_id INT NOT NULL,
    FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id));

-- Restricción para capitanes (crear luego de jugadores)
ALTER TABLE Equipos ADD CONSTRAINT fk_capitan 
FOREIGN KEY (capitan_id) REFERENCES Jugadores(jugador_id);

CREATE TABLE Torneos (
    torneo_id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    videojuego VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    prize_pool DECIMAL(12, 2) NOT NULL,
    max_equipos INT NOT NULL CHECK (max_equipos > 0),
    CHECK (fecha_fin >= fecha_inicio)
    );


CREATE TABLE Inscripciones (
    torneo_id INT NOT NULL,
    equipo_id INT NOT NULL,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (torneo_id, equipo_id),
    FOREIGN KEY (torneo_id) REFERENCES Torneos(torneo_id),
    FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id));


CREATE TABLE Partidas (
    partida_id SERIAL PRIMARY KEY,
    torneo_id INT NOT NULL,
    equipo_a_id INT NOT NULL,
    equipo_b_id INT NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    puntaje_a INT DEFAULT 0 CHECK (puntaje_a >= 0),
    puntaje_b INT DEFAULT 0 CHECK (puntaje_b >= 0),
    fase VARCHAR(50) NOT NULL CHECK (fase IN ('fase de grupos', 'cuartos de final', 'semifinal', 'final')),
    FOREIGN KEY (torneo_id) REFERENCES Torneos(torneo_id),
    FOREIGN KEY (equipo_a_id) REFERENCES Equipos(equipo_id),
    FOREIGN KEY (equipo_b_id) REFERENCES Equipos(equipo_id),
    CONSTRAINT equipos_distintos CHECK (equipo_a_id <> equipo_b_id));


CREATE TABLE Estadisticas_Jugadores (
    partida_id INT NOT NULL,
    jugador_id INT NOT NULL,
    kos INT DEFAULT 0 CHECK (kos >= 0),
    restarts INT DEFAULT 0 CHECK (restarts >= 0),
    assists INT DEFAULT 0 CHECK (assists >= 0),
    PRIMARY KEY (partida_id, jugador_id),
    FOREIGN KEY (partida_id) REFERENCES Partidas(partida_id),
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(jugador_id));


CREATE TABLE Sponsors (
    sponsor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    industria VARCHAR(100) NOT NULL); 


CREATE TABLE Patrocinios (
    sponsor_id INT NOT NULL,
    torneo_id INT NOT NULL,
    monto_usd DECIMAL(12, 2) NOT NULL CHECK (monto_usd > 0),
    PRIMARY KEY (sponsor_id, torneo_id),
    FOREIGN KEY (sponsor_id) REFERENCES Sponsors(sponsor_id),
    FOREIGN KEY (torneo_id) REFERENCES Torneos(torneo_id));

