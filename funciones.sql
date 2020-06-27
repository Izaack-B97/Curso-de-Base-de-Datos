DELIMITER //

CREATE FUNCTION agregar_dias(fecha DATE, dias INT) RETURNS DATE
BEGIN
    RETURN fecha + INTERVAL dias DAY;
END//


CREATE FUNCTION holaMundo() RETURNS VARCHAR(20)
BEGIN
    RETURN ‘HolaMundo’;
END//

DELIMITER ;

-- lISTAR FUNCIONES
SELECT name FROM mysql.proc WHERE db = database() AND type = 'FUNCTION';
DROP FUNCTION agregar_dias; -- Elimina una funcion

-- Ejecutar sentencias dentro de funciones
DELIMITER //

CREATE FUNCTION obtener_paginas() RETURNS INT
BEGIN 
    SET @paginas = (SELECT (ROUND( RAND() * 100 ) * 4));
    RETURN @paginas;
END//

DELIMITER ;

UPDATE libros SET paginas = obtener_paginas();

-- Ordenacion
SELECT titulo FROM libros ORDER BY titulo;
SELECT titulo FROM libros ORDER BY titulo DESC;
SELECT libro_id, titulo FROM libros ORDER BY libro_id AND titulo ASC;

-- Limitar los registros
SELECT titulo FROM libros LIMIT 10;
SELECT libro_id, titulo FROM libros LIMIT 0, 5; -- Paginacion
