-- SP Almacenados
exec sp_help;

--Ayuda de un SP
exec sp_helptext sp_help;
EXEC sp_helptext SP_EncontrarLibrosporAutor;

--Todos los SP que empiezan con SP_
 exec sp_stored_procedures @sp_name='SP_%';

--Verifica si el SP tiene dependencias
 exec sp_depends pa_autor_promedio;
 EXEC sp_depends SP_EncontrarLibrosporAutor;

--Verifica si el objeto(tabla) tiene asociado dependencias
 exec sp_depends libros;

-- Todos los objetos de la base
 select * from sysobjects;
 
--SP de la base con datos específicos
 select *from sysobjects
  where xtype='P' and-- tipo procedimiento
  name like 'pa%';--búsqueda con comodín

-----------------------------------------------------------
--Verificar el lenguaje SQL
select @@language;

--Si MSSQL fue instalado en inglés obtendrás us_english como resultado.

--Para ver todos los lenguajes disponibles en SQL y cuáles son sus propiedades podemos hacer lo siguiente:
  sp_helplanguage

--Para establecer la Date format SQL Server
Ejemplo lenguaje Español para todas las consultas que lancemos desde la sesión y con el usuario que estemos conectados:

SET LANGUAGE Español
set dateformat dmy