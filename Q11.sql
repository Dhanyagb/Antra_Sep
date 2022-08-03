/** 11.	List all the cities that were updated after 2015-01-01. **/

USE WideWorldImporters
GO
SELECT [CityID],[CityName],[ValidFrom]
FROM [Application].[Cities]
WHERE ValidFrom > '2015-01-01'