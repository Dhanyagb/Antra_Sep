/** 5.	List of stock items that have at least 10 characters in description. **/

USE WideWorldImporters
GO

SELECT [StockItemID], [StockItemName]
FROM [Warehouse].[StockItems]
WHERE LEN(StockItemName) >= 10
UNION
SELECT [StockItemID],[StockItemName]
FROM [Warehouse].[StockItems_Archive]
WHERE LEN(StockItemName) >=10

