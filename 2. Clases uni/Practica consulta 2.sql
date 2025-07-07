/*AND -> Devuelve TRUE si todas las condiciones son TRUE
Cliente con DNI valido y gmail*/
SELECT *
FROM Clientes
WHERE LEN(DNI) = 8 
AND Email LIKE '%@gmail.com';

SELECT *
FROM sys.tables;

SELECT *
FROM Clientes;

/*OR -> Devuelve TRUE si al menos una de las condiciones es TRUE
Productos con precio mayor a 1000 o stock menor a 10*/
SELECT * 
FROM Productos
WHERE Precio > 1000 OR Stock < 10;

SELECT *
FROM Productos;

/*NOT -> Invierte el resultado de una condicion
Facturas de cliente 1, excepto las que vendio al vendedor 2*/
SELECT *
FROM Clientes
WHERE ClienteID = 1
	AND NOT ClienteID = 2;

/*LIKE -> Busca un patron especifico en una columna. Se utiliza con comodines (% para cero o más 
caracteres, )*/
