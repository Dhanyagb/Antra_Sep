/** 10.	List of Customers and their phone number, together with the primary contact person’s name, to whom we did not sell more than 10  mugs (search by name) in the year 2016. **/

USE WideWorldImporters
GO

SELECT sc.CustomerName, sc.PhoneNumber,ap.FullName AS Primay_Contact
FROM Sales.Customers sc
INNER JOIN
Application.People ap
ON
sc.PrimaryContactPersonID= ap.PersonID
INNER JOIN
Warehouse.StockItems ws
ON ws.LastEditedBy= ap.LastEditedBy
RIGHT JOIN 
Warehouse.StockItemTransactions wst
ON wst.StockItemID= ws.StockItemID
WHERE ws.StockItemName  LIKE '%mug%'
AND 
ws.QuantityPerOuter <=10
AND YEAR(TransactionOccurredWhen)='2016';


