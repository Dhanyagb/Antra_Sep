USE [WideWorldImporters]
GO

SELECT PersonID, FullName, PhoneNumber AS cp_PhoneNumber, FaxNumber AS cp_FaxNumber 
FROM Application.people
UNION
SELECT  PersonID, FullName, FaxNumber AS cp_FaxNumber, PhoneNumber AS cp_PhoneNumber
FROM Application.People_Archive
UNION
SELECT PersonID, FullName,  PhoneNumber AS cp_PhoneNumber, FaxNumber AS cp_FaxNumber 
FROM  
	(
	SELECT PersonID, FullName, FaxNumber, PhoneNumber FROM Application.People WHERE IsEmployee = 0
	UNION
	SELECT PersonID, FullName, FaxNumber, PhoneNumber FROM Application.People_Archive WHERE IsEmployee = 0
	) AS emp
join
	(
	SELECT PrimaryContactPersonID pc,  SupplierID, PhoneNumber	 AS cp_PhoneNumber, FaxNumber  AS cp_FaxNumber FROM Purchasing.Suppliers
	UNION 
	SELECT PrimaryContactPersonID pc, SupplierID, PhoneNumber    AS cp_PhoneNumber, FaxNumber  AS cp_FaxNumber FROM Purchasing.Suppliers_Archive
	UNION
	SELECT AlternateContactPersonID pc, SupplierID, PhoneNumber  AS cp_PhoneNumber, FaxNumber  AS cp_FaxNumber FROM Purchasing.Suppliers
	UNION
	SELECT AlternateContactPersonID pc, SupplierID, PhoneNumber  AS cp_PhoneNumber, FaxNumber  AS cp_FaxNumber FROM Purchasing.Suppliers_Archive
	UNION
	SELECT PrimaryContactPersonID pc, CustomerID, PhoneNumber    AS cp_PhoneNumber, FaxNumber  AS cp_FaxNumber FROM Sales.Customers
	UNION
	SELECT PrimaryContactPersonID pc, CustomerID, PhoneNumber    AS cp_PhoneNumber, FaxNumber  AS cp_FaxNumber FROM Sales.Customers_Archive
	UNION
	SELECT AlternateContactPersonID pc, CustomerID, PhoneNumber  AS cp_PhoneNumber, FaxNumber  AS cp_FaxNumber FROM Sales.Customers
	UNION
	SELECT AlternateContactPersonID pc, CustomerID, PhoneNumber  AS cp_PhoneNumber, FaxNumber  AS cp_FaxNumber FROM Sales.Customers_Archive
	) AS temp
ON emp.PersonID = temp.pc
ORDER BY PersonID;