
select First_name ,last_name ,country from employees

--case kullanimi 
select First_name ,last_name ,
case(country)
   when 'USA' then 'Amerika'
   when 'UK' then 'Ingiltere'
end    

-- Eger urun fiyati 50 ucuz ise ucuz urun,50 ile 150 arasinda ise ekonomik urun , 150-200 arasinda ise pahali urun
-- 200 ve uzerinde ise lux urun kategorisine alalim
select product_name,unit_price ,
case 
    when unit_price <50 then 'Ucuz Urun'
    when unit_price >=50 and unit_price <150 then 'Ekonomik Urun'
    when unit_price >=150 and unit_price <200 then 'Pahali Urun'
    else 'Lux Urun'
end UrunSegment
from products
