--SQL Server
SELECT *
FROM Suppliers
WHERE EXISTS 
(SELECT ProductName 
FROM Products 
WHERE Products.SupplierID = Suppliers.supplierID AND UnitPrice > 200);

--PostgreSQL
SELECT *
FROM Suppliers
WHERE EXISTS 
(SELECT Product_Name 
FROM Products 
WHERE Products.Supplier_ID = Suppliers.supplier_ID AND Unit_Price > 200);