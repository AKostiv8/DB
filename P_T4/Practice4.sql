SELECT COUNT(CustomerID) AS clientsSUM
FROM [AdventureWorksLT2012].[SalesLT].[CustomerAddress] JOIN [AdventureWorksLT2012].[SalesLT].[Address]
ON [AdventureWorksLT2012].[SalesLT].[CustomerAddress].[AddressID] = [AdventureWorksLT2012].[SalesLT].[Address].[AddressID]
WHERE [AdventureWorksLT2012].[SalesLT].[Address].[CountryRegion] <> 'Canada' AND [AdventureWorksLT2012].[SalesLT].[CustomerAddress].[AddressType] = 'Main Office'
GO

CREATE PROCEDURE SubTaskOne @Country nvarchar(50), @AddressType nvarchar(50) 
AS
SELECT COUNT(CustomerID) AS clientsSUM FROM [AdventureWorksLT2012].[SalesLT].[CustomerAddress] JOIN [AdventureWorksLT2012].[SalesLT].[Address]
ON [AdventureWorksLT2012].[SalesLT].[CustomerAddress].[AddressID] = [AdventureWorksLT2012].[SalesLT].[Address].[AddressID]
WHERE [AdventureWorksLT2012].[SalesLT].[Address].[CountryRegion] <> @Country AND [AdventureWorksLT2012].[SalesLT].[CustomerAddress].[AddressType] = @AddressType
GO


EXEC SubTaskOne @Country = 'Canada', @AddressType = 'Main Office';
GO

SELECT DISTINCT StateProvince, COUNT(CustomerID)
FROM [AdventureWorksLT2012].[SalesLT].[CustomerAddress] JOIN [AdventureWorksLT2012].[SalesLT].[Address]
ON [AdventureWorksLT2012].[SalesLT].[CustomerAddress].[AddressID] = [AdventureWorksLT2012].[SalesLT].[Address].[AddressID]
WHERE [AdventureWorksLT2012].[SalesLT].[CustomerAddress].[AddressType] = 'Main Office'
GO