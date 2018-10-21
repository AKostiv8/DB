CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
);
CREATE TABLE Customers
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(30) NOT NULL
);
CREATE TABLE Orders
(
    Id INT IDENTITY PRIMARY KEY,
    ProductId INT NOT NULL REFERENCES Products(Id) ON DELETE CASCADE,
    CustomerId INT NOT NULL REFERENCES Customers(Id) ON DELETE CASCADE,
    CreatedAt DATE NOT NULL,
    ProductCount INT DEFAULT 1,
    Price MONEY NOT NULL
);


SELECT Id, CAST(CreatedAt AS nvarchar) + '; total: ' + CAST(Price * ProductCount AS nvarchar) AS MixOrder
FROM Orders

SELECT CONVERT(nvarchar, CreatedAt, 3), 
       CONVERT(nvarchar, Price * ProductCount, 1) 
FROM Orders

SELECT TRY_CONVERT(int, 'sql')     
SELECT TRY_CONVERT(int, '22') 

---------------------------------------------------------------------------------------------------------------




CREATE TABLE Products2
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
)

INSERT INTO Products2
VALUES
('Tea', 'Basl', 3, 123),
('Coffee', 'Double', 1, 435),
('Muffin', 'Basls', 2, 564),
('Biscuit', 'Basl', 2, 231)
GO

SELECT ProductName, Manufacturer,
    CASE ProductCount
        WHEN 1 THEN 'Good is almost empty'
        WHEN 2 THEN 'Good exist'
        ELSE 'So much'
    END AS EvaluateCount
FROM Products2


INSERT INTO Products2
VALUES
('Tea', 'Basl', 3, 763),
('Coffee', 'Double', 6, 459),
('Muffin', 'Basls', 4, 387),
('Biscuit', 'Basl', 8, 931)

GO


SELECT ProductName, Manufacturer,
    CASE ProductCount
        WHEN 1 THEN 'Good is almost empty'
        WHEN 2 THEN 'Not much init'
		WHEN 3 THEN 'Good exist'
        ELSE 'So much'
    END AS EvaluateCount
FROM Products2

SELECT ProductName, Manufacturer,
    CASE
        WHEN Price < 400 THEN 'A'
        WHEN Price BETWEEN 400 AND 600 THEN 'B'
        WHEN Price BETWEEN 700 AND 800 THEN 'C'
        ELSE 'D'
    END AS Category
FROM Products2


SELECT ProductName, Manufacturer,
    IIF(ProductCount>2, 'Enough', 'Not enough') AS Quantity
FROM Products2



-----------------------------------------------------------------------------------------------------------------------


CREATE TABLE Products3
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
)


INSERT INTO Products3
VALUES
('Tea', 'Basl', 3, 763),
('Coffee', 'Double', 6, 459),
('Muffin', NULL, 4, 387),
('Biscuit', NULL, 8, 931)
GO

SELECT Id, ProductName,
        ISNULL(Manufacturer, 'Unknown') AS Manufacturer
FROM Products3

SELECT Id, Manufacturer,
        ISNULL(ProductName, 'Unknown') AS ProductName
FROM Products3

SELECT Id, ProductName,
        NULLIF(ProductName, 'Muffin') AS InOrder
FROM Products3


SELECT Id, ProductName,
        NULLIF(ProductName, 'Tea') AS InOrder
FROM Products3


SELECT Id, ProductName,
        NULLIF(ProductName, 'Coffee') AS InOrder
FROM Products3

-------------------------------------------------------------------------------------------------------------------------



SELECT  [763], [459], Manufacturer
   FROM Products3
   PIVOT (SUM(ProductCount)for ProductName in ([763], [459])
	   ) AS test_pivot

SELECT  [763], [459], Manufacturer
   FROM Products3
   PIVOT (AVG(ProductCount)for ProductName in ([763], [459])
	   ) AS test_pivot

------

CREATE TABLE #Student
(
StudentID int ,
Marks1 float,
Marks2 float,
Marks3 float
) 
INSERT INTO #Student VALUES (1, 5.6, 7.3, 4.2)
INSERT INTO #Student VALUES (2, 4.8, 7.9, 6.5)
INSERT INTO #Student VALUES (3, 6.8, 6.6, 8.9)
INSERT INTO #Student VALUES (4, 8.2, 9.3, 9.1)
INSERT INTO #Student VALUES (5, 6.2, 5.4, 4.4) 

SELECT *
FROM #Student

SELECT StudentID, MarksNo, MarksRecd
FROM
(SELECT StudentID, Marks1, Marks2, Marks3 FROM #Student) AS stu
UNPIVOT (MarksRecd FOR MarksNo IN (Marks1, Marks2, Marks3)) AS mrks


------------------------------------------------------------------------------------------------------------


SELECT *
FROM Products2 c
  CROSS APPLY (SELECT * 
               FROM Products3 O
               WHERE c.Id = o.Id) CO

SELECT *
FROM Products2 c
    CROSS APPLY (SELECT TOP 2 * 
			 FROM Products3 O
             WHERE c.Id = o.Id) CO

SELECT *
FROM Products2 c
  OUTER APPLY (SELECT * 
               FROM Products3 O
               WHERE c.Id = o.Id) CO

--------------------------------------------------------------------------------------------------------------


SELECT LEN(Manufacturer) AS result 
FROM Products2


SELECT LEFT(Manufacturer, 3) AS result 
FROM Products2


SELECT SUBSTRING(Manufacturer,3, 1) AS result 
FROM Products2


SELECT REVERSE(Manufacturer) AS result
FROM Products2

SELECT CONCAT(Manufacturer, Id) AS result
FROM Products2

SELECT UPPER(Manufacturer) AS result
FROM Products2

SELECT LOWER(Manufacturer) AS result
FROM Products2

SELECT LTRIM(Manufacturer) AS result
FROM Products2

SELECT RTRIM(Manufacturer) AS result
FROM Products2

SELECT CHARINDEX('b',Manufacturer) AS result
FROM Products2


-----------------------------------------------------------------------------------------------------------------------

SELECT GETDATE() as test

SELECT GETUTCDATE()  as test

SELECT DAY(GETDATE()) as test

SELECT MONTH(GETDATE()) as test

SELECT YEAR(GETDATE()) as test

SELECT DATENAME(month, GETDATE())  as test

SELECT DATEDIFF(month, '2017-7-28', '2018-9-28')  as test

SELECT ISDATE('2017-07-28') as test

SELECT ISDATE('bla-bla') as test

SELECT EOMONTH('2018-02-05', 2) as test

SELECT DATENAME(weekday, GETDATE()) as test  


-------------------------------------------------------------------------------------------------------

SELECT AVG(Price) AS result 
FROM Products2

SELECT SQUARE(Price) AS result 
FROM Products2

SELECT SQRT(Price) AS result 
FROM Products2

SELECT MAX(Price) AS result 
FROM Products2

SELECT MIN(Price) AS result 
FROM Products2

SELECT COUNT(Price) AS result 
FROM Products2

SELECT SUM(Price) AS result 
FROM Products2

SELECT RAND()  



SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM Products2
GROUP BY Manufacturer

SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM Products2
GROUP BY Manufacturer
HAVING COUNT(*) > 1


SELECT Manufacturer, ProductName,   
       FIRST_VALUE(Manufacturer) OVER (ORDER BY ProductName ASC) AS exmp   
FROM Products2













