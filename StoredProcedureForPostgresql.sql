--STORED PROCEDURE FOR POSTGRESQL
create or replace procedure KargoEkle(shipperid int,firmaAdi varchar,telefon varchar)
language plpgsql
as $$
declare
-- variable declaration
begin
-- stored procedure body

insert into shippers (shipper_id,company_name,phone) values(shipperid,firmaAdi,telefon);
end; $$
call KargoEkle(7,'Mng Kargo','4448899')
select * from shippers 



--CRUD 
-- Orders tablosuna insert atan procedure.
select * from orders limit 5;
-- VINET 1 numarali Employee arasin ve 1 ,10 ,40 numarali urunlarden 10 adet siparis verdin 
select * from products where product_id in (1,10,40)

-- Kayit eklemede kullanilacak komut insert komutu. 
-- insert into <tablo_adi> (column1, column2, vb.) values(value1, value2, v.b.)
insert into orders (order_id,customer_id,employee_id,order_date,required_date,shipped_date,ship_city,ship_country)
       VALUES (1000,'VINET',1,'2024-08-20','2024-09-15','2024-08-27','Istanbul','Turkey')

insert into order_details (order_id,product_id,unit_price,quantity,discount)
values(1000,40,25,10,0)

select * from order_details where order_id =1000
select * from orders where order_id=1000

-- Update => Veri guncelleme 
-- Update <tablo_adi> Set column1 = value1, value2, v.b. Where (kosul)
update orders set ship_via = 1 where order_id = 1000 --Where kosulu ile kullanilmazsa order tablosundaki tum ship_via degerlerini 1 yapar. 

--Delete => kayit silmeye yarar. 
--Delete from <tablo_adi> where <kosul>
select * from shippers
select * from orders where ship_via = 1
delete from shippers where shipper_id =1

--
SELECT *
INTO yedekUrunler
FROM products 

