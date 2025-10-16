--          INDICES AGRUPADOS
-- Crear la base de datos PRODUCTOS
CREATE DATABASE PRODUCTOS
ON PRIMARY 
(NAME = 'producto_data',
FILENAME = 'C:\BASE DE DATOS II\DB_PRODUCTOS\producto_data.Mdf',
SIZE = 3Mb,
MAXSIZE = 30Mb,
FILEGROWTH = 5Mb)
LOG ON 
(NAME = 'producto_log',
FILENAME = 'C:\BASE DE DATOS II\DB_PRODUCTOS\producto_log.Ldf',
SIZE = 3Mb,
MAXSIZE = 10Mb,
FILEGROWTH = 1Mb)
GO

USE PRODUCTOS;

-- Crear la tabla Producto
CREATE TABLE Producto (
    CodPro CHAR(5),
    NomPro VARCHAR(50),
    PrePro DECIMAL(10,2),
    CanPro INT
);

-- Insertar valores a cada fila de la tabla
INSERT INTO Producto (CodPro, NomPro, PrePro, CanPro) VALUES
('P007', 'Alambron de Trefileria', 130.00, 30),
('P006', 'Barras de construccion', 120.00, 500),
('P015', 'Barras lisas y perfiles', 8.00, 67),
('P008', 'Calamina de acero', 100.00, 60),
('P002', 'Cemento Yura', 50.00, 100),
('P009', 'Clavos', 89.00, 100),
('P011', 'Estibos comugados', 125.00, 128),
('P001', 'Fierro 1/2 pulg', 120.00, 80),
('P004', 'Fierro 3/4 pulg', 21.00, 1000),
('P003', 'Ocre Rojo', 20.00, 3),
('P010', 'Pemos', 125.00, 235),
('P012', 'Pemos para soporte de rocas', 180.00, 200),
('P005', 'Pintura esmalte', 8.00, 80),
('P013', 'Planchas y bobinas', 165.00, 332),
('P014', 'Tubos', 115.00, 20);

SELECT * FROM Producto;

-- Crear un inddice agrupado por Nombre de producto
CREATE CLUSTERED INDEX IDX_NomPro
ON Producto (NomPro)
Go

-- Verificacion del indice
execute sp_helpINDEX 'Producto'
GO

SELECT * FROM Producto;

--          INDICES NO AGRUPADOS
-- Agregar el atributo MateriaPrima
Alter table Producto ADD MateriaPrima Varchar (45)
go

-- Insertar los respectivos valores en el campo de dato MateriaPrima
-- Entonces usamos Actualizamos datos, con el comando UPDATE
UPDATE Producto SET MateriaPrima = 'Ferroaleaciones y carbono' WHERE CodPro = 'P001';
UPDATE Producto SET MateriaPrima = 'Caliza Yeso Puzolana'      WHERE CodPro = 'P002';
UPDATE Producto SET MateriaPrima = 'Hematita'                  WHERE CodPro = 'P003';
UPDATE Producto SET MateriaPrima = 'Ferroaleaciones y carbono' WHERE CodPro = 'P004';
UPDATE Producto SET MateriaPrima = 'Aglutinantes pigmentos'    WHERE CodPro = 'P005';
UPDATE Producto SET MateriaPrima = 'Hierro Puro'               WHERE CodPro = 'P006';
UPDATE Producto SET MateriaPrima = 'Aleaciones'                WHERE CodPro = 'P007';
UPDATE Producto SET MateriaPrima = 'Aleaciones'                WHERE CodPro = 'P008';
UPDATE Producto SET MateriaPrima = 'Hierro Puro'               WHERE CodPro = 'P009';
UPDATE Producto SET MateriaPrima = 'Hierro Puro'               WHERE CodPro = 'P010';
UPDATE Producto SET MateriaPrima = 'Hierro Puro'               WHERE CodPro = 'P011';
UPDATE Producto SET MateriaPrima = 'Hierro Puro'               WHERE CodPro = 'P012';
UPDATE Producto SET MateriaPrima = 'Ferroaleaciones y carbono' WHERE CodPro = 'P013';
UPDATE Producto SET MateriaPrima = 'Ferroaleaciones y carbono' WHERE CodPro = 'P014';
UPDATE Producto SET MateriaPrima = 'Ferroaleaciones y carbono' WHERE CodPro = 'P015';
GO

SELECT * FROM Producto;

INSERT INTO Producto (MateriaPrima)
VALUES ('Ferroalecaciones y carbono')
Go

-- Crear un indice No agrupado; para Nombre de producto
CREATE NONCLUSTERED
INDEX IDX_MateriaPrima
ON Producto
(MateriaPrima)
go

-- Verificacion del indice
execute sp_helpINDEX 'Producto'
GO

SELECT * FROM Producto;

--Pero si hacemos la consulta por Nombre de producto y Materia Prima
Select NomPro, MateriaPrima
From Producto
go