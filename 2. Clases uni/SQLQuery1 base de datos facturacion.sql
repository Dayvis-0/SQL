-- Crear la base de datos Facturacion
CREATE DATABASE FacturacionDB;
GO
USE FacturacionDB;
GO
-- Crear las tablas de la base de datos 
-- Tabla clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    DNI NVARCHAR(8),
    Direccion NVARCHAR(200),
    Telefono NVARCHAR(20),
    Email NVARCHAR(100)
);
-- Tabla venderdores
CREATE TABLE Vendedores (
    VendedorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
	DNI NVARCHAR(8),
    Telefono NVARCHAR(20),
    Email NVARCHAR(100)
);
-- Tabla categoria de productos
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Descripcion NVARCHAR(200)
);

-- Tabla productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Descripcion NVARCHAR(200),
    Precio DECIMAL(10,2),
    Stock INT,
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);
-- Tabla Facturas

CREATE TABLE Facturas (
    FacturaID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT,
    VendedorID INT,
    Fecha DATETIME DEFAULT GETDATE(),
    Total DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (VendedorID) REFERENCES Vendedores(VendedorID)
);

--Tabla detalle de Factura

CREATE TABLE DetalleFacturas (
    DetalleID INT PRIMARY KEY IDENTITY(1,1),
    FacturaID INT,
    ProductoID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    Subtotal AS (Cantidad * PrecioUnitario) PERSISTED,
    FOREIGN KEY (FacturaID) REFERENCES Facturas(FacturaID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);
-- INSERTAR DATOS A LAS TABLAS
-- Insertar datos en la tabla clientes

INSERT INTO Clientes (Nombre, DNI, Direccion, Telefono, Email)
VALUES 
('Juan P�rez', '12345678', 'Av. Per� 123', '987654321', 'juan@gmail.com'),
('Ana G�mez', '87654321', 'Jr. Lima 456', '912345678', 'ana@gmail.com');

-- Insertar datos en la tabla vendedores

INSERT INTO Vendedores (Nombre, DNI, Telefono, Email)
VALUES 
('Carlos S�nchez','54632158' ,'998877665', 'carlos@empresa.com'),
('Mar�a Torres','98745632' ,'987112233', 'maria@empresa.com');

-- Insertar datos en el tabla categorias

INSERT INTO Categorias (Nombre, Descripcion)
VALUES 
('Tecnolog�a', 'Productos electr�nicos'),
('Hogar', 'Productos para el hogar');


-- Insertar datos en la tabla productos
INSERT INTO Productos (Nombre, Descripcion, Precio, Stock, CategoriaID)
VALUES 
('Laptop Lenovo', 'Core i5, 8GB RAM', 2500.00, 10, 1),
('Televisor LG', '50 pulgadas 4K', 1800.00, 5, 1),
('Licuadora Oster', '600W', 250.00, 20, 2);

-- Insertar datos en la tabla Facturas 
INSERT INTO Facturas (ClienteID, VendedorID, Fecha, Total)
VALUES 
(1, 1, GETDATE(), 0),
(2, 2, GETDATE(), 0);

-- Insertar datos en la tabla detalle factura

INSERT INTO DetalleFacturas (FacturaID, ProductoID, Cantidad, PrecioUnitario)
VALUES 
(1, 1, 1, 2500.00),
(1, 3, 2, 250.00),
(2, 2, 1, 1800.00);


--  Actualizar la tabla Facturas considerando que la columna total no tiene valores 

SELECT * 
FROM Facturas;

-- Facura 1 
UPDATE Facturas
SET Total = (
    SELECT SUM(Subtotal) 
    FROM DetalleFacturas 
    WHERE FacturaID = 1
)
WHERE FacturaID = 1;

-- Factura 2

UPDATE Facturas
SET Total = (
    SELECT SUM(Subtotal) 
    FROM DetalleFacturas 
    WHERE FacturaID = 2
)
WHERE FacturaID = 2;

-- Ejemplo de consulta de las compras realizas
SELECT 
    F.FacturaID,
    F.Fecha,
    C.Nombre AS Cliente,
    V.Nombre AS Vendedor,
    P.Nombre AS Producto,
    D.Cantidad,
    D.PrecioUnitario,
    D.Subtotal,
    F.Total
FROM Facturas F
INNER JOIN Clientes C ON F.ClienteID = C.ClienteID
INNER JOIN Vendedores V ON F.VendedorID = V.VendedorID
INNER JOIN DetalleFacturas D ON F.FacturaID = D.FacturaID
INNER JOIN Productos P ON D.ProductoID = P.ProductoID
ORDER BY F.FacturaID;


