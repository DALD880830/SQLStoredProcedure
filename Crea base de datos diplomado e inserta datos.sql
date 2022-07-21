--Creamos una base de datos para el diplomado
CREATE DATABASE diplomado;

USE diplomado;


/*Creamos una tabla y posteriormente le ingresamos
diferentes registros*/
CREATE TABLE cliente(
idCliente int primary key,
nombre varchar(40),
apellidos varchar(40),
direccion varchar(200),
telefono varchar(10)
);

SELECT * FROM cliente;

INSERT INTO cliente 
VALUES (1, 'Juan', 'Perez', 'Jardines del Ajusco', '5555555555');
INSERT INTO cliente 
VALUES (2, 'Pedro', 'Perez', 'Jardines del Ajusco', '5555555555');
INSERT INTO cliente 
VALUES (3, 'Luz', 'Perez', 'Jardines del Ajusco', '5555555555');
INSERT INTO cliente 
VALUES (4, 'Guadalupe', 'Perez', 'Jardines del Ajusco', '5555555555');
INSERT INTO cliente 
VALUES (5, 'Azucena', 'Perez', 'Jardines del Ajusco2', '5555555555');

UPDATE cliente SET apellidos = 'Martinez' 
WHERE idCliente = 3;

DELETE FROM cliente WHERE idCliente IN (4, 5);

/*Aqui ingresamos los datos 4 y 5*/
SELECT * FROM cliente WHERE idCliente > 1;

SELECT * FROM cliente WHERE idCliente BETWEEN 2 AND 4;
--Ordenamos por nombre, los acomoda alfabeticamente
SELECT * FROM cliente ORDER BY nombre; --Este es ascendente A-Z
SELECT * FROM cliente ORDER BY nombre DESC; --Este es descendente Z-A


INSERT INTO cliente VALUES(6,'Haydee','Meza','Narvarte','55567898');
INSERT INTO cliente VALUES(7,'Karina','Herrera','Del Valle','56666');
INSERT INTO cliente VALUES(8,'Efren','Garcia','Narvarte','5556788990');
INSERT INTO cliente VALUES(9,'Wendy','Garcia','Marquez','55667888');
INSERT INTO cliente VALUES(10,'Rosa','Herrera','Aceves','556678987');
INSERT INTO cliente VALUES(11,'Haydee','Meza','Narvarte','55567898');
INSERT INTO cliente VALUES(12,'Karina','Herrera','Del Valle','56666');
INSERT INTO cliente VALUES(13,'Efren','Garcia','Narvarte','5556788990');
INSERT INTO cliente VALUES(14,'Wendy','Garcia','Marquez','55667888');
INSERT INTO cliente VALUES(15,'Rosa','Herrera','Aceves','556678987');
