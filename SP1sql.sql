CREATE PROCEDURE pa_sueldototal2
@documento char(8) = '%'
AS
SELECT nombre, apellido,
CASE
	WHEN sueldo < 500 THEN sueldo + (200 * cantidadhijos)
	WHEN sueldo >= 500 THEN sueldo + (100 * cantidadhijos)
END sueldo_total
FROM empleados
WHERE documento LIKE @documento;

EXEC pa_sueldototal2 default;
SELECT * FROM empleados;
EXEC pa_sueldototal2 '22666666';