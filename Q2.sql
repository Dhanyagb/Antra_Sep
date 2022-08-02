/** If the customer's primary contact person has the same phone number as the customer’s phone number, list the customer companies **/

USE WideWorldImporters
GO

SELECT CustomerName AS CustomerCompanies
FROM (
	SELECT PersonID, PhoneNumber FROM Application.People
	UNION
	SELECT PersonID, PhoneNumber FROM Application.People_Archive
	) AS cx
JOIN
	(
	SELECT CustomerName, PrimaryContactPersonID, PhoneNumber FROM Sales.customers
	UNION
	SELECT CustomerName, PrimaryContactPersonID, PhoneNumber FROM Sales.Customers_Archive
	) AS c
ON cx.PersonID = c.PrimaryContactPersonID
WHERE cx.PhoneNumber = c.PhoneNumber
