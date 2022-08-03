
USE WideWorldImporters
GO

SELECT DATEDIFF(MM,si.OrderDate,si.ExpectedDeliveryDate) AS Avg_dates_months ,sp.[StateProvinceName],si.[OrderDate], si.[ExpectedDeliveryDate]
FROM [Application].[StateProvinces] sp
INNER JOIN [Sales].[CustomerTransactions] ct
ON sp.LastEditedBy = ct.LastEditedBy
INNER JOIN [Sales].[Orders] si
ON ct.CustomerID = si.CustomerID
ORDER BY sp.StateProvinceName;
