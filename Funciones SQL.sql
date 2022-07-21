--FUNCIONES
--Ejemplo funcion 1
CREATE FUNCTION f_EnMayusculas
(
@Nombre Varchar(50),
@Apellido Varchar(50)
)
RETURNS Varchar(102)
AS
--Declarar Variables
BEGIN
 RETURN (UPPER(@Apellido) + ', ' + UPPER(@Nombre))
END
--Ejecutar
--se debe de poner el propietario de la base de datos "dbo"
--se le envían parámetros
select dbo.f_EnMayusculas('Geynen','Montenegro')
Print dbo.f_EnMayusculas('Geynen','Montenegro')
Print 'El nombre completo es: ' + dbo.f_EnMayusculas('Geynen','Montenegro')


 --Utilizar la función f_EnMayusculas, directamente en un Query
SELECT dbo.f_EnMayusculas(Nombre,Apellido) AS Nombre FROM empleados
SELECT dbo.f_EnMayusculas(Nombre,Apellidos) AS Nombre FROM cliente
SELECT dbo.f_EnMayusculas(Nombre,ApPaterno) AS Nombre FROM Personas

--Funcion para poner en minusculas
--2 parametros
--f_EnMinusculas
--concatenar los valores de manera inversa y que tenga un texto
CREATE FUNCTION f_EnMinusculas
(
@Nombre Varchar(50),
@Paterno Varchar(80)
)
RETURNS Varchar(202)
AS
--Declarar Variables
BEGIN
 RETURN (LOWER(@Nombre) + ', ' + LOWER(@Paterno))
END

DROP FUNCTION f_EnMinusculas

SELECT dbo.f_EnMinusculas(Nombre,ApPaterno) AS Datos FROM personas
--*********************************************************************************

--Ejemplo funcion 2
CREATE FUNCTION f_NombreDia(@Dia int)
Returns Varchar(10)
AS
Begin
 Declare @Var Varchar(10)
 Select @Var=
 Case @Dia
  When 1 Then 'Lunes'
  When 2 Then 'Martes'
  When 3 Then 'Miercoles'
  When 4 Then 'Jueves'
  When 5 Then 'Viernes'
  When 6 Then 'Sabado'
  When 7 Then 'Domingo'
 End
 Return @Var
End
 
--Ejecutar
Print dbo.f_NombreDia(10)
Print dbo.f_NombreDia(5)
Print dbo.f_NombreDia(1)

/*
*********************************************************************************
Ejercicio Funcion 1: modificar (alter) la funcion "f_NombreDia" para que envie un mensaje
en el caso de que el parametro de entrada no se encuentre. "No existe el dia de la semana"
********************************************************************************
*/
ALTER FUNCTION f_NombreDia(@Dia int)
Returns Varchar(30)
AS
Begin
 Declare @Var Varchar(30)
 Select @Var=
 Case @Dia
  When 1 Then 'Lunes'
  When 2 Then 'Martes'
  When 3 Then 'Miercoles'
  When 4 Then 'Jueves'
  When 5 Then 'Viernes'
  When 6 Then 'Sabado'
  When 7 Then 'Domingo'
  ELSE 'No existe el día de la semana' --Si no esta dentro de los numeros de casos, cae aquí
 End
 Return @Var
End


--Ejemplo funcion 3
create Function f_Suma(@N1 int, @N2 int)
RETURNS Int
AS
BEGIN
 Return (@N1 + @N2)
END
 
--Ejecutar
Print dbo.f_Suma(5,8)

/*
*********************************************************************************
Ejercicio Funcion 2: Crear función "f_promedio" que reciba 2 valores y retorne el promedio:
*********************************************************************************
*/
create Function f_promedio(@N1 FLOAT, @N2 FLOAT)
RETURNS FLOAT
AS
BEGIN
 Return ((@N1 + @N2)/2)
END

DROP FUNCTION f_promedio

Print dbo.f_promedio(5.5,8.2)

--Ejemplo funcion 4

if object_id('f_fechaConLetras') is not null
begin
drop function f_fechaConLetras
end
go

CREATE function f_fechaConLetras (@fecha as date)
returns varchar (30)
as
begin
declare @resultado varchar (30)
set @resultado= concat (day(@fecha),' de ', datename(month, @fecha), ' del ', year(@fecha))
return @resultado
end

--ejecutar
select dbo.f_fechaConLetras ('2021-03-10') as [Fecha actual]
go

 --Utilizar la función f_fechaConLetras, directamente en un Query
Select dbo.f_fechaConLetras(FechaNacimiento) As Nacimiento From Personas
--*********************************************************************************
--Obtener la fecha y hora actuales del sistema
SELECT SYSDATETIME();  

-- Ejemplos
-- https://docs.microsoft.com/es-es/sql/t-sql/functions/getdate-transact-sql?view=sql-server-ver15
/*
*********************************************************************************
Ejercicio Funcion 3: Utilizar la función f_fechaConLetras y enviarle como parametro siempre el dia actual
****************************************************************************
*/
select dbo.f_fechaConLetras (SYSDATETIME()) as [Fecha actual]


--Ejemplo funcion 5
--Función que calcula la suma de las cifras de un número sin importar cuantas cifras tenga el número.

Create Function f_SumaDigitos
(@Numeros int)
Returns int
AS
 Begin
  Declare @Size int,@Digito varchar,@Suma int,@i int
  Set @Size=Len(Ltrim(Rtrim(Cast(@Numeros as Varchar))))
  Set @Suma=0
  Set @Digito=0
  Set @i=1
  While(@i<=@Size)
  Begin
   Set @Digito=Substring(Cast(@Numeros as Varchar),@i,@i+1)
   Set @Suma=@Suma + @Digito
   Set @i=@i + 1
  End
  Return @Suma
 End
Go
DROP FUNCTION f_SumaDigitos

--Ejecutar
Print dbo.f_SumaDigitos(232350022)
Print dbo.f_SumaDigitos(123)
 
--Ejemplo funcion 6
/*Dado un número natural de cuatro cifras la funcion InvertirPalabra permite
 obtener al revés del número. Así, si se lee el número 2385 el programa deberá
 imprimir 5832.
 */


Create Function InvertirPalabra
(@Nombre Varchar(20))
Returns Varchar(19)
AS
 Begin
  Declare @Size int,@Dig Char(1),@Invertido Varchar(19),@i int
  Set @Size=Len(Ltrim(Rtrim(@Nombre)))
  Set @Invertido=''
  Set @Dig=''
  Set @i=1
  While(@i<=@Size)
  Begin
   Set @Dig=Substring(@Nombre,@i,@i+1)
   Set @Invertido= @Dig + Ltrim(Rtrim(@Invertido))
   Set @i=@i + 1
  End
  Return @Invertido
 End
Go
--Ejecutar
Print dbo.InvertirPalabra('HAydee')
Print dbo.InvertirPalabra('AlejandroLopez')

  --Crear una función a la cual le enviamos una fecha y nos retorna el nombre del mes en español:

create function f_nombreMes
 (@fecha datetime='2007/01/01') --Este es el default
  returns varchar(10)
  as
  begin
    declare @nombre varchar(10)
    set @nombre=
     case datename(month,@fecha)
/*Sintaxis
DATENAME ( datepart , date )
Datepart
year yy, yyyy
quarter qq, q
month mm, m
dayofyear dy, y
day dd, d
week wk, ww
weekday dw, w
hour hh
minute mi, n
second
*/
       when 'January' then 'Enero'
       when 'February' then 'Febrero'
       when 'March' then 'Marzo'
       when 'April' then 'Abril'
       when 'May' then 'Mayo'
       when 'June' then 'Junio'
       when 'July' then 'Julio'
       when 'August' then 'Agosto'
       when 'September' then 'Setiembre'
       when 'October' then 'Octubre'
       when 'November' then 'Noviembre'
       when 'December' then 'Diciembre'
     end--case
    return @nombre
 end;
-- Ejemplos de fechas
--https://www.sqlshack.com/es/funciones-y-formatos-de-sql-convert-date/
--Las funciones que retornan un valor escalar pueden emplearse en cualquier consulta donde se coloca un campo.
--Llamar la función, marcará error porque no esta creada la tabla
 select nombre,
  dbo.f_nombreMes(fechanacimiento) as 'mes de ingreso'
 from Personas;


--Para que tome el valor por defecto debemos enviar "default" como argumento:
 select dbo.f_nombreMes(default);

-- Especificamos el entorno de idioma para la sesión.
-- El idioma de la sesión determina los formatos de fecha y hora
-- y los mensajes del sistema.
set language us_english;

--Una empresa tiene almacenados los datos de sus empleados en una tabla denominada "empleados".
--Eliminamos la tabla, si existe y la creamos con la siguiente estructura:
if object_id('empleados2') is not null
  drop table empleados2;

create table empleados2(
  documento char(8) not null,
  nombre varchar(30),
  fechaingreso datetime,
  mail varchar(50),
  telefono varchar(12)
);

-- Fijamos el formato de la fecha
set dateformat ymd;

insert into empleados2 values('22222222', 'Ana Acosta','1985/10/10','anaacosta@gmail.com','4556677');
insert into empleados2 values('23333333', 'Bernardo Bustos', '1986/02/15',null,'4558877');
insert into empleados2 values('24444444', 'Carlos Caseros','1999/12/02',null,null);
insert into empleados2 values('25555555', 'Diana Dominguez',null,null,'4252525');

SELECT * FROM empleados2;

-- Eliminamos, si existe, la función "f_fechaCadena":
if object_id('dbo.f_fechaCadena') is not null
  drop function dbo.f_fechaCadena;

go

-- Creamos una función a la cual le enviamos una fecha (de tipo varchar),
-- en el cuerpo de la función se analiza si el dato enviado corresponde a una fecha,
-- si es así, se almacena en una variable el mes (en español) y se le concatenan el día
-- y el año y se retorna esa cadena; en caso que el valor enviado no corresponda a una fecha,
-- la función retorna la cadena 'Fecha inválida':
create function f_fechaCadena
 (@fecha varchar(25))
  returns varchar(25)
  as
  begin
    declare @nombre varchar(25)
    set @nombre='Fecha inválida'  
    if (isdate(@fecha)=1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=
      case datename(month,@fecha)
       when 'January' then 'Enero'
       when 'February' then 'Febrero'
       when 'March' then 'Marzo'
       when 'April' then 'Abril'
       when 'May' then 'Mayo'
       when 'June' then 'Junio'
       when 'July' then 'Julio'
       when 'August' then 'Agosto'
       when 'September' then 'Setiembre'
       when 'October' then 'Octubre'
       when 'November' then 'Noviembre'
       when 'December' then 'Diciembre'
      end--case
      set @nombre=rtrim(cast(datepart(day,@fecha) as char(2)))+' de '+@nombre
      set @nombre=@nombre+' de '+ rtrim(cast(datepart(year,@fecha)as char(4)))
    end--si es una fecha válida
    return @nombre
 end;

go

-- Recuperamos los registros de "empleados", mostrando el nombre y la fecha
-- de ingreso empleando la función creada anteriormente:
select nombre, dbo.f_fechaCadena(fechaingreso) as ingreso from empleados2;

-- Empleamos la función en otro contexto:
select dbo.f_fechaCadena(getdate());
SELECT GETDATE();



 /*Funciones  escalares / utilizando tipo de dato TABLE*/

/*Crear un tipo de datos TABLE. Es un tipo de datos especial que se puede utilizar para almacenar un conjunto de resultados
 para procesar en otro momento. TABLE se usa sobre todo para el almacenamiento temporal de un conjunto de filas devueltas
 como el conjunto de resultados de una función con valores de tabla. Las funciones y las variables se pueden declarar como de tipo table.
*/
DECLARE @TableNumeros TABLE ( numero1  int,numero2 int) --Creamos una tabla temporal
--Insertar registros en la tabla
INSERT INTO @TableNumeros
VALUES (1,2), (3,4), (5,6), (7,8)
--Consultar los registro de la tabla
SELECT * FROM @TableNumeros

-- Consultar los registros de la tabla con la función  f_Suma
SELECT numero1,
numero2,
dbo.f_Suma (numero1,numero2) as suma
FROM @TableNumeros


/* Crea una función denominada "f_ofertas" que recibe un parámetro.
La función retorna una tabla con el codigo, título, autor y
precio de todos los libros cuyo precio sea inferior al parámetro:*/

 create function f_ofertas
 (@minimo decimal(6,2))
 returns @ofertas table-- nombre de la tabla
 --formato de la tabla
 (idcodigolibro int,
  titulo varchar(40),
  autor varchar(30),
  precio decimal(6,2)
 )
 as
 begin
   insert @ofertas
    select idcodigolibro,titulo,autor,precio
    from libros
    where precio < @minimo
   return
 end;
--Las funciones que retornan una tabla pueden llamarse sin especificar propietario:
 select * from f_ofertas(20);
 -- Aunque también se pueden llamar con el propietario dbo.nombre_de_la_función
 select *from dbo.f_ofertas(30);

--La función puede ser referenciada en el "from" de una consulta;
--Esta consulta realiza un join entre la tabla "libros"
--y la tabla retornada por la función "f_ofertas":
 select * from libros as l
  join dbo.f_ofertas(30) as o
  on l.idcodigolibro=o.idcodigolibro;
--Se puede llamar a la función como si fuese una tabla o vista listando algunos campos:
 select titulo,precio from dbo.f_ofertas(40);

 --Funcion que utilice una tabla, pero sobre la tabla de personas, que mande a llamar una funcion de la que ya se crearon
 /*Ejercicio 3
Crear function de tipo de dato table, en donde utilice alguna de las funciones que se crearon y se invoque en una consulta
*/

 create function f_personas
  
 returns @minusculas table-- nombre de la tabla
 --formato de la tabla
 (numPersonas int,
  nombre varchar(40),
  area varchar(40)
 )
 as
 begin
   insert @minusculas
    select numPersonas, dbo.f_EnMinusculas(nombre, ApPaterno), area
    from personas
    where area = @area
   return
 end;


 select * from dbo.f_personas('sistemas');
 select * from dbo.f_personas ('informática');
 select * from dbo.f_personas(default);

