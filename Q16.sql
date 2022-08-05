/** 16.	List all stock items that are manufactured in China. (Country of Manufacture) **/

USE WideWorldImporters
GO

SELECT Warehouse.StockItems.StockItemName
FROM
Warehouse.StockItems
WHERE
ISJSON(CustomFields)>0
AND JSON_VALUE(CustomFields,'$.CountryOfManufacture')='China';
