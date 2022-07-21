--Crear un SP con  parámetros de entrada y regresa un parámetro
--Crear un SP, al cual le enviamos 2 números y retorna el promedio:
 CREATE PROCEDURE pa_promedio
  @n1 decimal(4,2),
  @n2 decimal(4,2),
  @resultado decimal(4,2) output --Con output se referencia que es un parámetro de salida
  AS 
   SELECT @resultado=(@n1+@n2)/2;

--Al ejecutarlo también debe emplearse "output":
  DECLARE @resultado decimal(4,2)
  EXECUTE pa_promedio 5,6, @resultado output
  SELECT @resultado;

--Declaramos una variable para guardar el valor devuelto por el procedimiento; ejecutamos el procedimiento enviándole 2 valores y mostramos el resultado.

Creamos un procedimiento almacenado que muestre los títulos, editorial y precio de los libros de un determinado autor 
(enviado como parámetro de entrada) y nos retorne la suma y el promedio de los precios de todos los libros del autor enviado:

 CREATE PROCEDURE pa_autor_sumaypromedio
  @autor varchar(30)='%',
  @suma decimal(6,2) output,
  @promedio decimal(6,2) output
  AS 
   SELECT titulo,editorial,precio
   FROM libros
   WHERE autor like @autor
  SELECT @suma=sum(precio)
   FROM libros
   WHERE autor like @autor
  SELECT @promedio=avg(precio)
   FROM libros
   WHERE autor like @autor;

Ejecutamos el procedimiento y vemos el contenido de las variables en las que almacenamos los parámetros de salida del procedimiento:

 DECLARE @s decimal(6,2), @p decimal(6,2)
 EXECUTE pa_autor_sumaypromedio 'Richard Bach', @s output, @p output
 SELECT @s as total, @p AS promedio;

--Verifica si el autor tiene más de un libro en exhibición
CREATE PROCEDURE pa_autor_valido
   @autor varchar (30),
   @resultado varchar (30) output 
AS  
BEGIN  
   IF ((SELECT COUNT(*)  
   FROM libros  
   WHERE autor = @autor) > 0)  
   select 'Más de un autor' --Este select funciona como un PRINT
ELSE
	select 'No existe el autor'
END ;

--En esta opción el autor no existe
  DECLARE @resultado varchar (30)
  EXECUTE pa_autor_valido'Juan Rulfo', @resultado output
  SELECT @resultado;

--En esta opción el autor SI existe
  DECLARE @resultado varchar (30)
  EXECUTE pa_autor_valido'Borges', @resultado output
  SELECT @resultado;

 --SP CON 2 PARAMETROS DE ENTRADA Y 1 DE SALIDA EN LA TABLA DE LIBROS
 --LOS QUE QUERAMOS JAJA
 SELECT * FROM libros;
 CREATE PROCEDURE sp_probando
 @autor varchar(30),
 @editorial varchar(30),
 @salida varchar(30) output
 AS
 SELECT titulo, autor=@autor, editorial=@editorial
 FROM libros WHERE autor = @autor
 SELECT @salida=avg(precio)
   FROM libros
   WHERE autor = @autor
 ;

 DECLARE @salida varchar (30)
  EXECUTE sp_probando 'Richard Bach', 'Planeta', @salida output
  SELECT @salida;