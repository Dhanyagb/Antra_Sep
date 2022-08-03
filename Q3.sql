/** 3.	List of customers to whom we made a sale prior to 2016 but no sale since 2016-01-01. **/

USE WideWorldImporters
GO

SELECT DISTINCT sc.CustomerName , sct.TransactionDate
FROM Sales.Customers sc
INNER JOIN
Sales.CustomerTransactions sct
ON sc.CustomerID = sct.CustomerID
WHERE sct.TransactionDate < '2016-01-01' 
ORDER BY TransactionDate DESC;