-- Una empresa almacena los datos de sus --empleados en una tabla llamada  empleados".
--1- Eliminamos la tabla, si existe y la creamos:
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  seccion varchar(20),
  primary key(documento)
 );

2- Ingrese algunos registros:
 insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

3- Elimine el procedimiento llamado "pa_empleados_sueldo" si existe:
 IF object_id('pa_empleados_sueldo') is not null
  DROP PROCEDURE pa_empleados_sueldo;

4- Cree un procedimiento almacenado llamado "pa_empleados_sueldo" que seleccione los 
nombres, apellidos y sueldos de los empleados que tengan un sueldo superior o igual al 
enviado como parámetro.
CREATE PROCEDURE pa_empleados_sueldo
@sueldo decimal(6,2)
AS
SELECT nombre, apellido, sueldo FROM empleados
WHERE sueldo >= @sueldo
;

5- Ejecute el procedimiento creado anteriormente con distintos valores:
 EXEC pa_empleados_sueldo 400;
 EXEC pa_empleados_sueldo 500;

6- Ejecute el procedimiento almacenado "pa_empleados_sueldo" sin parámetros.
Mensaje de error.
EXEC pa_empleados_sueldo;

7- Elimine el procedimiento almacenado "pa_empleados_actualizar_sueldo" si existe:
 IF object_id('pa_empleados_actualizar_sueldo') is not null
  DROP PROCEDURE pa_empleados_actualizar_sueldo;

8- Cree un procedimiento almacenado llamado "pa_empleados_actualizar_sueldo" que 
actualice los sueldos iguales al enviado como primer parámetro con el valor enviado 
como segundo parámetro.
CREATE PROCEDURE pa_empleados_actualizar_sueldo
@viejo decimal(6,2),
@nuevo decimal(6,2)
AS
UPDATE empleados SET sueldo = @nuevo
WHERE sueldo = @viejo
;

9- Ejecute el procedimiento creado anteriormente y verifique si se ha ejecutado correctamente:
 SELECT * FROM empleados;

10- Ejecute el procedimiento "pa_empleados_actualizar_sueldo" enviando un solo parámetro.
Error.
EXEC pa_empleados_actualizar_sueldo 350;

11- Ejecute el procedimiento almacenado "pa_empleados_actualizar_sueldo" enviando en 
primer lugar el parámetro @sueldonuevo y en segundo lugar @sueldoanterior (parámetros por nombre).
EXEC pa_empleados_actualizar_sueldo @nuevo=700, @viejo=350;

12- Verifique el cambio:
 SELECT * FROM empleados;

13- Elimine el procedimiento almacenado "pa_sueldototal", si existe:
 IF object_id('pa_sueldototal') is not null
  DROP PROCEDURE pa_sueldototal;

14- Cree un procedimiento llamado "pa_sueldototal" que reciba el documento 
de un empleado y muestre su nombre, apellido y el sueldo total (resultado de la suma 
del sueldo y salario por hijo, que es de $200 si el sueldo es menor a $500 y $100, 
si el sueldo es mayor o igual a $500). 
Coloque como valor por defecto para el parámetro el patrón "%".
CREATE PROCEDURE pa_sueldototal
@documento char(8) = '%'
AS
DECLARE @salario INT 
SELECT @salario = sueldo FROM empleados
WHERE documento LIKE @documento
DECLARE @hijos INT
SELECT @hijos = cantidadhijos FROM empleados
WHERE documento LIKE @documento
IF (@salario < 500)
SELECT nombre, apellido, SUM(sueldo+(200*@hijos)) AS sueldoTotal
		FROM empleados
		WHERE documento LIKE @documento
		GROUP BY nombre, apellido
ELSE 
SELECT nombre, apellido, SUM(sueldo+(100*@hijos)) AS sueldoTotal
		FROM empleados
		WHERE documento LIKE @documento
		GROUP BY nombre, apellido
;

CREATE PROCEDURE pruebita_sueldo
@documento char(8) = '%'
AS
BEGIN
DECLARE @salario INT
    SELECT 
        @salario = sueldo
    FROM
        empleados
    WHERE
         documento LIKE @documento
DECLARE @hijos INT
	SELECT 
        @hijos = cantidadhijos
    FROM
        empleados
    WHERE
         documento LIKE @documento
    IF (@salario > 500)
	BEGIN
       SELECT nombre, apellido, SUM(sueldo+(100*@hijos)) AS sueldoTotal
		FROM empleados
		WHERE documento LIKE @documento
		GROUP BY nombre, apellido
	END
	ELSE BEGIN
		SELECT nombre, apellido, SUM(sueldo+(200*@hijos)) AS sueldoTotal
		FROM empleados
		WHERE documento LIKE @documento
		GROUP BY nombre, apellido
		END
END

if object_id('pruebita_sueldo') is not null
  drop procedure pruebita_sueldo;

EXEC pruebita_sueldo '22333333';
EXEC pruebita_sueldo '22666666';
EXEC pruebita_sueldo default;

SELECT * FROM empleados;

15- Ejecute el procedimiento anterior enviando diferentes valores:
 EXEC pa_sueldototal '22333333';
 EXEC pa_sueldototal '22444444';
 EXEC pa_sueldototal '22666666';

16-  Ejecute el procedimiento sin enviar parámetro para que tome el valor por defecto.
Muestra los 5 registros.
EXEC pa_sueldototal default;