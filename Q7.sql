/** 7.	List of States and Avg dates for processing (confirmed delivery date – order date). **/

USE WideWorldImporters
GO

SELECT DATEDIFF(DAY,si.OrderDate,si.ExpectedDeliveryDate) AS Avg_dates ,sp.[StateProvinceName],si.[OrderDate], si.[ExpectedDeliveryDate]
FROM [Application].[StateProvinces] sp
INNER JOIN [Sales].[CustomerTransactions] ct
ON sp.LastEditedBy = ct.LastEditedBy
INNER JOIN [Sales].[Orders] si
ON ct.CustomerID = si.CustomerID
ORDER BY sp.StateProvinceName;


