DROP DATABASE IF EXISTS libreria_cf;

CREATE DATABASE IF NOT EXISTS libreria_cf;

USE libreria_cf;

/*  ¿Que tipo de entidades? autores
Nombre: autores 
*/ 

CREATE TABLE IF NOT EXISTS autores (
    autor_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
    seudonimo VARCHAR(50) UNIQUE,
    genero ENUM('M', 'F'), -- M O F
    fecha_nacimiento DATE NOT NULL,
    pais_origen VARCHAR(40) NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp 
);

CREATE TABLE libros(
    libro_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    autor_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250),
    paginas INTEGER UNSIGnED,
    fecha_publicacion DATE NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp,

    FOREIGN KEY (autor_id) REFERENCES autores(autor_id)
);

--  Crea una tabla a partir de otra
-- CREATE TABLE usuarios LIKE autores;

/*
INSERT INTO autores (autor_id, nombre, apellido, genero, fecha_nacimiento, pais_origen)
VALUES (1, 'Test Autor', 'Test Autor', 'M', '2018-01-30', 'Mexico');

INSERT INTO autores (autor_id, nombre)
VALUES (1, 'Test Autor');

*/
-- Multiples Autores
-- INSERT INTO autores (autor_id, nombre, apellido, genero, fecha_nacimiento, pais_origen) VALUES 
-- (1, 'Test Autor', 'Test Autor', 'M', '2018-01-30', 'Mexico'),
-- (2, 'Test Autor', 'Test Autor', 'M', '2018-01-30', 'Mexico'),
-- (3, 'Test Autor', 'Test Autor', 'M', '2018-01-30', 'Mexico'),
-- (4, 'Test Autor', 'Test Autor', 'M', '2018-01-30', 'Mexico'),
-- (5, 'Test Autor', 'Test Autor', 'M', '2018-01-30', 'Mexico');


INSERT INTO autores (nombre, apellido, seudonimo,genero, fecha_nacimiento, pais_origen) VALUES 
( 'Stephen Edwinfdfd', 'Kingfdfd', 'Richard Bachmanfdaaaa', 'M', '1947-09-07', 'USA'),
( 'Stephen Edwinf', 'Kingf', 'Richard Bachmanf', 'M', '1947-09-07', 'USA');

INSERT INTO libros (autor_id, titulo, fecha_publicacion) VALUES
(1, 'Carrie', '1974-01-01'),
(1, 'Carrie', '1974-01-01'),
(1, 'Carrie', '1974-01-01'),
(2, 'Nuevo Libro', '1986-01-01'),
(2, 'Nuevo Libro', '1986-01-01'),
(2, 'Nuevo Libro', '1986-01-01'),
(2, 'Nuevo Libro', '1986-01-01'),
(2, 'Nuevo Libro', '1986-01-01'),
(2, 'Nuevo Libro', '1986-01-01');

SELECT * FROM autores;
SELECT * FROM libros;

/** NOTAS */
-- ENUM -> Reinstriccion a una lista pequeña
-- UNSIGED se previene la insersion de numeros negativos