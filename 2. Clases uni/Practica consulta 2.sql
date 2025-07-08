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

/*BETWEEN -> Comprueba si un valor esta dentro de un rango especifico*/
SELECT *
FROM Productos
WHERE Stock
BETWEEN 9 AND 19;

SELECT *
FROM sys.tables;
SELECT *
FROM Productos;

/*LIKE -> Busca un patron especifico en una columna. Se utiliza con comodines (% para cero o más 
caracteres,)*/
-- Cientes con nombres que terminan en z
SELECT *
FROM Clientes
WHERE Nombre
LIKE '%z';
-- Clientes con nombres que empiecen en a
SELECT *
FROM Clientes 
WHERE Nombre
LIKE 'a%';
-- Cliente con nombre que contiene na en su nombre seguido de cualquier caracter
SELECT *
FROM Clientes
WHERE Nombre
LIKE '%na%';

SELECT * 
FROM Clientes;
/*IN -> Comprueba si un valor coincide con alguno de los valores en una lista*/
SELECT *
FROM Clientes
WHERE Nombre IN ('Luisa Quispe');

/*IS NULL -> Comprueba si un valor es NULL*/
SELECT *
FROM Clientes
WHERE Email IS NULL;

/*IS NULL -> Comprueba si un valor no es NULL*/
SELECT *
FROM Clientes
WHERE Email IS NOT NULL;

SELECT *
FROM Clientes;

