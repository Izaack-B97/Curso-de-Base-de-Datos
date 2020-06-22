DROP DATABASE IF EXISTS libreria_cf;

CREATE DATABASE IF NOT EXISTS libreria_cf;

USE libreria_cf;

/*  ¿Que tipo de entidades? autores
Nombre: autores 
*/ 

CREATE TABLE IF NOT EXISTS autores (
    autor_id INT,
    nombre VARCHAR(25),
    apellido VARCHAR(25),
    genero CHAR(1), -- M O F
    fecha_nacimiento DATE,
    pais_origen VARCHAR(40)
);

--  Crea una tabla a partir de otra
CREATE TABLE usuarios LIKE autores:

/*
INSERT INTO autores (autor_id, nombre, apellido, genero, fecha_nacimiento, pais_origen)
VALUES (1, 'Test Autor', 'Test Autor', 'M', '2018-01-30', 'Mexico');

INSERT INTO autores (autor_id, nombre)
VALUES (1, 'Test Autor');

*/
-- Multiples Autores
INSERT INTO autores (autor_id, nombre, apellido, genero, fecha_nacimiento, pais_origen) VALUES 
(1, 'Test Autor', 'Test Autor', 'M', '2018-01-30', 'Mexico'),
(2, 'Test Autor', 'Test Autor', 'M', '2018-01-30', 'Mexico'),
(3, 'Test Autor', 'Test Autor', 'M', '2018-01-30', 'Mexico'),
(4, 'Test Autor', 'Test Autor', 'M', '2018-01-30', 'Mexico'),
(5, 'Test Autor', 'Test Autor', 'M', '2018-01-30', 'Mexico');


SELECT * FROM autores;