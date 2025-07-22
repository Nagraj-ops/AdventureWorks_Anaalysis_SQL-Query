use AdventureWorksLT2022


 ---List of Customers with Their Email and Company

SELECT CustomerID, FirstName, LastName, EmailAddress, CompanyName
FROM SalesLT.Customer;


---List of Products with Category and Model

SELECT p.ProductID, p.Name AS ProductName, pc.Name AS Category, pm.Name AS Model
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
JOIN SalesLT.ProductModel pm ON p.ProductModelID = pm.ProductModelID;

---Top 5 Customers by Total Purchase Amount

SELECT TOP 5 c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalSpent
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

---Sales Order Details with Product Names and Quantity

SELECT soh.SalesOrderID, p.Name AS ProductName, sod.OrderQty, sod.UnitPrice, sod.LineTotal
FROM SalesLT.SalesOrderHeader soh
JOIN SalesLT.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN SalesLT.Product p ON sod.ProductID = p.ProductID;

---List of Customers and Their Addresses

SELECT c.CustomerID, c.FirstName, c.LastName, a.AddressLine1, a.City, a.StateProvince, a.PostalCode
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address a ON ca.AddressID = a.AddressID;

---Total Sales by Product

SELECT p.Name AS ProductName, SUM(sod.LineTotal) AS TotalSales
FROM SalesLT.Product p
JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY TotalSales DESC;

---Orders Placed in the Year 2022

SELECT SalesOrderID, OrderDate, CustomerID, TotalDue
FROM SalesLT.SalesOrderHeader
WHERE YEAR(OrderDate) = 2008;

 ---Products Not Sold

SELECT ProductID, Name
FROM SalesLT.Product
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID
    FROM SalesLT.SalesOrderDetail
);


select * from SalesLT.SalesOrderDetail




