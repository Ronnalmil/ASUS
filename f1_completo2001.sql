-- f1_2001_completa.sql
-- Base de datos F1 2001 COMPLETA con colores representativos
-- Ejecutar: psql -U postgres -f f1_2001_completa.sql

-- Crear y usar base de datos
DROP DATABASE IF EXISTS f1_2001;
CREATE DATABASE f1_2001;
\c f1_2001

-- Limpiar tablas existentes
DROP TABLE IF EXISTS resultados CASCADE;
DROP TABLE IF EXISTS pilotos CASCADE;
DROP TABLE IF EXISTS equipos CASCADE;

-- TABLA EQUIPOS con COLOR representativo (sin motor)
CREATE TABLE equipos (
    id_equipo SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    pais VARCHAR(30),
    color_representativo VARCHAR(20) NOT NULL
);

-- TABLA PILOTOS (todos los pilotos F1 2001 + color equipo)
CREATE TABLE pilotos (
    id_piloto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    equipo_id INTEGER REFERENCES equipos(id_equipo),
    nacionalidad VARCHAR(30),
    puntos_finales INTEGER DEFAULT 0,
    color_equipo VARCHAR(20)
);

-- Insertar TODOS los EQUIPOS F1 2001 con sus COLORES
INSERT INTO equipos (nombre, pais, color_representativo) VALUES
('Ferrari', 'Italia', 'Rojo'),
('McLaren-Mercedes', 'Reino Unido', 'Plata'),
('Williams-BMW', 'Reino Unido', 'Azul Blanco'),
('Sauber-Petronas', 'Suiza', 'Azul Plata'),
('Jordan-Honda', 'Irlanda', 'Amarillo'),
('BAR-Honda', 'Reino Unido', 'Azul Verde'),
('Jaguar-Cosworth', 'Reino Unido', 'Verde Plata'),
('Benetton-Renault', 'Italia', 'Azul Verde'),
('Prost-Acer', 'Francia', 'Azul Blanco'),
('Minardi-Europe', 'Italia', 'Rojo Negro'),
('Arrows-Asiatech', 'Reino Unido', 'Naranja');

-- Insertar TODOS los PILOTOS F1 2001 (39 pilotos únicos)
INSERT INTO pilotos (nombre, equipo_id, nacionalidad, puntos_finales, color_equipo) VALUES
-- Ferrari
(1, 'Michael Schumacher', 1, 'Alemania', 123, 'Rojo'),
(2, 'Rubens Barrichello', 1, 'Brasil', 56, 'Rojo'),
-- McLaren
(3, 'Mika Häkkinen', 2, 'Finlandia', 37, 'Plata'),
(4, 'David Coulthard', 2, 'Reino Unido', 65, 'Plata'),
-- Williams
(5, 'Ralf Schumacher', 3, 'Alemania', 49, 'Azul Blanco'),
(6, 'Juan Pablo Montoya', 3, 'Colombia', 31, 'Azul Blanco'),
-- Sauber
(7, 'Nick Heidfeld', 4, 'Alemania', 12, 'Azul Plata'),
(8, 'Kimi Räikkönen', 4, 'Finlandia', 9, 'Azul Plata'),
-- Jordan
(9, 'Jarno Trulli', 5, 'Italia', 12, 'Amarillo'),
(10, 'Heinz-Harald Frentzen', 5, 'Alemania', 6, 'Amarillo'),
(11, 'Ricardo Zonta', 5, 'Brasil', 0, 'Amarillo'),
(12, 'Jean Alesi', 5, 'Francia', 0, 'Amarillo'),
-- BAR
(13, 'Olivier Panis', 6, 'Francia', 7, 'Azul Verde'),
(14, 'Jacques Villeneuve', 6, 'Canadá', 12, 'Azul Verde'),
-- Jaguar
(15, 'Eddie Irvine', 7, 'Reino Unido', 6, 'Verde Plata'),
(16, 'Pedro de la Rosa', 7, 'España', 0, 'Verde Plata'),
(17, 'Luciano Burti', 7, 'Brasil', 0, 'Verde Plata'),
-- Benetton
(18, 'Giancarlo Fisichella', 8, 'Italia', 8, 'Azul Verde'),
(19, 'Jenson Button', 8, 'Reino Unido', 0, 'Azul Verde'),
-- Prost
(20, 'Jean Alesi', 9, 'Francia', 2, 'Azul Blanco'),
(21, 'Gastón Mazzacane', 9, 'Argentina', 0, 'Azul Blanco'),
(22, 'Luciano Burti', 9, 'Brasil', 0, 'Azul Blanco'),
(23, 'Heinz-Harald Frentzen', 9, 'Alemania', 0, 'Azul Blanco'),
(24, 'Tomáš Enge', 9, 'República Checa', 0, 'Azul Blanco'),
-- Minardi
(25, 'Fernando Alonso', 10, 'España', 0, 'Rojo Negro'),
(26, 'Tarso Marques', 10, 'Brasil', 0, 'Rojo Negro'),
(27, 'Alex Yoong', 10, 'Malasia', 0, 'Rojo Negro'),
-- Arrows
(28, 'Jos Verstappen', 11, 'Países Bajos', 1, 'Naranja'),
(29, 'Enrique Bernoldi', 11, 'Brasil', 0, 'Naranja');

-- VISTA PREVIA: Mostrar Base de Datos Completa F1 2001
SELECT '=== EQUIPOS F1 2001 ===' AS titulo;
SELECT id_equipo, nombre, pais, color_representativo FROM equipos ORDER BY nombre;

SELECT '=== PILOTOS TOP 10 POR PUNTOS ===' AS titulo;
SELECT p.nombre, e.nombre as equipo, p.nacionalidad, p.puntos_finales, p.color_equipo
FROM pilotos p 
JOIN equipos e ON p.equipo_id = e.id_equipo 
ORDER BY p.puntos_finales DESC LIMIT 10;

SELECT '=== TOTAL PILOTOS: ' || COUNT(*) || ' (Todos los F1 2001)' AS estadistica 
FROM pilotos;

SELECT '=== BASE DE DATOS F1 2001 CREADA EXITOSAMENTE ===' AS final;
