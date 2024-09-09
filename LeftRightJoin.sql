-- Hic tasima yapmamis kargo firmalari
select s.CompanyName,count(o.OrderID) 
from Shippers s left  join orders o on s.ShipperID = o.ShipVia
group by s.CompanyName
HAVING count(o.OrderID) = 0

select s.CompanyName,count(o.OrderID) 
from Orders  o RIGHT  join Shippers s on s.ShipperID = o.ShipVia
group by s.CompanyName
HAVING count(o.OrderID) = 0


-- Hic siparis vermemis musterilerim kimlerdir ? 
select  c.CompanyName ,count(o.OrderID) adet
from Customers c left join Orders o on c.CustomerID = o.CustomerID
group by c.CompanyName
having Count(o.OrderID)  =0

select  c.CompanyName ,count(o.OrderID) adet
from orders  o  RIGHT join Customers c on c.CustomerID = o.CustomerID
group by c.CompanyName
having Count(o.OrderID)  =0

--Postgres
select  c.Company_Name ,count(o.Order_ID) adet
from orders  o  RIGHT join Customers c on c.Customer_ID = o.Customer_ID
group by c.Company_Name
having Count(o.Order_ID)  =0

-- full outer join
select p.ProductName,c.CategoryName
from Categories c 
full outer join Products p on p.CategoryID=c.CategoryID

select * 
from Shippers s
 join Orders o on s.ShipperID=o.ShipVia -- 831 row
 
 select * 
 from Shippers s
 full outer join Orders o on s.ShipperID=o.ShipVia -- 831 row

 SELECT Customers.CompanyName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CompanyName;