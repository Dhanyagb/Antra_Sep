/** 17.	Total quantity of stock items sold in 2015, group by country of manufacturing. **/

USE [WideWorldImporters]
GO

SELECT JSON_value(ws.CustomFields, '$.CountryOfManufacture') AS origin_country, SUM(ol.Quantity) AS sold_qty
FROM Warehouse.StockItems ws 
JOIN Sales.OrderLines ol ON ol.StockItemID = ws.StockItemID
JOIN Sales.Orders o ON o.OrderID = ol.OrderID
WHERE year(o.OrderDate) = '2015'
GROUP BY JSON_value(ws.CustomFields, '$.CountryOfManufacture')
;