-- Que facturas han sido registradas hasta hoy
SELECT *
FROM Facturas
WHERE Fecha <= GETDATE();

-- Que productos pertenencen a la categoria 'Tecnologia'
SELECT P.*
FROM Productos P
INNER JOIN Categorias C ON P.CategoriaID = C.CategoriaID;
-- Que clientes tienen correo electronico que contiene 'gmail.com'
SELECT *
FROM Clientes 
WHERE Email 
LIKE '%gmail.com%';
-- Cuantos productos hay en stock actualmente
SELECT SUM(Stock) AS TotalStock
FROM Productos;
-- Cuales son los nombres de los productos y sus respectivas categorias
SELECT *
FROM Categorias;
SELECT 
	P.Nombre AS Producto,
	C.Nombre AS Categoria
FROM Productos P
INNER JOIN Categorias C ON P.CategoriaID = C.CategoriaID;
-- Cuantas facturas ha emitido cada vendedor 
SELECT * 
FROM Vendedores;
SELECT 
	V.Nombre,
	COUNT(FacturaID) AS ProductosVendidos
FROM Vendedores V 
LEFT JOIN Facturas F ON V.VendedorID = F.VendedorID
GROUP BY V.Nombre;
-- Cuantos productos diferentes han sido vendidos en total
SELECT COUNT(DISTINCT ProductoID) AS ProductosDiferentesVendidos
FROM DetalleFacturas;
-- Cual es el total de facturacion por cliente 
SELECT C.Nombre, SUM(F.Total) AS TotalFacturado
FROM Clientes C
INNER JOIN Facturas F ON C.ClienteID  = F.ClienteID
GROUP BY C.Nombre;
-- Cual es el total de facturacion por vendedor
SELECT V.Nombre, SUM(F.Total) AS TotalFacturado
FROM Vendedores V
INNER JOIN Facturas F ON V.VendedorID = F.VendedorID
GROUP BY V.Nombre;
-- Cuales son los productos vendidos en la factura con ID = 1
SELECT 
	P.Nombre AS NombreProducto,
	DF.ProductoID,
	DF.Cantidad,
	DF.PrecioUnitario
FROM DetalleFacturas DF 
INNER JOIN Productos P ON DF.ProductoID = P.ProductoID
WHERE DF.FacturaID = 1;
-- Cuantas veces se ha vendido cada producto
SELECT 
	ProductoID,
	COUNT(*) AS VecesVendido,
	SUM(Cantidad) AS TotalUnidadesVendidas
FROM DetalleFacturas 
GROUP BY ProductoID;
--Cuales son los clientes que han realizado mas de una compra
SELECT 
	C.ClienteID,
	C.Nombre,
	COUNT(F.FacturaID) AS CantidadCompra
FROM Facturas F
INNER JOIN Clientes C ON F.ClienteID = C.ClienteID
GROUP BY C.ClienteID, C.Nombre
HAVING COUNT(F.FacturaID) > 1;
-- Que facturas fueron eliminadas entre dos fechas especificas
SELECT *
FROM Facturas 
WHERE Fecha BETWEEN '2024-01-01' AND '2024-12-31';
-- Cual es el producto mas vendido(cantidad total)
SELECT TOP 1
	ProductoID,
	SUM(Cantidad) AS TotalVendido
FROM DetalleFacturas
GROUP BY ProductoID
ORDER BY TotalVendido DESC;
-- Cual es el cliente que ha generado mas ingresos
SELECT TOP 1 
	F.ClienteID,
	C.Nombre, 
	SUM(F.Total) AS TotalIngresos
FROM Facturas F
JOIN Clientes C ON F.ClienteID = C.ClienteID
GROUP BY F.ClienteID, C.Nombre 
ORDER BY TotalIngresos DESC;
-- Cual es el vendedor que ha facturado mas dinero 
SELECT TOP 1
	F.VendedorID,
	V.Nombre, SUM(F.Total) AS TotalFacturado
FROM Facturas F
JOIN Vendedores V ON F.VendedorID = V.VendedorID
GROUP BY F.VendedorID, V.Nombre
ORDER BY TotalFacturado DESC;
-- Que productos no se han vendido nunca
SELECT 
	P.ProductoID, P.Nombre
FROM Productos P
LEFT JOIN DetalleFacturas DF ON P.ProductoID = DF.ProductoID
WHERE DF.ProductoID IS NULL;

SELECT *
FROM DetalleFacturas;
SELECT *
FROM Productos;
-- Que categoria ha generado mas ingresos 
SELECT TOP 1 
	C.CategoriaID, 
	C.Nombre,
	SUM(DF.Cantidad * DF.PrecioUnitario) AS TotalIngresos
FROM Categorias C
JOIN Productos P ON C.CategoriaID = P.CategoriaID
JOIN DetalleFacturas DF ON P.ProductoID = DF.ProductoID
GROUP BY C.CategoriaID, C.Nombre
ORDER BY TotalIngresos DESC;
-- Cual es el promedio del total de facturas emitidas
SELECT 
	AVG(Total) AS PromedioTotalFacturas 
FROM Facturas;
-- 7. Cual es la factura con el mayor monto total
SELECT TOP 1 *
FROM Facturas 
ORDER BY Total DESC;
-- 8. Cuales son los productos mas vendidos por categoria
WITH VentasPorProducto AS (
	SELECT P.ProductoID, P.Nombre, P.CategoriaID, SUM(DF.Cantidad) AS TotalVendido
	FROM Productos P
	JOIN DetalleFacturas DF ON P.ProductoID = DF.ProductoID 
	GROUP BY P.ProductoID, P.Nombre, P.CategoriaID 
),
MaxVentasPorCategoria AS (
	SELECT CategoriaID, MAX(TotalVendido) AS MaxVendido
	FROM VentasPorProducto 
	GROUP BY CategoriaID 
)
SELECT VPP





