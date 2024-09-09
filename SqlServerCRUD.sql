-- Kayit Ekleme insert keyword ile olusturulur.
-- Kullanimi insert into <Tablo_Adi> (column1,column2,column3,v.b..)
--                  values (value1,value2,value3,v.b..)

insert into shippers (companyname,phone) values ( 'Express Kargo','0850 333 44 55')

-- Update islemi : Update <tablo_ismi> set column1=value1 , column2=value2,v.b.. 
--                        where .... 
-- Genelde where sarti unutulabiliyor . Bu yuzden Update ve Delete islemleri yapmadan once 
-- Tablonun ya da daha iyisi database'in backup 'ini alin. Yoksa veri kaybi yasanabilir.
select * from Shippers
update shippers set ShipperID =22 where CompanyName='Speedy Express'

-- Delete komutuda mutlaka where sarti ile kullanilmalidir.
-- Delete from <Tablo_adi> where ....
delete from Shippers where CompanyName='Speedy Express'
select * from orders where ShipVia=1

-- Tablo yedegini almadan update delete calismasi yapmayin!
-- Yedek Alma Kodu
SELECT *
INTO yedekMusteriler
FROM customers 
--WHERE Country='Germany'

select * from yedekMusteriler