CREATE PROCEDURE SP_eliminar_libros 
 AS
-- Elimina si existe la tabla de libros
	if object_id('libros') is not null
   DROP TABLE libros;

   EXEC SP_eliminar_libros;

   SELECT * FROM libros;




   
--Crear un SP con un parámetro de entrada
--Nombre de las variables inician con un @ en Oracle el @ no es necesario
--La variable tiene que estar declarada con el mismo tipo de dato y con un valor igual o menor
CREATE PROCEDURE pa_libros_autor
  @autor varchar(30)  
 as
  SELECT titulo, editorial,precio
   FROM libros
   WHERE autor= @autor;
--El procedimiento se ejecuta colocando "execute" (o "exec") 
--seguido del nombre del procedimiento y un valor para el parámetro:
 EXEC pa_libros_autor 'Borges';
 EXEC pa_libros_autor 'Mario Molina';

 CREATE PROCEDURE pa_libros_editorial
  @editorial varchar(20)  
 as
  SELECT titulo, editorial,precio, cantidad
   FROM libros
   WHERE editorial= @editorial;

   EXEC pa_libros_editorial 'Planeta';

   SELECT * FROM libros;

   DROP PROCEDURE pa_libros_editorial;



--Crear un SP con 2 parámetros de entrada
 CREATE PROCEDURE pa_libros_autor_editorial
  @autor varchar(30), --Parametro 1
  @editorial varchar(20) --Parametro 2
 AS
  SELECT titulo, precio
   FROM libros
   WHERE autor= @autor 
   AND editorial=@editorial;

--Ejecutar el SP (siguiendo el orden)
EXEC pa_libros_autor_editorial 'Richard Bach','Planeta';

--Ejecutar el SP (por nombre del parámetro, no importa el orden)
 EXEC pa_libros_autor_editorial @editorial='Planeta', @autor='Richard Bach';

--Crear un SP con 2 parámetros de entrada utilizando comodines como valores por defecto
CREATE PROC pa_libros_autor_editorial3
  @autor varchar(30) = '%',
  @editorial varchar(30) = '%'
 AS 
  SELECT titulo,autor,editorial,precio
   FROM libros
   WHERE autor LIKE @autor 
   AND editorial LIKE @editorial;
--La sentencia siguiente ejecuta el procedimiento almacenado "pa_libros_autor_editorial3" enviando un valor por posición, se asume que es el primero.
 EXEC pa_libros_autor_editorial3 'Ma%';

--La sentencia siguiente ejecuta el procedimiento almacenado "pa_libros_autor_editorial3" enviando un valor para el segundo parámetro, para el primer parámetro toma el valor por defecto:
 EXEC pa_libros_autor_editorial3 @editorial='P%';

--Enviar parámetro por default:
 EXEC pa_libros_autor_editorial3 default, 'P%';
 EXEC pa_libros_autor_editorial3 default;
 



 /*TAREA
 SOLUCION DE LOS EJERCICIOS
 "Ejercicio de SP1.txt"
 Y
 Ejercicio de SP2 parametros.txt
 */

