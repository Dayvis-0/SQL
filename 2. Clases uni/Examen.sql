-- EXAMEN
SELECT name FROM sys.tables;

-- 1. Seleccionar a los clientes cuyo nombre empiezan con la letra K
SELECT *
FROM Clientes
WHERE Nombre 
LIKE 'A%';

SELECT *
FROM Clientes;

-- 2. Selecciona los productos cuyo stock sean mayores a 100 y cuyo precio sea menor a 20 soles
SELECT *
FROM Productos
WHERE Stock > 5 AND Precio < 2000;

-- 3. Seleccionar a los productos cuya categoria son muebles
SELECT
	P.Nombre,
	C.Nombre
FROM Productos P
INNER JOIN Categorias C ON P.CategoriaID = C.CategoriaID
WHERE C.Nombre = 'Hogar';

SELECT * FROM Categorias;

SELECT * FROM Productos;

/*4. Seleccionar las facturas que se han emitido entre el 15 de enero del 2025 hasta el
08 de julio del 2025*/
SELECT *
FROM Facturas
WHERE Fecha 
BETWEEN '2025-01-15' AND '2025-07-08';

SELECT * FROM Facturas;

	-- 5. Selecionar el total de productos que se encuentran en el inventario
SELECT SUM(Stock) AS TotalInventario
FROM Productos;

-- 6. Seleccionar el precio total que se tiene por cada categoria
SELECT * FROM Productos;
SELECT * FROM Categorias;

SELECT 
	C.Nombre AS Categoria,
	SUM(P.Precio * P.Stock) AS PrecioTotalInventario
FROM Productos P 
INNER JOIN Categorias C ON P.CategoriaID = C.CategoriaID
GROUP BY C.Nombre;

-- 7. Seleccionar el total de facturas que ha realizado cada cliente
SELECT 
	C.Nombre,
	COUNT(F.FacturaID) AS TotalFacturas
FROM Clientes C
INNER JOIN Facturas F ON C.ClienteID = F.ClienteID 
GROUP BY C.ClienteID, C.Nombre;

-- 8. Seleccionar los productos que se vendio en la factura N 2
SELECT 
	P.Nombre,
	DF.FacturaID
FROM Productos P
INNER JOIN DetalleFacturas DF ON P.ProductoID = DF.ProductoID 
WHERE DF.FacturaID = 2;

SELECT 
	P.ProductoID,
	P.Nombre AS NombreProducto,
	DF.Cantidad,
	DF.PrecioUnitario,
	DF.Subtotal
FROM DetalleFacturas DF
INNER JOIN Productos P ON DF.ProductoID = P.ProductoID
WHERE DF.FacturaID = 2;
	
SELECT * FROM Facturas;
SELECT * FROM DetalleFacturas;
SELECT * FROM Productos;

-- 9 Seleccionar las categorias de productos que generaron mas ingresos menor de 500
SELECT  
	C.Nombre AS Categoria,
	SUM(DF.Subtotal) AS IngresosGenerados
FROM DetalleFacturas DF
INNER JOIN Productos P ON DF.ProductoID = P.ProductoID
INNER JOIN Categorias C ON P.CategoriaID = C.CategoriaID
GROUP BY C.Nombre
HAVING SUM(DF.Subtotal) < 5000;

-- 10 Realizar una funcion que permita seleccionar a un producto segun su ProductoID
CREATE FUNCTION ObtenerProductoPorID(@ProID INT)
RETURN TABLE
AS 
RETURN (SELECT * FROM Productos WHERE @ProID = ProductoID);

-- 11 Realizar una funcion que permita seleccionar a los vendedores que cuyo nombre empieza con a

-- 12 Realizar una funcion que permita seleccionar el total de productos vendidos




