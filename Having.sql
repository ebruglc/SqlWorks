
-- Ulkelerin siparislerinin yillara gore dagilimini bulalim
select date_part('year',order_date) as yil, ship_country, count(*) as adet
from orders
group by date_part('year', order_date),ship_country
having count(*) >=10 and count(*)<=20 --yıl ve ülke kombinasyonu için sipariş sayısının 10 ile 20 arasında olanları filtreler.
order by adet DESC


select * from order_details limit 20
-- En yuksek cirolu ilk 5 siparis
-- Her siparişin toplam cirosunu (unit_price * quantity) hesaplar, cirosu en yüksek olan 5 siparişi döndürür.
select order_id, sum(unit_price*quantity) as Ciro --Ciro, bir ürünün birim fiyatı (unit_price) ile miktarının (quantity) çarpılmasıyla elde edilir ve toplam ciroyu bulmak için her siparişin satırları toplanır. 
from order_details 
GROUP by Order_id 
order by Ciro desc 
limit 5

select * from order_details where order_id=10865

-- Toplam cirosu 5000 ile 10000 arasi olan siparislerin listesi
select order_id ,sum(unit_price*quantity) Ciro 
from order_details 
GROUP by Order_id 
having sum(unit_price*quantity) >5000 and sum(unit_price*quantity) <10000 --HAVING koşulu, gruplama ve toplama işlemlerinden sonra filtreleme yapar. Burada, sadece toplam cirosu 5000'den büyük ve 10000'den küçük olan siparişler filtrelenir.
order by Ciro desc 


--between ile cozumu
select order_id ,sum(unit_price*quantity) Ciro 
from order_details 
GROUP by Order_id 
having sum(unit_price*quantity) between 5000 and 10000
order by Ciro desc 
