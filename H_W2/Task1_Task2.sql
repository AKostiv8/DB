CREATE DATABASE ZooHT2
COLLATE Latin1_General_CS_AS_KS
GO

CREATE TABLE Employees
(ID int NOT NULL IDENTITY, 
Employee_Name nvarchar(20) NOT NULL,
Position nvarchar(20) NOT NULL,
Age char(5) NULL,
Salary char(10) NOT NULL
)
GO

CREATE TABLE Animals
(ID int NOT NULL IDENTITY, 
Animal_Name nvarchar(20) NOT NULL,
Sex nvarchar(7) NOT NULL,
Age char(5) NULL,
Animal_Type char(10) NOT NULL
)
GO

CREATE TABLE Visitors
(ID int NOT NULL IDENTITY, 
Visitor_Name nvarchar(20) NOT NULL,
Sex nvarchar(7) NOT NULL,
Date_OF_Birth date NULL,
)
GO

CREATE TABLE Zoo_Events
(ID int NOT NULL IDENTITY, 
VisitorID int NOT NULL,
AnimalID int NOT NULL,
Zoo_Visit_Date date NOT NULL
)
GO

-- Task 1

INSERT Animals 
(Animal_Name, Sex, Age, Animal_Type)
VALUES
('Kesha', 'M', '5', 'Parrot'),
('Gena', 'M', '30', 'Crocodile'),
('Jery', 'M', '10', 'Mouse')
GO

INSERT Employees 
(Employee_Name, Position, Age, Salary)
VALUES
('John', 'Doctor', '35', '2500'),
('Bill', 'Manager', '40', '2380'),
('Anna', 'CEO', '46', '3000')
GO

INSERT Visitors 
(Visitor_Name, Sex, Date_OF_Birth)
VALUES
('Moana', 'F', '1996-10-23'),
('Tom', 'M', '2000-11-08'),
('Winni', 'M', '1973-10-25')
GO

INSERT Zoo_Events 
(VisitorID, AnimalID, Zoo_Visit_Date)
VALUES
(8, 2, DATEADD(DAY, -85, GETDATE())),
(9, 3, DATEADD(DAY, -35, GETDATE())),
(10, 4, DATEADD(DAY, -45, GETDATE()))
GO


-- Task 2

UPDATE Animals
SET Age = Age + 2

UPDATE Employees
SET Employee_Name = 'Mike'
WHERE Employee_Name = 'Bill'

UPDATE Visitors
SET Sex = 'F'
FROM
(SELECT TOP 2 * FROM Visitors WHERE Sex='M') AS Selected
WHERE Visitors.ID = Selected.ID


