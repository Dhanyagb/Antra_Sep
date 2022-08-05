/** 9.	List of StockItems that the company purchased more than sold in the year of 2015. **/

 USE WideWorldImporters
 GO
 
 SELECT I.StockItemID, Quantity, OrderedOuters, YEAR(I.LastEditedWhen) AS YearofOrder, P.ReceivedOuters
 FROM Sales.InvoiceLines AS I
 INNER JOIN Purchasing.PurchaseOrderLines AS P
 ON I.StockItemID = P.StockItemID
 WHERE YEAR(I.LastEditedWhen)= '2015'
 AND Quantity> ReceivedOuters;