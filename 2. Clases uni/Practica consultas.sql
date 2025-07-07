-- FROM
SELECT * 
FROM Clientes;

SELECT *
FROM Productos;

-- WHERE
SELECT ProductoID, Nombre
FROM Productos 
WHERE Precio > 50;

-- GROUP BY
SELECT CategoriaID, COUNT(*) AS Cantidad
FROM Productos
GROUP BY CategoriaID;

-- HAVING
SELECT CategoriaID, AVG(Precio) AS PromedioPrecio 
FROM Productos
GROUP BY CategoriaID
HAVING AVG(Precio) > 100;

SELECT * FROM Productos;

-- ORDER BY
SELECT Nombre, Precio
FROM Productos
ORDER BY Precio;

SELECT Nombre, Precio
FROM Productos
ORDER BY Precio DESC;

-- LIMIT - TOP
/*LIMITT -> Se usa en mysql/PostgreSQL
TOP -> Se usa en SQL Server*/

SELECT * 
FROM Clientes;

SELECT TOP 1 Nombre
FROM Clientes;

-- JOINS

/*INNER JOIN -> Devuelve solo las coincidencias
Mostrar facturas con nombre del cliente y vendedor */
SELECT 
	F.FacturaID,
	C.Nombre AS Cliente,
	V.Nombre AS Vendedor,
	F.Total
FROM Facturas F
INNER JOIN Clientes C ON F.ClienteID = C.ClienteID
INNER JOIN Vendedores V ON F.VendedorID = V.VendedorID;

-- Mostrar productos con su categoria
SELECT 
	P.Nombre,
	C.Nombre 
FROM Productos P
INNER JOIN Categorias C ON P.CategoriaID = C.CategoriaID;

SELECT *
FROM Productos;
SELECT * 
FROM Categorias;

/*LEFT JOIN ->Devuelve todo de la izquierda, aunque no haya coincidencia en la derecha
Mostrar todos los cliente, aunque no hayan hecho compras*/
SELECT 
	C.ClienteID,
	C.Nombre AS Cliente,
	F.FacturaID,
	F.Total
FROM Clientes C
LEFT JOIN Facturas F ON C.ClienteID = F.FacturaID;

SELECT * 
FROM Facturas;
SELECT *
FROM Clientes;
-- Muestra todos los productos, incluso si no tienen categoria asignada
SELECT 
	P.Nombre AS Producto,
	C.Nombre AS Categoria
FROM Productos P
LEFT JOIN Categorias C ON P.CategoriaID = C.CategoriaID;


SELECT *
FROM Productos;
SELECT * 
FROM Categorias;


/*RIGHT JOIN -> Devuelve todo de la derecha, aunque no haya coincidencia en la izquierda
Mostrar todas las facturas, incluso si no tiene cliente(teorico, por si alguna vez pasa)*/
SELECT 
	F.FacturaID AS Factura,
	F.Fecha,
	F.Total,
	C.Nombre
FROM Facturas F
RIGHT JOIN Clientes C ON F.ClienteID = C.ClienteID;

SELECT *
FROM Facturas;
SELECT *
FROM Clientes;

-- Mostrar todas las categorias, incluso si no tienen productos registrados
SELECT 
	P.Nombre,
	C.Nombre
FROM Productos P
RIGHT JOIN Categorias C ON P.CategoriaID = C.CategoriaID;

SELECT *
FROM Categorias;
SELECT *
FROM Productos;

/*FULL OUTER JOIN -> Devuelve todo, con o sin coincidencias 
Muestra todos los productos y categorias, aunque no haya relacion entre ellos (Para SQL Serve - FULL JOIN)*/
SELECT
	P.Nombre AS Producto,
	C.Nombre AS Categoria
FROM Productos P
FULL JOIN Categorias C ON P.CategoriaID = C.CategoriaID;

/*CROSS JOIN -> Devuelve todas las combinaciones posibles entre dos tablas
Todas las combinaciones de clientes y productos*/
SELECT 
	C.Nombre AS Cliente,
	P.Nombre AS Productos
FROM Clientes C
CROSS JOIN Productos P;
	
SELECT *
FROM Clientes;

