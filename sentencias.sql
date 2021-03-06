DROP DATABASE IF EXISTS libreria_cf;

CREATE DATABASE IF NOT EXISTS libreria_cf;

USE libreria_cf;

/*
    ¿Que tipo de entidades? autores
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
    ventas INT DEFAULT 10,

    FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE

    -- ALTER TABLE libros ADD FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
);

CREATE TABLE usuarios(
    usuario_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellidos VARCHAR(25),
    username VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp
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
( 'Stephen Edwinf', 'Kingf', 'Richard Bachmanf', 'M', '1947-09-07', 'USA'),
('J.D.', 'Salinger', 'JD Sal', 'M', '1920-10-05', 'USA'),
('F. Scott.', 'Fitzgerald', 'DSSC',  'M', '1920-05-01', 'USA'),
('Jane', 'Austen', 'JNA', 'F', '1910-10-05', 'UK'),
('Scott', 'Hanselman', 'SH', 'M', '1975-02-28', 'USA'),
('Jason N.', 'Gaylord', 'El Gringo', 'M','1918-06-10' ,'USA'),
('Pranav', 'Rastogi', 'Rinho', 'M', '1950-06-12', 'India'),
('Todd', 'Miranda', 'Tdd', 'M', '1968-12-10', 'USA'),
('Christian', 'Wenz', 'Wewer', 'M', '1967-04-12', 'USA');

INSERT INTO libros (autor_id, titulo, fecha_publicacion) VALUES
(1, 'Carrie', '1974-01-01'),
(2, 'Nuevo Libro', '1986-01-01'),
(1, 'The Catcher in the Rye', '1956-10-14'),
(2, 'Nine Stories', '1969-01-13'),
(3, 'Franny and Zooey', '1920-10-10'),
(4, 'The Great Gatsby', '1936-12-10'),
(5, 'Tender id the Night', '1945-06-01'),
(6, 'Pride and Prejudice', '1930-11-25'),
(7, 'Professional ASP.NET 4.5 in C# and VB', '1937-05-28');

INSERT INTO usuarios(nombre, apellidos, username, email) VALUES
('Eduardo', 'Garcia', 'eduardogpg', 'eduardo@codigofacilito.com'),
('Codi', 'Facilito', 'codigofacilito', 'ayuda@codigofacilito.com');

SELECT * FROM autores;
SELECT * FROM libros;

/** NOTAS */

-- ENUM -> Reinstriccion a una lista pequeña
-- UNSIGED se previene la insersion de numeros negativos

-- Si necesitamos validar el valor único de una combinación de columnas lo haremos de la siguiente manera.
-- En este caso queremos validar que la combinación de nombre, apellido y matricula sean unicas en la tabla.

-- CREATE TABLE usuarios( 
--   usuario_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
--   nombre VARCHAR(50),
--   apellido VARCHAR(50),
--   matricula VARCHAR(10),
--   CONSTRAINT unique_combinacion UNIQUE (nombre, apellido, matricula),
--   PRIMARY KEY (usuario_id)
-- );

-- OPERADORES LOGICOS
-- AND 
-- OR
-- NOT

-- CONDICIONANDO NULLOS
-- select * from autores where seudonimo is not  null;
-- select * from autores where seudonimo is null;
-- select * from autores where seudonimo <=> null; <=> Operador de seguridad


-- Rangos
SELECT titulo, fecha_publicacion FROM libros WHERE fecha_publicacion BETWEEN '1995-01-01' AND '2015-01-31';

-- Obteniendo una  consulta a travez de una lista
SELECT * FROM libros WHERE titulo IN ('Carrie', 'Nuevo libro', 'Example');

-- Valores unicos en una consulta
SELECT DISTINCT titulo FROM libros;

-- Alias
SELECT autor_id AS autor, titulo FROM libros;
SELECT  9 * 10 AS Resultado;
SELECT autor_id AS autor, titulo AS nombre FROM libros AS books; 
SELECT books.autor_id AS books.autor, titulo AS nombre FROM libros AS books; 

-- CRUD
UPDATE libros SET descripcion = 'Nueva Descripcion' WHERE titulo = 'El Hobbit';
DELETE FROM libros HHERE autor_id = 1; 

-- Restauracion de una tabla 
TRUNCATE TABLE libros -- Elimina todos los registros de una tabla, resetea la definicion de la tabla

/* FUNCIONES */
-- Strings
SELECT CONCAT(nombre, " ",apellido) From autores; -- concat concatena strings, puede resivir cualquier no. de argumentos
SELECT LENGTH("hOLA MUNDO"); -- Longitud
SELECT UPPER(nombre), LOWER(nombre) FROM autores; -- Mayusculas y minusculas
SELECT TRIM("     cadena con espacios al inicio y al final     "); -- Limía espacios al princio y al final
SELECT LEFT("Esta es una cadena de caracteres", 5) AS susbstring_izq, RIGHT("Esta es una cadena de caracteres", 10) AS susbstring_der; -- Optiene subtrings

-- Numeros
select rand(); -- Numeros flotantes
select round( rand() * 100 ); -- Numero ´positivo flotante
SELECT TRUNCATE(1.123456789, 3); -- trunca el numero de decimales
SELECT POW(2,16);--Eleva a una potencia

-- Fechas
select now(); -- Fecha actual
@now = NOW();
SELECT SECOND(@now), MINUTE(@now), HOUR(@now), MONTH(@now), YEAR(@now);
SELECT DAYOFWEEK(@now), DAYOFMONTH(@now), DAYOFYEAR(@now);
SELECT DATE(@now); -- TIMESTAM OF DATE
SELECT * FROM libros WHERE DATE(fecha_creacion) = CURDATE(); -- Libros que se crearon el dia de hoy
SELECT @now + INTERVAL 30 DAYS; -- Suma dias a la fecha (SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, YEAR)

-- Condicones
SELECT IF(10 > 9, "El numero si es mayor", "El numero no es mayor");
SELECT IF(paginas = 0, "El libro no posee paginas", paginas) FROM libros;

SELECT IFNULL(seudonimo, "El autor no cuenta con un seudonimo") FROM autores;

-- Busqueda mediante strings
SELECT * FROM libros WHERE titulo LIKE 'Franny%'; -- ASubstring al principio de una cadena
SELECT * FROM libros WHERE titulo LIKE '%Zooey';  -- Al final de una caadena
SELECT * FROM libros WHERE titulo LIKE '%a%'; -- Entre la cadena 
SELECT * FROM libros WHERE titulo LIKE '__r___'; -- Titulo con 6 caracteres y la tewrcer letra sea r
select * from libros where titulo like '_a%'; -- Segundo caracter en el principio sea a

SELECT autor_id, titulo FROM libros WHERE titulo LIKE 'H%' OR LIKE 'L%'; 
SELECT autor_id, titulo FROM libros  WHERE LEFT(titulo, 1) = 'H' OR RIGHT(titulo, 1) = 'L';

-- Expresiones regulares
 SELECT titulo FROM libros WHERE titulo REGEXP '^[HL]'; -- Comienza H y termina con L

 -- Ordenacion
SELECT titulo FROM libros ORDER BY titulo;
SELECT titulo FROM libros ORDER BY titulo DESC;
SELECT libro_id, titulo FROM libros ORDER BY libro_id AND titulo ASC;

-- Limitar los registros
SELECT titulo FROM libros LIMIT 10;
SELECT libro_id, titulo FROM libros LIMIT 0, 5; -- Paginacion

/* FUNCIONES DE AGREGACION */
 SELECT COUNT(*) FROM autores; -- Acepta las columnas, y es un contador
 SELECT SUM(ventas) FROM libros; -- Suma los valores
 SELECT MAX(ventas) FROM libros; -- Valor Maximo
 SELECT MIN(ventas) FROM libros; -- Valor Minimo
 SELECT AVG(ventas) FROM libros; -- Promedio

 -- Algo interesante es que solo se tomaran los registros que posean un valor

 -- Agrupamiento
SELECT autor_id, SUM(ventas) AS Total FROM libros GROUP BY autor_id;
SELECT autor_id, SUM(ventas) AS Total FROM libros GROUP BY autor_id ORDER BY Total ASC LIMIT 1;

-- Heaving -> Se usa en vez del where 
SELECT auntor_id, SUM(ventas) AS Total FROM libros GROUP BY autor_id HAVING SUMA(ventas) > 1000;

-- Unir dos consultas
SELECT CONCAT(nombre, " ", apellido) AS nombre_completo FROM autores 
UNION 
SELECT CONCAT(nombre, " ", apellidos) AS nombre_completo FROM usuarios;

SELECT CONCAT(nombre, " ", apellido) AS nombre_completo, "" AS email FROM autores 
UNION 
SELECT CONCAT(nombre, " ", apellidos) AS nombre_completo, email AS email FROM usuarios;

/* SUBCONSULTAS*/
SET @promedio = (SELECT AVG(ventas) FROM libros);
SELECT autor_id, ventas FROM libros GROUP BY autor_id HAVING SUM(ventas) > 10.0000;

SELECT autor_id FROM libros GROUP BY autor_id 
HAVING SUM(ventas) > (SELECT AVG(ventas) FROM libros); 

SELECT CONCAT(nombre, " ", apellido) AS autores FROM autores
WHERE autor_id 
IN ( 
    SELECT autor_id FROM libros GROUP BY autor_id 
    HAVING SUM(ventas) > (SELECT AVG(ventas) FROM libros)
);

-- Validar Registros
SELECT IF(
    EXISTS(SELECT libro_id FROM libros WHERE titulo = 'El Hobbit'),
    'Disponible',
    'No disponible'
) AS mensaje;

/* EJERCICIOS */
-- Obtener todos los libros escritos por autores que cuenten con un seudónimo.

SELECT titulo, autor_id FROM libros WHERE autor_id IN ( SELECT autor_id FROM autores WHERE seudonimo IS NOT NULL )

--Obtener el título de todos los libros publicados a partir de 1990 cuyos autores poseen un pseudónimo.
SELECT titulo, autor_id FROM libros WHERE autor_id IN ( SELECT autor_id FROM autores WHERE seudonimo IS NOT NULL ) AND fecha_publicacion > '1990-01-01'

--Obtener todos los libros escritos por autores que cuenten con un seudónimo y que hayan nacido ante de 1950.

SELECT titulo, autor_id FROM libros WHERE autor_id IN ( SELECT autor_id FROM autores WHERE seudonimo IS NOT NULL AND fecha_nacimiento < '1950-01-01');

--Colocar el mensaje no disponible a la columna descripción, en todos los libros publicados antes del año 2000.



/* JOINS */
--Inner join, elementos que se encuentren en la interseccion de dos tablas
SELECT 
    libros.titulo, 
    CONCAT(autores.nombre, " ", autores.apellido) AS nombre_autor, 
    libros.fecha_creacion 
FROM libros AS li
INNER JOIN autores AS au 
ON li.autor_id = au.autor_id;
