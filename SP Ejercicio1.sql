-- Una escuela almacena los datos de sus profesores en una tabla llamada "profesores".
1- Eliminamos la tabla, si existe y la creamos:
 if object_id('profesores') is not null
  drop table profesores;
 
 create table profesores(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  seccion varchar(20),
  primary key(documento)
 );

2- Ingrese algunos registros:
 insert into profesores values('22222222','Juan','Perez',300,2,'Contaduria');
 insert into profesores values('22333333','Luis','Lopez',350,0,'Contaduria');
 insert into profesores values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into profesores values('22555555','Susana','Garcia',null,2,'Secretaria');
 insert into profesores values('22666666','Jose Maria','Morales',460,3,'Secretaria');
 insert into profesores values('22777777','Andres','Perez',580,3,'Sistemas');
 insert into profesores values('22888888','Laura','Garcia',400,3,'Secretaria');

3- Elimine el procedimiento llamado "pa_seccion" si existe:
 if object_id('pa_seccion') is not null
  drop procedure pa_seccion;

4- Cree un procedimiento almacenado llamado "pa_seccion" al cual le enviamos el nombre de una sección y que nos retorne 
el promedio de sueldos de todos los profesores de esa sección y el valor mayor de sueldo (de esa sección)
SELECT * FROM profesores;

CREATE PROCEDURE pa_seccion
@seccion varchar(30) = '%',
@promedio decimal(6,2) output
AS
SELECT @promedio = AVG(sueldo) FROM profesores
WHERE seccion LIKE @seccion
SELECT MAX(sueldo) FROM profesores
WHERE seccion LIKE @seccion
;

5- Ejecute el procedimiento creado anteriormente con distintos valores.
DECLARE @promedio decimal(6,2)
EXEC pa_seccion 'Contaduria', @promedio output
SELECT @promedio;

DECLARE @promedio decimal(6,2)
EXEC pa_seccion 'Sistemas', @promedio output
SELECT @promedio;

DECLARE @promedio decimal(6,2)
EXEC pa_seccion 'Secretaria', @promedio output
SELECT @promedio;


6- Ejecute el procedimiento "pa_seccion" sin pasar valor para el parámetro "sección". Luego muestre los valores devueltos por el procedimiento.
Calcula sobre todos los registros porque toma el valor por defecto.
DECLARE @promedio decimal(6,2)
EXEC pa_seccion default, @promedio output
SELECT @promedio;
