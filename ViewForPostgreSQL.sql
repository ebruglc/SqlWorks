create VIEW UrunlerListesi
as 
select p.product_name, c.category_name, s.company_name
from products p
inner join categories c on p.category_id = c.category_id
inner join suppliers s on s.supplier_id = p.supplier_id

select category_name, count(*) Adet
from UrunlerListesi 
Group by category_name

--SELECT * FROM UrunlerListesi WHERE category_name = 'Beverages'


