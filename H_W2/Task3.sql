CREATE DATABASE Goods
COLLATE Latin1_General_CS_AS_KS
GO

CREATE TABLE Products
(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Rate MONEY
) 
GO


INSERT INTO Products
VALUES
(1, 'Tea', 10.00),
(2, 'Coffee', 20.00),
(3, 'Muffin', 30.00),
(4, 'Biscuit', 40.00)
GO


CREATE TABLE UpdatedProducts
(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Rate MONEY
) 
GO


INSERT INTO UpdatedProducts
VALUES
(1, 'Tea', 10.00),
(2, 'Coffee', 25.00),
(3, 'Muffin', 35.00),
(5, 'Pizza', 60.00)
GO

SELECT * FROM Products
SELECT * FROM UpdatedProducts
GO

MERGE Products AS TARGET
USING UpdatedProducts AS SOURCE 
ON (TARGET.ProductID = SOURCE.ProductID) 
WHEN MATCHED AND TARGET.ProductName <> SOURCE.ProductName 
OR TARGET.Rate <> SOURCE.Rate THEN 
UPDATE SET TARGET.ProductName = SOURCE.ProductName, 
TARGET.Rate = SOURCE.Rate 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (ProductID, ProductName, Rate) 
VALUES (SOURCE.ProductID, SOURCE.ProductName, SOURCE.Rate)
WHEN NOT MATCHED BY SOURCE THEN 
DELETE
OUTPUT $action, 
DELETED.ProductID AS TargetProductID, 
DELETED.ProductName AS TargetProductName, 
DELETED.Rate AS TargetRate, 
INSERTED.ProductID AS SourceProductID, 
INSERTED.ProductName AS SourceProductName, 
INSERTED.Rate AS SourceRate; 

SELECT *
FROM Products
WHERE Rate > (SELECT AVG(Rate) FROM Products)

SELECT  ProductID, 
        Rate, 
        (SELECT ProductName FROM UpdatedProducts 
        WHERE Products.ProductID = UpdatedProducts.ProductID) AS Product
FROM Products

