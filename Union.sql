-- Union : iki farkli sorguyu tek bir sonuc olarak birlestirmeye yarar.
-- Sorgudaki kolon sayilari ayni olmak zorundadir. Gelen kayitlar tekildir. 
-- Hepsini gormek istersek union all ifadesini kullanamk gerekir.
--The Union operator selects only distinct values by default. To allow duplicate values, use UNION ALL;

SELECT p.product_id , p.product_name 
from products p 
UNION  --UNION ALL
SELECT p1.product_id , p1.product_name 
from yedekurunler p1 


