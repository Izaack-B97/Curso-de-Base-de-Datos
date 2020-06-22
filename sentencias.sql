/*  ¿Que tipo de entidades? autores
Nombre: autores 
*/ 

CREATE TABLE autores (
    autor_id INT,
    nombre VARCHAR(25),
    apellido VARCHAR(25),
    genero CHAR(1), -- M O F
    fecha_nacimiento DATE,
    pais_origen VARCHAR(40)
);