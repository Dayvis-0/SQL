-- Ejercicio escalar funcion que hace una suma 
CREATE FUNCTION Ejemplosuma(@valor1 int, @valor2 int)
RETURNS INT 
AS
BEGIN 
	DECLARE @suma int
	SET @suma = @valor1 + @valor2
	RETURN @suma
END;

SELECT dbo.Ejemplosuma(1, 1) AS Suma;

-- Ejercicio escalar funcion para saber el nombre de un cliente con su DNI

CREATE FUNCTION EjemploNombreCliente(@DNI NVARCHAR(8))
RETURNS NVARCHAR(100)
AS
BEGIN 
	DECLARE @nombre NVARCHAR(100)
	SET @nombre = (SELECT Nombre FROM Clientes WHERE DNI = @DNI)
	RETURN @nombre
END;

SELECT dbo.EjemploNombreCliente('12345678');

SELECT * FROM Clientes;

-- Ejercicio para una funcion tabular para saber los productos segun su id
CREATE FUNCTION ProductosConFuncion(@ProID int)
RETURNS TABLE
AS 
RETURN (SELECT * FROM Productos WHERE @ProID = ProductoID);

SELECT *
FROM dbo.ProductosConFuncion(2);

-- seleccionar los productos con sus respectivas categorias
CREATE FUNCTION ProductosCategorias()
RETURNS TABLE
AS
RETURN (SELECT 
			P.ProductoID
		FROM Productos P
		JOIN Categorias C ON P.CategoriaID = C.CategoriaID	
);

SELECT *
FROM dbo.ProductosCategorias();	

CREATE FUNCTION ProductosCategorias1(@ID int)
RETURNS TABLE
AS
RETURN (SELECT 
			P.ProductoID
		FROM Productos P
		JOIN Categorias C ON P.CategoriaID = C.CategoriaID	
		WHERE P.ProductoID = @ID
);

SELECT *
FROM dbo.ProductosCategorias1(2);

DROP FUNCTION dbo.EjemploSuma;


