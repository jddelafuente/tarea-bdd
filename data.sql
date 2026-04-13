

---------------------------------------------------
-- Datos generados por IA (GPT)
---------------------------------------------------

-- =========================
-- EQUIPOS
-- =========================
INSERT INTO Equipos (nombre, fecha_creacion, capitan_id) VALUES
('Andes Wolves', '2020-03-10', NULL),
('Pacific Titans', '2021-07-22', NULL),
('Desert Vipers', '2019-11-05', NULL),
('Southern Foxes', '2022-01-18', NULL),
('Crimson Hawks', '2020-06-14', NULL),
('Neon Jaguars', '2021-09-09', NULL),
('Storm Breakers', '2018-12-03', NULL),
('Shadow Ravens', '2022-04-27', NULL),
('Golden Bears', '2023-02-11', NULL),
('Frost Giants', '2021-05-30', NULL);

-- =========================
-- JUGADORES (5 por equipo)
-- =========================
INSERT INTO Jugadores (gamertag, nombre_real, email, fecha_nacimiento, pais_origen, equipo_id) VALUES
-- Equipo 1
('wolf_alpha', 'Diego Perez', 'wolf_alpha@test.com', '2000-05-14', 'Chile', 1),
('wolf_beta', 'Matias Soto', 'wolf_beta@test.com', '1999-08-21', 'Chile', 1),
('wolf_gamma', 'Tomas Rojas', 'wolf_gamma@test.com', '2001-01-10', 'Argentina', 1),
('wolf_delta', 'Ignacio Vera', 'wolf_delta@test.com', '2002-11-03', 'Peru', 1),
('wolf_epsilon', 'Nicolas Diaz', 'wolf_epsilon@test.com', '2000-06-17', 'Chile', 1),

-- Equipo 2
('titan_alpha', 'Felipe Mena', 'titan_alpha@test.com', '1998-09-09', 'Chile', 2),
('titan_beta', 'Joaquin Ruiz', 'titan_beta@test.com', '2001-03-12', 'Argentina', 2),
('titan_gamma', 'Benjamin Cruz', 'titan_gamma@test.com', '2000-12-01', 'Chile', 2),
('titan_delta', 'Vicente Lara', 'titan_delta@test.com', '1999-04-30', 'Uruguay', 2),
('titan_epsilon', 'Sebastian Flores', 'titan_epsilon@test.com', '2002-07-25', 'Chile', 2),

-- Equipo 3
('viper_alpha', 'Martin Salas', 'viper_alpha@test.com', '2000-02-19', 'Chile', 3),
('viper_beta', 'Cristobal Nunez', 'viper_beta@test.com', '2001-10-08', 'Chile', 3),
('viper_gamma', 'Lucas Paredes', 'viper_gamma@test.com', '1999-07-15', 'Argentina', 3),
('viper_delta', 'Alonso Fuentes', 'viper_delta@test.com', '2002-09-02', 'Peru', 3),
('viper_epsilon', 'Bruno Castro', 'viper_epsilon@test.com', '2000-01-27', 'Chile', 3),

-- Equipo 4
('fox_alpha', 'Gabriel Morales', 'fox_alpha@test.com', '1998-12-20', 'Chile', 4),
('fox_beta', 'Emilio Torres', 'fox_beta@test.com', '2001-05-05', 'Chile', 4),
('fox_gamma', 'Franco Riquelme', 'fox_gamma@test.com', '2000-08-18', 'Argentina', 4),
('fox_delta', 'Pablo Navarrete', 'fox_delta@test.com', '1999-11-11', 'Chile', 4),
('fox_epsilon', 'Javier Espinoza', 'fox_epsilon@test.com', '2002-02-09', 'Uruguay', 4),

-- Equipo 5
('hawk_alpha', 'Raul Herrera', 'hawk_alpha@test.com', '1999-03-22', 'Chile', 5),
('hawk_beta', 'Daniel Campos', 'hawk_beta@test.com', '2001-06-13', 'Chile', 5),
('hawk_gamma', 'Esteban Leiva', 'hawk_gamma@test.com', '2000-04-01', 'Peru', 5),
('hawk_delta', 'Hector Moya', 'hawk_delta@test.com', '2002-10-30', 'Chile', 5),
('hawk_epsilon', 'Kevin Silva', 'hawk_epsilon@test.com', '1998-07-07', 'Argentina', 5),

-- Equipo 6
('jaguar_alpha', 'Mauricio Pinto', 'jaguar_alpha@test.com', '2000-09-17', 'Chile', 6),
('jaguar_beta', 'Rodrigo Acuna', 'jaguar_beta@test.com', '1999-01-29', 'Chile', 6),
('jaguar_gamma', 'Oscar Gallardo', 'jaguar_gamma@test.com', '2001-08-08', 'Peru', 6),
('jaguar_delta', 'Alan Bustos', 'jaguar_delta@test.com', '2002-03-14', 'Argentina', 6),
('jaguar_epsilon', 'Patricio Ramos', 'jaguar_epsilon@test.com', '2000-11-23', 'Chile', 6),

-- Equipo 7
('storm_alpha', 'Simon Araya', 'storm_alpha@test.com', '1998-05-12', 'Chile', 7),
('storm_beta', 'Renato Caceres', 'storm_beta@test.com', '2001-01-16', 'Chile', 7),
('storm_gamma', 'Gonzalo Yanez', 'storm_gamma@test.com', '1999-10-21', 'Argentina', 7),
('storm_delta', 'Adrian Valencia', 'storm_delta@test.com', '2002-06-28', 'Peru', 7),
('storm_epsilon', 'Cristian Pino', 'storm_epsilon@test.com', '2000-12-19', 'Chile', 7),

-- Equipo 8
('raven_alpha', 'Alexis Sepulveda', 'raven_alpha@test.com', '2000-04-04', 'Chile', 8),
('raven_beta', 'Fernando Ibarra', 'raven_beta@test.com', '2001-09-15', 'Chile', 8),
('raven_gamma', 'Matheo Delgado', 'raven_gamma@test.com', '1999-02-26', 'Argentina', 8),
('raven_delta', 'Damian Saez', 'raven_delta@test.com', '2002-08-07', 'Uruguay', 8),
('raven_epsilon', 'Ricardo Olivares', 'raven_epsilon@test.com', '2000-10-10', 'Chile', 8),

-- Equipo 9
('bear_alpha', 'Andres Contreras', 'bear_alpha@test.com', '1999-07-01', 'Chile', 9),
('bear_beta', 'Miguel Alarcon', 'bear_beta@test.com', '2000-03-03', 'Chile', 9),
('bear_gamma', 'Carlos Zamora', 'bear_gamma@test.com', '2001-11-20', 'Peru', 9),
('bear_delta', 'Julian Venegas', 'bear_delta@test.com', '2002-01-31', 'Argentina', 9),
('bear_epsilon', 'Ivan Figueroa', 'bear_epsilon@test.com', '1998-06-06', 'Chile', 9),

-- Equipo 10
('frost_alpha', 'Eduardo Sanhueza', 'frost_alpha@test.com', '2000-02-02', 'Chile', 10),
('frost_beta', 'Marco Tapia', 'frost_beta@test.com', '1999-09-09', 'Chile', 10),
('frost_gamma', 'Bastian Loyola', 'frost_gamma@test.com', '2001-07-27', 'Argentina', 10),
('frost_delta', 'Samuel Naranjo', 'frost_delta@test.com', '2002-05-18', 'Peru', 10),
('frost_epsilon', 'Diego Cifuentes', 'frost_epsilon@test.com', '2000-12-12', 'Chile', 10);

-- =========================
-- CAPITANES
-- =========================
UPDATE Equipos SET capitan_id = 1 WHERE equipo_id = 1;
UPDATE Equipos SET capitan_id = 6 WHERE equipo_id = 2;
UPDATE Equipos SET capitan_id = 11 WHERE equipo_id = 3;
UPDATE Equipos SET capitan_id = 16 WHERE equipo_id = 4;
UPDATE Equipos SET capitan_id = 21 WHERE equipo_id = 5;
UPDATE Equipos SET capitan_id = 26 WHERE equipo_id = 6;
UPDATE Equipos SET capitan_id = 31 WHERE equipo_id = 7;
UPDATE Equipos SET capitan_id = 36 WHERE equipo_id = 8;
UPDATE Equipos SET capitan_id = 41 WHERE equipo_id = 9;
UPDATE Equipos SET capitan_id = 46 WHERE equipo_id = 10;

-- =========================
-- TORNEOS
-- =========================
INSERT INTO Torneos (nombre, videojuego, fecha_inicio, fecha_fin, prize_pool, max_equipos) VALUES
('Copa Apertura 2026', 'League of Legends', '2026-04-01', '2026-04-20', 8000.00, 8),
('Masters Santiago 2026', 'Valorant', '2026-05-05', '2026-05-18', 6000.00, 6),
('Winter Clash 2026', 'Counter-Strike 2', '2026-06-10', '2026-06-22', 7000.00, 8);

-- =========================
-- INSCRIPCIONES
-- Torneo 1: 8 equipos completos
-- =========================
INSERT INTO Inscripciones (torneo_id, equipo_id) VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),

-- Torneo 2: 4 equipos
(2,2),(2,4),(2,9),(2,10),

-- Torneo 3: 3 equipos
(3,1),(3,5),(3,9);

-- =========================
-- SPONSORS
-- =========================
INSERT INTO Sponsors (nombre, industria) VALUES
('Red Dragon Tech', 'Tecnologia'),
('EnergyMax', 'Bebidas'),
('NovaWear', 'Ropa'),
('HyperX Arena', 'Perifericos'),
('PixelBank', 'Finanzas');

-- =========================
-- PATROCINIOS
-- =========================
INSERT INTO Patrocinios (sponsor_id, torneo_id, monto_usd) VALUES
(1, 1, 2500.00),
(2, 1, 1500.00),
(3, 1, 1000.00),
(4, 2, 3000.00),
(5, 2, 2000.00),
(1, 3, 1800.00),
(2, 3, 1200.00),
(5, 3, 2500.00);

-- =========================
-- PARTIDAS TORNEO 1
-- =========================
INSERT INTO Partidas (partida_id, torneo_id, equipo_a_id, equipo_b_id, fecha_hora, puntaje_a, puntaje_b, fase) VALUES
(1, 1, 1, 2, '2026-04-02 18:00:00', 2, 1, 'fase de grupos'),
(2, 1, 1, 3, '2026-04-03 18:00:00', 1, 1, 'fase de grupos'),
(3, 1, 1, 4, '2026-04-04 18:00:00', 3, 0, 'fase de grupos'),
(4, 1, 2, 3, '2026-04-05 18:00:00', 0, 2, 'fase de grupos'),
(5, 1, 2, 4, '2026-04-06 18:00:00', 1, 1, 'fase de grupos'),
(6, 1, 3, 4, '2026-04-07 18:00:00', 2, 0, 'fase de grupos'),

(7, 1, 5, 6, '2026-04-08 18:00:00', 2, 1, 'fase de grupos'),
(8, 1, 5, 7, '2026-04-09 18:00:00', 1, 2, 'fase de grupos'),
(9, 1, 5, 8, '2026-04-10 18:00:00', 3, 1, 'fase de grupos'),
(10, 1, 6, 7, '2026-04-11 18:00:00', 0, 2, 'fase de grupos'),
(11, 1, 6, 8, '2026-04-12 18:00:00', 1, 1, 'fase de grupos'),
(12, 1, 7, 8, '2026-04-13 18:00:00', 2, 0, 'fase de grupos'),

(13, 1, 1, 5, '2026-04-16 19:00:00', 2, 0, 'semifinal'),
(14, 1, 7, 3, '2026-04-16 21:00:00', 1, 2, 'semifinal'),
(15, 1, 1, 3, '2026-04-20 20:00:00', 3, 2, 'final');
-- =========================
-- PARTIDAS TORNEO 2
-- Equipos 2, 4, 9, 10
-- =========================
INSERT INTO Partidas (partida_id, torneo_id, equipo_a_id, equipo_b_id, fecha_hora, puntaje_a, puntaje_b, fase) VALUES
(16, 2, 2, 9,  '2026-05-12 18:00:00', 2, 1, 'semifinal'),
(17, 2, 4, 10, '2026-05-12 20:00:00', 0, 2, 'semifinal'),
(18, 2, 2, 10, '2026-05-18 20:00:00', 3, 2, 'final');

-- =========================
-- PARTIDAS TORNEO 3
-- Equipos 1, 5, 9
-- =========================
INSERT INTO Partidas (partida_id, torneo_id, equipo_a_id, equipo_b_id, fecha_hora, puntaje_a, puntaje_b, fase) VALUES
(19, 3, 1, 5, '2026-06-12 18:00:00', 2, 0, 'fase de grupos'),
(20, 3, 1, 9, '2026-06-14 18:00:00', 1, 1, 'fase de grupos'),
(21, 3, 5, 9, '2026-06-16 18:00:00', 2, 1, 'fase de grupos');

-- =========================
-- ESTADISTICAS COMPLETAS TORNEO 1
-- 10 filas por partida
-- =========================
INSERT INTO Estadisticas_Jugadores (partida_id, jugador_id, kos, restarts, assists) VALUES
-- Partida 1: equipo 1 vs 2
(1, 1, 10, 3, 5),
(1, 2, 7, 4, 6),
(1, 3, 5, 2, 8),
(1, 4, 3, 5, 4),
(1, 5, 6, 3, 7),
(1, 6, 8, 6, 3),
(1, 7, 4, 7, 5),
(1, 8, 6, 4, 2),
(1, 9, 2, 5, 6),
(1, 10, 3, 6, 4),

-- Partida 2: equipo 1 vs 3
(2, 1, 8, 4, 7),
(2, 2, 6, 5, 5),
(2, 3, 7, 3, 6),
(2, 4, 2, 4, 4),
(2, 5, 5, 3, 8),
(2, 11, 8, 4, 5),
(2, 12, 5, 5, 6),
(2, 13, 6, 3, 7),
(2, 14, 3, 4, 3),
(2, 15, 4, 4, 5),

-- Partida 3: equipo 1 vs 4
(3, 1, 11, 2, 6),
(3, 2, 9, 3, 5),
(3, 3, 4, 2, 9),
(3, 4, 3, 4, 4),
(3, 5, 7, 2, 8),
(3, 16, 4, 8, 3),
(3, 17, 3, 7, 2),
(3, 18, 2, 6, 4),
(3, 19, 1, 7, 3),
(3, 20, 0, 8, 1),

-- Partida 4: equipo 2 vs 3
(4, 6, 2, 7, 4),
(4, 7, 3, 6, 5),
(4, 8, 1, 5, 2),
(4, 9, 0, 4, 3),
(4, 10, 2, 6, 4),
(4, 11, 9, 2, 5),
(4, 12, 7, 3, 6),
(4, 13, 6, 2, 7),
(4, 14, 3, 3, 4),
(4, 15, 5, 2, 5),

-- Partida 5: equipo 2 vs 4
(5, 6, 6, 4, 5),
(5, 7, 5, 5, 4),
(5, 8, 3, 4, 6),
(5, 9, 2, 6, 3),
(5, 10, 4, 5, 5),
(5, 16, 6, 4, 4),
(5, 17, 5, 5, 5),
(5, 18, 2, 4, 6),
(5, 19, 1, 5, 2),
(5, 20, 3, 6, 3),

-- Partida 6: equipo 3 vs 4
(6, 11, 10, 3, 6),
(6, 12, 7, 4, 7),
(6, 13, 8, 2, 5),
(6, 14, 4, 3, 4),
(6, 15, 6, 2, 8),
(6, 16, 3, 7, 2),
(6, 17, 2, 6, 3),
(6, 18, 1, 5, 2),
(6, 19, 0, 7, 1),
(6, 20, 2, 6, 2),

-- Partida 7: equipo 5 vs 6
(7, 21, 9, 3, 5),
(7, 22, 7, 4, 6),
(7, 23, 6, 2, 7),
(7, 24, 3, 5, 4),
(7, 25, 5, 3, 6),
(7, 26, 7, 6, 4),
(7, 27, 4, 7, 3),
(7, 28, 3, 5, 2),
(7, 29, 2, 6, 5),
(7, 30, 1, 7, 4),

-- Partida 8: equipo 5 vs 7
(8, 21, 5, 5, 6),
(8, 22, 4, 4, 5),
(8, 23, 3, 3, 7),
(8, 24, 2, 5, 4),
(8, 25, 4, 4, 6),
(8, 31, 8, 3, 5),
(8, 32, 7, 4, 4),
(8, 33, 6, 2, 6),
(8, 34, 3, 3, 5),
(8, 35, 5, 2, 7),

-- Partida 9: equipo 5 vs 8
(9, 21, 11, 2, 5),
(9, 22, 8, 3, 6),
(9, 23, 7, 2, 7),
(9, 24, 5, 4, 5),
(9, 25, 6, 3, 8),
(9, 36, 6, 5, 4),
(9, 37, 4, 6, 3),
(9, 38, 3, 5, 2),
(9, 39, 2, 6, 4),
(9, 40, 1, 5, 3),

-- Partida 10: equipo 6 vs 7
(10, 26, 3, 7, 4),
(10, 27, 2, 6, 5),
(10, 28, 1, 5, 3),
(10, 29, 0, 6, 2),
(10, 30, 2, 7, 4),
(10, 31, 9, 2, 6),
(10, 32, 8, 3, 5),
(10, 33, 7, 2, 7),
(10, 34, 4, 3, 4),
(10, 35, 6, 2, 8),

-- Partida 11: equipo 6 vs 8
(11, 26, 6, 4, 5),
(11, 27, 5, 5, 6),
(11, 28, 4, 3, 4),
(11, 29, 2, 4, 3),
(11, 30, 3, 5, 5),
(11, 36, 6, 4, 4),
(11, 37, 5, 5, 5),
(11, 38, 4, 3, 6),
(11, 39, 2, 4, 3),
(11, 40, 3, 5, 4),

-- Partida 12: equipo 7 vs 8
(12, 31, 10, 3, 6),
(12, 32, 8, 4, 5),
(12, 33, 7, 2, 7),
(12, 34, 4, 3, 4),
(12, 35, 6, 2, 8),
(12, 36, 4, 7, 3),
(12, 37, 3, 6, 2),
(12, 38, 2, 5, 4),
(12, 39, 1, 6, 3),
(12, 40, 0, 7, 1),

-- Partida 13: semifinal equipo 1 vs 5
(13, 1, 9, 2, 6),
(13, 2, 7, 3, 5),
(13, 3, 6, 2, 7),
(13, 4, 4, 4, 4),
(13, 5, 5, 3, 8),
(13, 21, 5, 6, 4),
(13, 22, 4, 5, 5),
(13, 23, 3, 4, 3),
(13, 24, 2, 5, 4),
(13, 25, 1, 6, 2),

-- Partida 14: semifinal equipo 7 vs 3
(14, 31, 6, 5, 4),
(14, 32, 5, 4, 5),
(14, 33, 4, 3, 6),
(14, 34, 2, 4, 3),
(14, 35, 3, 5, 4),
(14, 11, 8, 3, 6),
(14, 12, 7, 4, 5),
(14, 13, 6, 2, 7),
(14, 14, 4, 3, 4),
(14, 15, 5, 2, 8),

-- Partida 15: final equipo 1 vs 3
(15, 1, 12, 3, 6),
(15, 2, 9, 4, 5),
(15, 3, 8, 2, 8),
(15, 4, 5, 3, 4),
(15, 5, 7, 2, 7),
(15, 11, 10, 4, 5),
(15, 12, 8, 5, 6),
(15, 13, 7, 3, 7),
(15, 14, 4, 4, 4),
(15, 15, 6, 3, 6);

-- =========================
-- ESTADISTICAS TORNEO 2 Y 3
-- =========================
INSERT INTO Estadisticas_Jugadores (partida_id, jugador_id, kos, restarts, assists) VALUES
-- Partida 16: equipo 2 vs 9
(16, 6, 9, 3, 5),
(16, 7, 7, 4, 6),
(16, 8, 6, 3, 4),
(16, 9, 4, 5, 3),
(16, 10, 5, 4, 5),
(16, 41, 7, 5, 4),
(16, 42, 5, 6, 3),
(16, 43, 4, 5, 2),
(16, 44, 3, 6, 4),
(16, 45, 2, 5, 3),

-- Partida 17: equipo 4 vs 10
(17, 16, 3, 7, 4),
(17, 17, 2, 6, 3),
(17, 18, 1, 5, 2),
(17, 19, 0, 6, 1),
(17, 20, 2, 7, 3),
(17, 46, 9, 2, 6),
(17, 47, 8, 3, 5),
(17, 48, 7, 2, 7),
(17, 49, 4, 3, 4),
(17, 50, 6, 2, 8),

-- Partida 18: equipo 2 vs 10
(18, 6, 10, 4, 5),
(18, 7, 8, 5, 6),
(18, 8, 7, 3, 4),
(18, 9, 5, 4, 5),
(18, 10, 6, 3, 6),
(18, 46, 9, 5, 4),
(18, 47, 7, 6, 5),
(18, 48, 6, 4, 6),
(18, 49, 4, 5, 3),
(18, 50, 5, 4, 4),

-- Partida 19: equipo 1 vs 5
(19, 1, 8, 3, 6),
(19, 2, 7, 4, 5),
(19, 3, 6, 2, 7),
(19, 4, 4, 3, 4),
(19, 5, 5, 2, 8),
(19, 21, 5, 6, 3),
(19, 22, 4, 5, 4),
(19, 23, 3, 4, 3),
(19, 24, 2, 5, 2),
(19, 25, 1, 6, 2),

-- Partida 20: equipo 1 vs 9
(20, 1, 6, 4, 5),
(20, 2, 5, 5, 4),
(20, 3, 4, 3, 6),
(20, 4, 3, 4, 4),
(20, 5, 4, 3, 7),
(20, 41, 6, 4, 5),
(20, 42, 5, 5, 4),
(20, 43, 4, 3, 6),
(20, 44, 3, 4, 4),
(20, 45, 4, 3, 5),

-- Partida 21: equipo 5 vs 9
(21, 21, 9, 3, 5),
(21, 22, 7, 4, 6),
(21, 23, 6, 2, 7),
(21, 24, 4, 3, 4),
(21, 25, 5, 2, 8),
(21, 41, 7, 5, 4),
(21, 42, 5, 6, 3),
(21, 43, 4, 4, 5),
(21, 44, 3, 5, 3),
(21, 45, 2, 6, 2);