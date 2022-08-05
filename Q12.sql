/** 12.	List all the Order Detail (Stock Item name, delivery address, delivery state, city, country, customer name, customer contact person name, customer phone, quantity) for the date of 2014-07-01. Info should be relevant to that date.**/

USE WideWorldImporters
GO

SELECT ws.StockItemName,so.OrderDate,sc.DeliveryAddressLine1,sc.DeliveryAddressLine2
FROM
Warehouse.StockItems ws
LEFT JOIN
Sales.Orders so
ON ws.SupplierID = so.SalespersonPersonID
INNER JOIN
Sales.Customers sc
ON so.SalespersonPersonID = sc.CustomerID
WHERE
so.OrderDate = '2014-07-01'