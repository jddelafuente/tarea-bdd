-- ==============================================================================
-- DATOS GENERADOS POR IA (GEMINI)
-- ==============================================================================



-- ==============================================================================
-- 1. TABLAS INDEPENDIENTES: Torneos, Sponsors, Equipos
-- ==============================================================================

-- Se crean 3 torneos. El primero tiene un máximo de 8 equipos.
INSERT INTO Torneos (nombre, videojuego, fecha_inicio, fecha_fin, prize_pool, max_equipos) VALUES 
('VCT 2026: Masters Madrid', 'Valorant', '2026-03-14', '2026-03-24', 500000, 8),
('VCT 2026: Masters Shanghai', 'Valorant', '2026-05-23', '2026-06-09', 1000000, 12),
('Valorant Champions 2026', 'Valorant', '2026-08-01', '2026-08-25', 2250000, 16);

-- Se crean 5 sponsors.
INSERT INTO Sponsors (nombre, industria) VALUES 
('Red Bull', 'Bebidas Energéticas'),
('Secretlab', 'Mobiliario'),
('Mastercard', 'Finanzas'),
('HyperX', 'Periféricos'),
('AWS', 'Tecnología');

-- Se crean 10 equipos.
INSERT INTO Equipos (nombre, fecha_creacion) VALUES 
('Leviatan', '2020-11-01'),        -- 1
('Sentinels', '2018-06-06'),       -- 2
('KRU Esports', '2020-10-15'),     -- 3
('LOUD', '2019-02-28'),            -- 4
('Paper Rex', '2020-01-01'),       -- 5
('Fnatic', '2004-07-23'),          -- 6
('Natus Vincere', '2009-12-17'),   -- 7
('DRX', '2012-01-01'),             -- 8
('Gen.G', '2017-01-01'),           -- 9
('Team Heretics', '2016-08-24');   -- 10

-- ==============================================================================
-- 2. TABLAS DEPENDIENTES (NIVEL 1): Jugadores, Patrocinios, Inscripciones
-- ==============================================================================

-- Se crean 50 jugadores (5 por equipo con 1 capitán por equipo).
INSERT INTO Jugadores (gamertag, nombre_real, email, fecha_nacimiento, pais_origen, equipo_id, es_capitan) VALUES 
-- Equipo 1: Leviatan
('kiNgg', 'Francisco Aravena', 'kingg@lev.gg', '2001-05-12', 'Chile', 1, TRUE),
('aspas', 'Erick Santos', 'aspas@lev.gg', '2003-06-15', 'Brasil', 1, FALSE),
('tex', 'Ian Botsch', 'tex@lev.gg', '1999-09-18', 'Alemania', 1, FALSE),
('C0M', 'Corbin Lee', 'com@lev.gg', '2000-06-25', 'EEUU', 1, FALSE),
('Mazino', 'Roberto Rivas', 'mazino@lev.gg', '2001-05-02', 'Chile', 1, FALSE),
-- Equipo 2: Sentinels
('Johnqt', 'Mouhamed Ouarid', 'johnqt@sen.gg', '1999-03-23', 'Marruecos', 2, TRUE),
('TenZ', 'Tyson Ngo', 'tenz@sen.gg', '2001-05-05', 'Canada', 2, FALSE),
('Zellsis', 'Jordan Montemurro', 'zellsis@sen.gg', '1998-03-02', 'EEUU', 2, FALSE),
('Sacy', 'Gustavo Rossi', 'sacy@sen.gg', '1997-12-02', 'Brasil', 2, FALSE),
('Zekken', 'Zachary Patrone', 'zekken@sen.gg', '2005-03-14', 'EEUU', 2, FALSE),
-- Equipo 3: KRU
('Klaus', 'Nicolas Ferrari', 'klaus@kru.gg', '2001-04-18', 'Argentina', 3, TRUE),
('keznit', 'Angelo Mori', 'keznit@kru.gg', '2000-11-20', 'Chile', 3, FALSE),
('Shyy', 'Fabian Usnayo', 'shyy@kru.gg', '2004-01-20', 'Chile', 3, FALSE),
('Melser', 'Marco Amaro', 'melser@kru.gg', '2001-05-10', 'Chile', 3, FALSE),
('heat', 'Olavo Marcelo', 'heat@kru.gg', '2003-02-15', 'Brasil', 3, FALSE),
-- Equipo 4: LOUD
('Saadhak', 'Matias Delipetro', 'saadhak@loud.gg', '1997-03-09', 'Argentina', 4, TRUE),
('Less', 'Felipe Basso', 'less@loud.gg', '2005-02-24', 'Brasil', 4, FALSE),
('pANcada', 'Bryan Luna', 'pancada@loud.gg', '1999-11-04', 'Brasil', 4, FALSE),
('tuyz', 'Arthur Machado', 'tuyz@loud.gg', '2003-10-15', 'Brasil', 4, FALSE),
('cauanzin', 'Cauan Pereira', 'cauanzin@loud.gg', '2005-08-11', 'Brasil', 4, FALSE),
-- Equipo 5: Paper Rex
('d4v41', 'Khalish Rusyaidee', 'd4v41@prx.gg', '1998-10-14', 'Malasia', 5, TRUE),
('f0rsakeN', 'Jason Susanto', 'f0rsaken@prx.gg', '2004-03-25', 'Indonesia', 5, FALSE),
('mindfreak', 'Aaron Leonhart', 'mindfreak@prx.gg', '1999-10-04', 'Indonesia', 5, FALSE),
('something', 'Ilya Petrov', 'something@prx.gg', '2002-02-11', 'Rusia', 5, FALSE),
('Jinggg', 'Wang Jing Jie', 'jinggg@prx.gg', '2003-07-29', 'Singapur', 5, FALSE),
-- Equipo 6: Fnatic
('Boaster', 'Jake Howlett', 'boaster@fnc.gg', '1995-05-25', 'UK', 6, TRUE),
('Derke', 'Nikita Sirmitev', 'derke@fnc.gg', '2003-02-06', 'Finlandia', 6, FALSE),
('Alfajer', 'Emir Beder', 'alfajer@fnc.gg', '2005-06-08', 'Turquia', 6, FALSE),
('Leo', 'Leo Jannesson', 'leo@fnc.gg', '2003-12-15', 'Suecia', 6, FALSE),
('Chronicle', 'Timofey Khromov', 'chronicle@fnc.gg', '2002-08-16', 'Rusia', 6, FALSE),
-- Equipo 7: NAVI
('ANGE1', 'Kyrylo Karasov', 'ange1@navi.gg', '1989-09-09', 'Ucrania', 7, TRUE),
('Shao', 'Andrey Kiprsky', 'shao@navi.gg', '2000-01-14', 'Rusia', 7, FALSE),
('Zyppan', 'Pontus Eek', 'zyppan@navi.gg', '2002-07-26', 'Suecia', 7, FALSE),
('SUYGETSU', 'Dmitry Ilyushin', 'suygetsu@navi.gg', '2002-06-15', 'Rusia', 7, FALSE),
('ardiis', 'Ardis Svarenieks', 'ardiis@navi.gg', '1998-05-01', 'Letonia', 7, FALSE),
-- Equipo 8: DRX
('stax', 'Kim Gu-taek', 'stax@drx.gg', '2000-02-16', 'Corea del Sur', 8, TRUE),
('BuZz', 'Yu Byung-chul', 'buzz@drx.gg', '2003-01-13', 'Corea del Sur', 8, FALSE),
('MaKo', 'Kim Myeong-gwan', 'mako@drx.gg', '2002-01-21', 'Corea del Sur', 8, FALSE),
('Foxy9', 'Jung Jae-sung', 'foxy9@drx.gg', '2004-10-15', 'Corea del Sur', 8, FALSE),
('BeYN', 'Kang Ha-bin', 'beyn@drx.gg', '2003-05-28', 'Corea del Sur', 8, FALSE),
-- Equipo 9: Gen.G
('Munchkin', 'Byeon Sang-beom', 'munchkin@geng.gg', '1998-03-27', 'Corea del Sur', 9, TRUE),
('t3xture', 'Kim Na-ra', 't3xture@geng.gg', '1999-07-20', 'Corea del Sur', 9, FALSE),
('Meteor', 'Kim Tae-o', 'meteor@geng.gg', '1999-12-25', 'Corea del Sur', 9, FALSE),
('Lakia', 'Kim Jong-min', 'lakia@geng.gg', '2000-12-24', 'Corea del Sur', 9, FALSE),
('Karon', 'Kim Won-tae', 'karon@geng.gg', '2002-10-10', 'Corea del Sur', 9, FALSE),
-- Equipo 10: Team Heretics
('Boo', 'Ričardas Lukaševičius', 'boo@heretics.gg', '1998-03-01', 'Lituania', 10, TRUE),
('MiniBoo', 'Dominykas Lukaševičius', 'miniboo@heretics.gg', '2005-07-15', 'Lituania', 10, FALSE),
('RieNs', 'Enes Ecirli', 'riens@heretics.gg', '2005-09-02', 'Turquia', 10, FALSE),
('Wo0t', 'Mert Alkan', 'woot@heretics.gg', '2006-03-14', 'Turquia', 10, FALSE),
('benjyfishy', 'Benjy Fish', 'benjy@heretics.gg', '2004-04-02', 'UK', 10, FALSE);

-- Asignación de Sponsors a Torneos
INSERT INTO Patrocinios (sponsor_id, torneo_id, monto_usd) VALUES 
(1, 1, 100000), (2, 1, 50000), (3, 1, 200000),
(1, 2, 150000), (4, 2, 75000), (5, 2, 300000);

-- Inscripciones del Torneo 1 (Llenamos el cupo de 8 equipos distribuidos en 2 grupos).
INSERT INTO Inscripciones (torneo_id, equipo_id, grupo) VALUES 
(1, 1, 'A'), (1, 2, 'A'), (1, 3, 'A'), (1, 4, 'A'), -- Grupo A
(1, 5, 'B'), (1, 6, 'B'), (1, 7, 'B'), (1, 8, 'B'); -- Grupo B


-- ==============================================================================
-- 3. TABLAS DEPENDIENTES (NIVEL 2): Partidas (Torneo Completo) 
-- ==============================================================================

INSERT INTO Partidas (torneo_id, equipo_a_id, equipo_b_id, fecha_hora, puntaje_a, puntaje_b, fase) VALUES 
-- FASE DE GRUPOS (Round Robin: todos contra todos en su grupo)
-- Grupo A (Partidas 1 a 6)
(1, 1, 2, '2026-03-14 10:00:00', 2, 1, 'fase de grupos'), -- 1v2 (Gana 1)
(1, 3, 4, '2026-03-14 14:00:00', 0, 2, 'fase de grupos'), -- 3v4 (Gana 4)
(1, 1, 3, '2026-03-15 10:00:00', 2, 0, 'fase de grupos'), -- 1v3 (Gana 1)
(1, 2, 4, '2026-03-15 14:00:00', 2, 1, 'fase de grupos'), -- 2v4 (Gana 2)
(1, 1, 4, '2026-03-16 10:00:00', 1, 2, 'fase de grupos'), -- 1v4 (Gana 4)
(1, 2, 3, '2026-03-16 14:00:00', 2, 0, 'fase de grupos'), -- 2v3 (Gana 2)
-- Clasifican del Grupo A: Equipo 2 (Sentinels) y Equipo 4 (LOUD) / Equipo 1 queda fuera por diferencia.

-- Grupo B (Partidas 7 a 12)
(1, 5, 6, '2026-03-17 10:00:00', 1, 2, 'fase de grupos'), -- 5v6 (Gana 6)
(1, 7, 8, '2026-03-17 14:00:00', 0, 2, 'fase de grupos'), -- 7v8 (Gana 8)
(1, 5, 7, '2026-03-18 10:00:00', 2, 0, 'fase de grupos'), -- 5v7 (Gana 5)
(1, 6, 8, '2026-03-18 14:00:00', 2, 1, 'fase de grupos'), -- 6v8 (Gana 6)
(1, 5, 8, '2026-03-19 10:00:00', 2, 1, 'fase de grupos'), -- 5v8 (Gana 5)
(1, 6, 7, '2026-03-19 14:00:00', 2, 0, 'fase de grupos'), -- 6v7 (Gana 6)
-- Clasifican del Grupo B: Equipo 6 (Fnatic) y Equipo 5 (Paper Rex).

-- SEMIFINALES (Partidas 13 y 14)
(1, 2, 5, '2026-03-21 12:00:00', 2, 1, 'semifinal'), -- Semifinal 1: A1 vs B2 (Gana 2)
(1, 6, 4, '2026-03-21 16:00:00', 2, 0, 'semifinal'), -- Semifinal 2: B1 vs A2 (Gana 6)

-- FINAL (Partida 15)
(1, 2, 6, '2026-03-24 15:00:00', 3, 2, 'final'); -- Final: 2 vs 6 (Gana 2 - Sentinels Campeón)


-- ==============================================================================
-- 4. TABLAS DEPENDIENTES (NIVEL 3): Estadísticas Jugadores
-- ==============================================================================
-- Para asegurar datos para "todas las partidas", usamos una consulta 
-- automatizada basada en los equipos que jugaron cada partida. 
-- Esto genera 10 filas por partida (5 de cada equipo) con KOs, restarts y assists aleatorios realistas.

INSERT INTO Estadisticas_Jugadores (partida_id, jugador_id, kos, restarts, assists)
SELECT 
    p.partida_id,
    j.jugador_id,
    floor(random() * 25 + 5)::INT as kos,       -- Entre 5 y 30 kills
    floor(random() * 20 + 5)::INT as restarts,  -- Entre 5 y 25 deaths
    floor(random() * 15 + 2)::INT as assists    -- Entre 2 y 17 asistencias
FROM Partidas p
JOIN Equipos e ON e.equipo_id = p.equipo_a_id OR e.equipo_id = p.equipo_b_id
JOIN Jugadores j ON j.equipo_id = e.equipo_id;