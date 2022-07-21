
--TIPS en Transact-SQL
-- Condici�n l�gica
DECLARE @SON varchar(20) = 'LUKE'
SELECT IIF(@SON = 'LUKE', 'I AM YOUR FATHER', 'I AM NOT YOUR FATHER')


--Insertar m�ltiples filas con un comando INSERT
--(tradicional)
CREATE TABLE items (item_id int, item_name varchar(10))
 
INSERT INTO items VALUES (1,'Hat')
INSERT INTO items VALUES (2,'Sock')
INSERT INTO items VALUES (3,'Shoe')
INSERT INTO items VALUES (4,'Coat')
INSERT INTO items VALUES (5,'Shirt')

--(nuevo)
INSERT INTO items VALUES (1,'Hat'), (2,'Sock'),
(3,'Shoe'),
(4,'Coat'),
(5,'Shirt')

SELECT * FROM items;

-- Diferencia entre Print y Select
PRINT getdate()




--PRINT siempre devuelve un char / varchar, as� que cuando haces "PRINT GETDATE ()" se realiza una conversi�n impl�cita.
--SELECT devuelve el tipo de datos proporcionado.

-- Utilizar SET o SELECT
--SET y SELECT pueden ser usados para asignar valores a las variables a trav�s de T-SQL.
--Ambos cumplen su tarea, pero en algunos casos se pueden producir resultados inesperados.
/*
Escenarios para usar SET:

Si est�s obligado a asignar un solo valor directamente a la variable y no hay consulta para buscar el valor.
Se esperan asignaciones NULL (retorna NULL en un conjunto de resultados).
Los estandares est�n destinados a pasar cualquier plan de migraci�n.
Se esperan resultados no escalares y deben ser manipulados.

Usando SELECT es eficiente y flexible en los siguientes casos:

M�ltiples variables est�n siendo pobladas por asignaci�n directa de valores.
M�ltiples variables est�n siendo pobladas por una unica fuente (tabla, vista).
Menos codigo para asignar multiples variables.
Usa esta opci�n si necesitas @ROWCOUNT y @ERROR de la �ltima sentencia ejecutada.
*/
/*
ALTER permite modificar objetos previamente creados en la base de datos como tablas,
funciones o procedimientos almacenados.
sin cambiar los permisos y sin que afecte a ninguna otra funci�n, procedimiento almacenado o desencadenador dependiente.
ejemplo
CREATE [ OR ALTER ] FUNCTION
[OR ALTER] Desde SQL Server 2016
o
ALTER FUNCTION

Una funci�n puede tener un m�ximo de 2.100 par�metros.
*/
GO
/*Indica a las herramientas de Microsoft� SQL Server� el final de un lote de instrucciones Transact-SQL.

Por ejemplo, si tipeamos:
*/
 select * from empleados;
 sp_helpconstraint empleados;
--muestra un mensaje de error porque no puede procesar ambas sentencias como un solo lote.
--Para que no ocurra debemos tipear:

 select * from empleados;
 exec sp_helpconstraint empleados;
--o separar los lotes con "go":

 select * from empleados
 go
 sp_helpconstraint empleados

--  CHARINDEX, PATINDEX
--https://www.youtube.com/watch?v=NoQwzRMY-LI
