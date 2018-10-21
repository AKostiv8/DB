CREATE DATABASE Zoo
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
Price char(10) NOT NULL,
Animal_Type char(10) NOT NULL
)
GO

CREATE TABLE Visitors
(ID int NOT NULL IDENTITY, 
Visitor_Name nvarchar(20) NOT NULL,
Sex nvarchar(7) NOT NULL,
Date_OF_Birth date NULL,
Zoo_Visit_Date date NOT NULL
)
GO

CREATE TABLE Zoo_Events
(ID int NOT NULL IDENTITY, 
VisitorID int NOT NULL,
AnimalID int NOT NULL,
Sex nvarchar(7) NOT NULL,
Date_OF_Birth date NULL,
Zoo_Visit_Date date NOT NULL
)
GO

ALTER TABLE Employees
ADD
PRIMARY KEY (ID)
GO

ALTER TABLE Animals
ADD
PRIMARY KEY (ID)
GO

ALTER TABLE Visitors
ADD
PRIMARY KEY (ID)
GO

ALTER TABLE Zoo_Events
ADD
PRIMARY KEY (ID)
GO

ALTER TABLE Zoo_Events
ADD
FOREIGN KEY(VisitorID) REFERENCES Visitors(ID)
GO

ALTER TABLE Zoo_Events
ADD
FOREIGN KEY(AnimalID) REFERENCES Animals(ID)
GO

ALTER TABLE Zoo_Events
DROP COLUMN Sex;

ALTER TABLE Animals
DROP COLUMN Price
GO

ALTER TABLE Zoo_Events
ADD EmployeeID int NOT NULL;

ALTER TABLE Zoo_Events
ADD
FOREIGN KEY(EmployeeID) REFERENCES Employees(ID)
GO

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
(Visitor_Name, Sex, Date_OF_Birth, Zoo_Visit_Date)
VALUES
('Moana', 'F', '1996-10-23', DATEADD(DAY, -85, GETDATE())),
('Tom', 'M', '2000-11-08', DATEADD(DAY, -35, GETDATE())),
('Winni', 'M', '1973-10-25', DATEADD(DAY, -45, GETDATE()))
GO

INSERT Zoo_Events 
(VisitorID, AnimalID, Date_OF_Birth, Zoo_Visit_Date, EmployeeID)
VALUES
(8, 2, '1996-10-23', DATEADD(DAY, -85, GETDATE()), 3),
(9, 3, '2000-11-08', DATEADD(DAY, -35, GETDATE()), 2),
(10, 4, '1973-10-25', DATEADD(DAY, -45, GETDATE()),1)
GO

SELECT * 
FROM Zoo_Events

