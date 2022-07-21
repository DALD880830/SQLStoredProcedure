
--Crear un SP sin parámetros 
--Crear SP_crear_libros
CREATE PROCEDURE SP_crear_libros 
 AS
-- Elimina si existe la tabla de libros
  if object_id('libros')is not null --Si existe objeto(tabla) libros la borra
   DROP TABLE libros
--Crea la tabla de libros
  CREATE TABLE libros(
   idcodigolibro int identity, --identity indica el valor de inicio de la secuencia y el incremento
   titulo varchar(40),
   autor varchar(30),
   editorial varchar(20),
   precio decimal(5,2),
   cantidad smallint,
   primary key(idcodigolibro)
  )
  --INSERTA REGISTROS
  INSERT INTO libros VALUES('Uno','Richard Bach','Planeta',15,5)
  INSERT INTO libros VALUES('Ilusiones','Richard Bach','Planeta',18,50)
  INSERT INTO libros VALUES('El aleph','Borges','Emece',25,9)
  INSERT INTO libros VALUES('Aprenda PHP','Mario Molina','Nuevo siglo',45,100)
  INSERT INTO libros VALUES('Matematica estas ahi','Paenza','Nuevo siglo',12,50)
  INSERT INTO libros VALUES('Java en 10 minutos','Mario Molina','Paidos',35,300)
  ; --Agregar punto y coma (;) en la última instrucción del SP
  --AQUI TERMINA EL STORED PROCEDURE


--Ejecutar el procedimiento:
 EXEC SP_crear_libros;
 --En la forma larga es EXECUTE SP_crear_libros;

--Verificar si se creo la tabla "libros", generada por el SP
 SELECT * FROM libros;

--Ejecutar el SP del sistema "sp_help" y el nombre del procedimiento almacenado para 
--verificar que existe el procedimiento creado recientemente:
 EXEC sp_help SP_crear_libros;
--Aparece el nombre, propietario, tipo y fecha/hora de creación.

--Eliminamos el storedprocedure
 DROP PROC SP_crear_libros;



--2. Generar un SP que muestre los libros de los cuales hay menos de 10.
--Eliminar si existe el SP: SP_libros_limite_stock
 if object_id('SP_libros_limite_stock') is not null
  DROP PROCEDURE SP_libros_limite_stock;

--Crear el SP:

 CREATE PROC SP_libros_limite_stock
  AS
   SELECT * FROM libros
   WHERE cantidad >=10;
--Ejecutar el SP del sistema "sp_help" junto al nombre del procedimiento creado recientemente 
--para verificar que existe:

 EXEC sp_help SP_libros_limite_stock;
--Aparece el nombre, propietario, tipo y fecha/hora de creación.

--Lo ejecutamos:
 EXEC SP_libros_limite_stock;

--Modificamos algún registro y volvemos a ejecutar el procedimiento:
 UPDATE libros SET cantidad=2 WHERE idcodigolibro=4;

 EXEC SP_libros_limite_stock;

 CREATE PROC SP_libros_limite_stock
  AS
 SELECT titulo, editorial, precio FROM libros WHERE precio >20;