select country ,count(country) 
from employees
group by country  -- Her bir ulkeden kac adet kayit var

-- Hangi ulkeden kac adet musterim var
/* --müşterilerin bulunduğu ülkelere göre sayım yapar ve her ülkenin müşteri sayısını döndürür. 
select country,count(*) Adet
from customers
group by country 
*/

--müşterilerin bulunduğu ülkelere göre sayım yapar ve her ülkenin müşteri sayısını döndürür. Ayrıca, sonuçları müşteri sayısına göre azalan sırada sıralar.
-- 1. Yol;
select country,count(*) 
from customers
group by country 
order by count(*) desc

--2. Yol;
select country,count(*) 
from customers
group by country 
order by 2 desc --2 numarali alana gore sirala -> 2 ifadesi, SELECT ifadesindeki ikinci sütuna (yani count(*) sütununa) karşılık gelir.

--3. Yol;
select country,count(*) Adet
from customers
group by country 
order by Adet desc 

--Ornek Uygulamalar
-- Hangi category'den kac adet urun var? --products (her kategorinin ürün sayısını döndürün.) 
select category_id, count(*) from products group by category_id order by 2 desc

-- hangi tedarikciden kac adet urun aliyorum ? --products
select supplier_id, count(*) from products group by supplier_id order by 2 desc

-- 1997 yilinda hangi ulkeye kac adet siparis gonderdim . --orders
SELECT ship_country, count(*)
FROM orders
WHERE date_part('year', order_date)=1997
GROUP BY ship_country
ORDER BY 2 DESC


/*
order_date sütunundan yıl bilgisini çıkarır ve bu bilgiyi yil olarak adlandırır.
ship_country: Siparişlerin gönderildiği ülkeyi seçer.
count(*) AS Adet: Her yıl ve ülke kombinasyonu için sipariş sayısını hesaplar ve bu sayıya Adet adını verir.
*/
select date_part('year',order_date) yil ,ship_country ,count(*) Adet    
from orders 
where date_part('year',order_date)=1997 --order_date sütunundan yıl bilgisini çıkarır ve sadece 1997 yılına ait siparişleri filtreler.
group by date_part('year',order_date),ship_country
order by Adet desc, yil desc

-- 1997 yilinda en az siparis veren ulkeler hangileridir --orders
select ship_country ,count(*) Adet 
from orders 
where date_part('year', order_date)=1997
group by ship_country
order by Adet 
limit 3

-- 1998 yilnda en fazla siparis alan calisanlarimdan ilk 3'u hangisidir. Prim verecegim.--orders
select employee_id ,count(*) Adet 
from orders 
where date_part('year',order_date)=1998
group by employee_id
order by Adet desc
limit 3

-- kargo firmalarinin taşıdıgı siparis sayisi nedir ?
select  ship_via ,count(*) Adet  
from orders
group by ship_via
order by Adet desc

