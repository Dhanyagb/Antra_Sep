USE WideWorldImporters
GO

SELECT Warehouse.StockItems.StockItemName
FROM
Warehouse.StockItems
WHERE
ISJSON(CustomFields)>0
AND JSON_VALUE(CustomFields,'$.CountryOfManufacture')='China';