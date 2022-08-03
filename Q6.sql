/**6.	List of stock items that are not sold to the state of Alabama and Georgia in 2014 **/

USE WideWorldImporters
GO

SELECT wsi.[StockItemID], wsi.[StockItemName], so.[OrderDate], c.[CityName], sp.[StateProvinceName]
FROM [Warehouse].[StockItems] wsi
INNER JOIN [Sales].[OrderLines] sol
ON wsi.StockItemID = sol. StockItemID
INNER JOIN[Sales].[Orders] so
ON sol.OrderID = so.OrderID
INNER JOIN [Application].[Cities] c
ON so.LastEditedBy = c.LastEditedBy
INNER JOIN [Application].[StateProvinces] sp
ON c.StateProvinceID = sp.StateProvinceID
WHERE sp.StateProvinceName != ('ALABAMA''GEORGIA') AND YEAR (so.OrderDate) != '2014'
ORDER BY StateProvinceName;


