/** 4.	List of Stock Items and total quantity for each stock item in Purchase Orders in Year 2013. **/
USE WideWorldImporters
GO

SELECT wsi.[StockItemID], wsi.[StockItemName],po.[OrderDate],
		SUM(sil.Quantity) AS Total_Quantity
FROM [Purchasing].[PurchaseOrderLines] pol 
JOIN [Purchasing].[PurchaseOrders] po
ON pol.PurchaseOrderID = po.PurchaseOrderID 
JOIN
	(SELECT [StockItemID],[StockItemName]
	FROM [Warehouse].[StockItems]
	UNION
	SELECT[StockItemID],[StockItemName]
	FROM [Warehouse].[StockItems_Archive]) AS wsi
ON wsi.StockItemID = pol.StockItemID
JOIN[Sales].[InvoiceLines] sil
ON sil.StockItemID = wsi.StockItemID
WHERE po.OrderDate = '2013'
GROUP BY wsi.[StockItemID], wsi.[StockItemName],po.[OrderDate]
ORDER BY wsi.StockItemID;
