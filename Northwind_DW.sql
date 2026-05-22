CREATE DATABASE Northwind_DW;
GO

USE Northwind_DW;
GO

CREATE TABLE DimCustomer (
	CustomerKey			INT IDENTITY(1,1) PRIMARY KEY,
	CustomerID			NVARCHAR(10),
	CompanyName			NVARCHAR(100),
	ContactName			NVARCHAR(100),
	[Address]			NVARCHAR(100),
	City				NVARCHAR(50),
	PostalCode			NVARCHAR(25),
	Country				NVARCHAR(50),
	CustomerSegment		NVARCHAR(25)
);
GO

CREATE TABLE DimProduct (
	ProductKey			INT IDENTITY(1,1) PRIMARY KEY,
	ProductID			INT,
	ProductName			NVARCHAR(100),
	CategoryName		NVARCHAR(50),
	UnitPrice			DECIMAL(10,2),
	UnitPriceUSD		DECIMAL(10,2),
	CostPrice			DECIMAL(10,2),
	CountryOfOrigin		NVARCHAR(50),
	SupplierProductCode NVARCHAR(25)
);
GO

CREATE TABLE DimDate (
	DateKey				INT PRIMARY KEY,
	FullDate			DATE,
	[Year]				SMALLINT,
	[Quarter]			SMALLINT,
	[Month]				TINYINT,
	[MonthName]			NVARCHAR(15),
	[Week]				TINYINT,
	[DayOfMonth]		TINYINT,
	[DayName]			NVARCHAR(15)
);
GO

CREATE TABLE FactSales (
	SalesKey			INT IDENTITY(1,1) PRIMARY KEY,
	DateKey				INT FOREIGN KEY REFERENCES DimDate(DateKey),
	CustomerKey			INT FOREIGN KEY REFERENCES DimCustomer(CustomerKey),
	ProductKey			INT FOREIGN KEY REFERENCES DimProduct(ProductKey),
	OrderID				INT,
	Quantity			INT,
	Discount			DECIMAL(5,2),
	UnitPrice			DECIMAL(10,2),
	LineTotal			DECIMAL(10,2)
);
GO

SELECT *
FROM FactSales

SELECT *
FROM DimDate

SELECT *
FROM DimProduct

SELECT *
FROM DimCustomer
