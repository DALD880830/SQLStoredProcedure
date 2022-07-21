 --1. Crear la tabla de Personas
CREATE TABLE Personas
(
NumPersonas NUMERIC(6),
Nombre VARCHAR(50),
ApPaterno VARCHAR(50), 
ApMaterno VARCHAR(50),
Area VARCHAR(50),
Email VARCHAR(50),
FechaNacimiento DATE,
RFC  VARCHAR(10)
PRIMARY KEY(NumPersonas)
);

SELECT * FROM personas;

2. Generar un Stored Procedure con el nombre SP_AltaPersonas con los par�metros de entrada: Nombre, ApPaterno, apMaterno,Area,Email y FechaNacimiento
- El valor del campo NumPersonas, deber� de ser generado autom�ticmente por el SP, es decir, ser� un n�mero consecutivo
-El valor del campo RFC, NO deber� de ser agregado en este momento
CREATE PROCEDURE SP_AltaPersonas
@NumPersonas NUMERIC(6),
@Nombre VARCHAR(50),
@ApPaterno VARCHAR(50), 
@ApMaterno VARCHAR(50),
@Area VARCHAR(50),
@Email VARCHAR(50),
@FechaNacimiento DATE,
@RFC varchar(10)
AS

DECLARE @idPersona int

SELECT @idPersona = MAX (numPersonas)
FROM personas

IF (@idPersona is null)
	SELECT @idPersona = 1
ELSE
	SELECT @idPersona = MAX(numPersonas) + 1
	FROM personas

--Hacemos inserts
INSERT INTO personas VALUES (@idPersona, @Nombre, @ApPaterno, @ApMaterno, @Area, @Email, @FechaNacimiento, @RFC)
;

3. Deber�n de agregarse los siguientes empleados que fueron enviados por RH (atrav�s del SP_AltaPersonas). 
Se tiene que generar un script de todas las altas de lass personas utilizando el SP

PAMELA|ARIZAGA|GONZALEZ|Administraci�n|pamm.gla@gmail.com|01/08/1997
GIOVANNI|ALMAZAN|GARCIA|Sistemas|gio.almazan.garcia@gmail.com|02/08/1997
ROSA ELENA|ANAYA|BADILLO|Mecatr�nica|rosa.elena1996@hotmail.com|03/08/1997
RAMSES|BENAVIDEZ|DURAN|Computaci�n|123ization@gmail.com|04/08/1997
CASSANDRA|CEBALLOS|TEJADA|Administraci�n de Empresas|tejada.cassandra12@gmail.com|05/08/1997
RAUL ADRIAN|DOMINGUEZ|BADILLO|Computaci�n|adriansilverslatter@gmail.com|06/08/1997
LUIS DIEGO|DIAZ|CORTES|Inform�tica|dieli.2131@gmail.com|07/08/1997
ERICK VIRGILIO|DIAZ|FRANCO|Computaci�n|diazf.erick@gmail.com|08/08/1997
JOSE CARLOS|GUERRERO|SANCHEZ|Electr�nica|jc.guesa@gmail.com|09/08/1997
IRAIS|HERNANDEZ|PEREZ|Sistemas||10/08/1997
JOSUE DANIEL|HERNANDEZ|SANTIAGO|Computaci�n|danielhs.gunner@gmail.com|11/08/1997
ELSA XIMENA|HERRERA|GARCIA|Inform�tica|elxihg@gmail.com|12/08/1997
SANDRA CECILIA|ISLAS|ORTEGA|Computaci�n|sandracislas@gmail.com|13/08/1997
ALEXIS GABRIEL|JIMENEZ|VILLEGAS|Geomatica|alexis.villegas.j@gmail.com|15/03/1995
FRANCISCO EDER|MENDOZA|SANTOS|Computaci�n|elite_eder30@hotmail.com|16/03/1995
JOSE LEONARDO|OCHOA|NAVA|Computaci�n|leo8aeva01@hotmail.com|17/03/1995
OMAR|OROZCO|CALDERON|Computaci�n|omar.oro.oc@gmail.com|18/03/1995
MARIANO|ORTEGA|PLASCENCIA|Inform�tica|marianosftp@gmail.com|19/03/1995
ATONATIUH IVAN|QUI�ONES|VARGAS|Inform�tica|ivanov@live.com.mx|20/03/1995
JORGE NATHANIEL|RADILLA|MALDONADO|Mecatr�nica|nathaniel.radilla@gmail.com|10/10/1996
JULIO RAUL|RODRIGUEZ|RUIZ|Computaci�n|super_rulaz@hotmail.com|11/10/1996
MARIO ALBERTO|RODRIGUEZ|MARIN|Computaci�n|marioa_bros@hotmail.com|12/10/1996
LUIS FERNANDO|ROJAS|FLORES|Computaci�n|lfernandorojasf@gmail.com|25/12/1985
CLEMENTE DAVID|VALENCIA|ROMERO|Inform�tica|dvidvlencia@gmail.com|20/05/1985
JORGE|VARGAS|VALENCIA|Mec�nica|96vjrg@gmail.com|01/01/2000

EXEC SP_AltaPersonas null, 'PAMELA', 'ARIZAGA', 'GONZALEZ', 'Administraci�n', 'pamm.gla@gmail.com', '08/01/1997', null;
EXEC SP_AltaPersonas null,'GIOVANNI', 'ALMAZAN', 'GARCIA', 'Sistemas', 'gio.almazan.garcia@gmail.com', '08/02/1997', null;
EXEC SP_AltaPersonas null,'ROSA ELENA', 'ANAYA', 'BADILLO', 'Mecatr�nica', 'rosa.elena1996@hotmail.com', '08/03/1997', null;
EXEC SP_AltaPersonas null,'RAMSES', 'BENAVIDEZ', 'DURAN', 'Computaci�n', '123ization@gmail.com', '08/04/1997', null;
EXEC SP_AltaPersonas null,'CASSANDRA', 'CEBALLOS', 'TEJADA', 'Administraci�n de Empresas', 'tejada.cassandra12@gmail.com', '08/05/1997', null;
EXEC SP_AltaPersonas null,'RAUL ADRIAN', 'DOMINGUEZ', 'BADILLO', 'Computaci�n', 'adriansilverslatter@gmail.com', '08/06/1997', null;
EXEC SP_AltaPersonas null,'LUIS DIEGO', 'DIAZ', 'CORTES', 'Inform�tica', 'dieli.2131@gmail.com', '08/07/1997', null;
EXEC SP_AltaPersonas null,'ERICK VIRGILIO', 'DIAZ', 'FRANCO', 'Computaci�n', 'diazf.erick@gmail.com', '08/08/1997', null;
EXEC SP_AltaPersonas null,'JOSE CARLOS', 'GUERRERO', 'SANCHEZ', 'Electr�nica', 'jc.guesa@gmail.com', '08/09/1997', null;
EXEC SP_AltaPersonas null,'IRAIS', 'HERNANDEZ', 'PEREZ', 'Sistemas', 'gio.almazan.garcia@gmail.com', '08/10/1997', null;
EXEC SP_AltaPersonas null,'JOSUE DANIEL', 'HERNANDEZ', 'SANTIAGO', 'Computaci�n', 'danielhs.gunner@gmail.com', '08/11/1997', null;
EXEC SP_AltaPersonas null,'ELSA XIMENA', 'HERRERA', 'GARCIA', 'Inform�tica', 'elxihg@gmail.com', '08/12/1997', null;
EXEC SP_AltaPersonas null,'SANDRA CECILIA', 'ISLAS', 'ORTEGA', 'Computaci�n', 'sandracislas@gmail.com', '08/13/1997', null;
EXEC SP_AltaPersonas null,'ALEXIS GABRIEL', 'JIMENEZ', 'VILLEGAS', 'Geomatica', 'alexis.villegas.j@gmail.com', '03/15/1995', null;
EXEC SP_AltaPersonas null,'FRANCISCO EDER', 'MENDOZA', 'SANTOS', 'Computaci�n', 'elite_eder30@hotmail.com', '03/16/1995', null;
EXEC SP_AltaPersonas null,'JOSE LEONARDO', 'OCHOA', 'NAVA', 'Computaci�n', 'leo8aeva01@hotmail.com', '03/17/1995', null;
EXEC SP_AltaPersonas null,'OMAR', 'OROZCO', 'CALDERON', 'Computaci�n', 'omar.oro.oc@gmail.com', '03/18/1995', null;
EXEC SP_AltaPersonas null,'MARIANO', 'ORTEGA', 'PLASCENCIA', 'Inform�tica', 'marianosftp@gmail.com', '03/19/1995', null;
EXEC SP_AltaPersonas null,'ATONATIUH IVAN', 'QUI�ONES', 'VARGAS', 'Inform�tica', 'ivanov@live.com.mx', '03/20/1995', null;
EXEC SP_AltaPersonas null,'JORGE NATHANIEL', 'RADILLA', 'MALDONADO', 'Mecatr�nica', 'nathaniel.radilla@gmail.com', '10/10/1996', null;
EXEC SP_AltaPersonas null,'JULIO RAUL', 'RODRIGUEZ', 'RUIZ', 'Computaci�n', 'super_rulaz@hotmail.com', '10/11/1996', null;
EXEC SP_AltaPersonas null,'MARIO ALBERTO', 'RODRIGUEZ', 'MARIN', 'Computaci�n', 'marioa_bros@hotmail.com', '10/12/1996', null;
EXEC SP_AltaPersonas null,'LUIS FERNANDO', 'ROJAS', 'FLORES', 'Computaci�n', 'lfernandorojasf@gmail.com', '12/25/1985', null;
EXEC SP_AltaPersonas null,'CLEMENTE DAVID', 'VALENCIA', 'ROMERO', 'Inform�tica', 'dvidvlencia@gmail.com', '05/20/1985', null;
EXEC SP_AltaPersonas null,'JORGE', 'VARGAS', 'VALENCIA', 'Mec�nica', '96vjrg@gmail.com', '01/01/2000', null;

SELECT * FROM personas;

4. Creaci�n de SP para obtener las personas que nacieron en un a�o en espec�fico. Pueden resolver la opci�n 4.1 o 4.2

Opci�n 4.1
Generar Stored Procedure con el nombre SP_A�oNacimiento con los par�metros de entrada: A�o, donde se enviar� solamente el a�o de 
nacimiento del empleado (ejemplo: 1998) y traer� todos los registros que cumplan con ese criterio. 
Los campos que se mostrar�n son: NumEmpleado, Nombre, ApPaterno, ApMaterno, Area y FechaNacimiento. 
Si no existen empleados para ese criterio mostrar� el siguiente mensaje: "No existen empleados para el a�o 1998"

CREATE PROCEDURE SP_AnioNacimiento
@anio int
AS
DECLARE @registro INT
	SELECT @registro = COUNT(*) FROM personas
	WHERE YEAR(FechaNacimiento) = @anio
IF(@registro > 0)
	SELECT numPersonas, Nombre, ApPaterno, ApMaterno, Area, FechaNacimiento
	FROM personas
	WHERE YEAR(FechaNacimiento) = @anio
ELSE
	SELECT CONCAT ('No existen empleados para el a�o: ', @anio)
;

DROP PROCEDURE SP_AnioNacimiento;

EXEC SP_AnioNacimiento '1990';
EXEC SP_AnioNacimiento '1996';
EXEC SP_AnioNacimiento '2000';
EXEC SP_AnioNacimiento '1985';
EXEC SP_AnioNacimiento '2022';
EXEC SP_AnioNacimiento '1997';





Opci�n 4.2
Generar Stored Procedure SP_RangoA�oNacimiento con dos par�metros de entrada (FechaInicial y FechaFinal), 
ejemplo: 01/01/1998 y 31/12/1998) y traer� todos los registros que cumplan con ese criterio. 
Los campos que se mostrar�n son: NumPersonas, Nombre, ApPaterno, ApMaterno, Area y FechaNacimiento. 
Si no existen personas para ese criterio mostrar� el siguiente mensaje: "No existen personas para el a�o 1998"

