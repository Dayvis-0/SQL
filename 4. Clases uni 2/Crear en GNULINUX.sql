CREATE DATABASE Familia
ON PRIMARY ( 
	NAME = 'familia_data',
	FILENAME = '/var/opt/mssql/data/familia_data.Mdf',
	SIZE = 3Mb,
	MAXSIZE = 30Mb,
	FILEGROWTH = 5Mb)
LOG ON (
	NAME = 'familia_log',
	FILENAME = '/var/opt/mssql/data/familia_log.Ldf',
	SIZE = 3Mb,
	MAXSIZE = 10Mb,
	FILEGROWTH = 1Mb
);
GO