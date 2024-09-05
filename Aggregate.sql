-- Bu bolumdeki genel hatlar : Toplama fonksiyonlari, Gruplama fonksiyonlari, Sayma fonksiyonlari 
-- Count => bir tablodaki verilen degere gore kayit sayisini bulur. Null degerleri saymaz.

select count(*) from employees -- Tablodaki kayit sayisi
select count(first_name) from employees -- 9 kayit
select count(region) from employees -- 5 kayit cikar : null degerleri saymaz
select * from employees where region is null
select count(distinct country) from employees -- country alanini tekil sayar --DISTINCT, tekrarlanan kayıtların sayılmasını engelleyerek yalnızca benzersiz değerleri dikkate alır.

-- Sum => Toplama - SUM() fonksiyonu, bir sütundaki sayısal değerlerin toplamını döndürür.
select sum(unit_price) from products  --sayisal alanlarda calisir.
select sum(date_part('year',Birth_Date))/count(Birth_Date) 
from employees -- calisanlarin yaş ortalamasi

-- Avg => AVG() fonksiyonu, bir sütundaki sayıların ortalamasını hesaplar.
select avg(date_part('year',Birth_Date)) from employees -- yaş ortalamasi
select avg(unit_price) from products where category_id=1-- Fiyat ortalamasi 

-- Yuvarlama
--Yukari yuvarlama 
select CEILING(10.5);
select CEILING(11.5);
select CEILING(12.5);
select CEILING(13.1);
--Asagi yuvarlama
select FLOOR(10.9)
select FLOOR(10.5)
select FLOOR(10.1)
-- Normal yuvarlama
--Round 
select Round(10.5);
select Round(11.5);
select Round(12.5);
select Round(13.1);
select Round(13.6);

-- Min , Max
select  max(unit_price) from products -- max ifadesi tek bir ifade getirir.
select * from products order by unit_price desc limit 5 -- Order By ile en pahali ilk 5 urunu cagirabiliriz.
select  max(Birth_Date) from employees
select  max(First_Name) from employees
select  min(First_Name) from employees

--siralama order by
select * from employees order by first_name -- artan sirada siralar
select * from employees order by first_name desc-- azalan sirada siralar
select * from employees order by first_name desc ,Birth_Date -- ',' ile ayrilarak istenildig kadar field eklenebilir
select first_name,last_name,Birth_Date ,title 
from employees
order by 2,4  -- Secilen kolonlarin sirasina gore siralandirilabilir.

select first_name Ad,last_name Soyad,Birth_Date DogumTarih,title 
from employees
order by Soyad ,DogumTarih -- Alias ile siralama