create VIEW UrunlerListesi
AS 
select p.ProductName, c.CategoryName, s.CompanyName
from products p
inner join categories c on p.CategoryID = c.CategoryID
inner join suppliers s on s.SupplierID = p.SupplierID;

select CategoryName, count(*) Adet
from UrunlerListesi 
Group by CategoryName

--Silip tekrar denemek icin
DROP VIEW UrunlerListesi;

