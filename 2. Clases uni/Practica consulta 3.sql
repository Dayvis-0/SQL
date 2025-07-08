/*COUNT -> Cuenta el numero de filas o valores no nulos
Cuenta el total de empleados*/
SELECT COUNT(*) AS Numero
FROM Clientes;

SELECT *
FROM DetalleFacturas;
/*SUM() -> Calcula la suma de los valores en una columna numerica*/
SELECT SUM(Total)
FROM Facturas;

/*AVG() -> Calcula el promedio de los valores en una columna numerica*/
SELECT AVG(PrecioUnitario)
FROM DetalleFacturas;

/*MIN() -> Devuelve el valor minimo de una columna*/
SELECT MIN(PrecioUnitario)
FROM DetalleFacturas;
SELECT *
FROM DetalleFacturas;

/*MAX() -> Devuelve le valor maximo de una columna*/
SELECT MAX(PrecioUnitario)
FROM DetalleFacturas;

SELECT *
FROM Clientes; 
SELECT * 
FROM DetalleFacturas;

SELECT Nombre, Email
FROM Clientes;

SELECT ClienteID, Nombre
FROM Clientes WHERE ClienteID = 1;

SELECT DetalleID, FacturaID, PrecioUnitario
FROM DetalleFacturas 
WHERE PrecioUnitario
BETWEEN 249 AND 1900;

