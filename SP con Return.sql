-- Crear SP con return
--La instrucción "return" sale de una consulta o procedimiento y todas las instrucciones posteriores no son ejecutadas.

--1. Ejemplo 1
--Eliminar el SP
drop procedure pa_libros_autor

create procedure pa_libros_autor
  @autor varchar(30)=null
 as 
 if @autor is null
 begin 
  select 'Debe indicar un autor'
  return
 end
 select titulo from  libros where autor = @autor;
--Ejecutar el SP
 declare @autor varchar(30)
 execute pa_libros_autor 'Borges'; --SOLO SE NECESITA ESTE
 select @autor;

 execute pa_libros_autor;

--Ejemplo 2, utilizando else
drop proc SP_EncontrarLibrosporAutor

CREATE PROCEDURE SP_EncontrarLibrosporAutor
@autor  varchar(30) = NULL  
AS   
IF @autor IS NULL  
    BEGIN  
        PRINT 'Debe indicar un autor'  
        RETURN  
    END  
ELSE  
    BEGIN  
        SELECT autor,titulo,editorial,precio,cantidad  
		from libros
        WHERE autor = @autor
END;

Execute SP_EncontrarLibrosporAutor;
Execute SP_EncontrarLibrosporAutor 'Borges';