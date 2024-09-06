--Join Islemi
-- 1 Inner join : Bir tablodaki her bir kaydin diger tabloda bir karsiligi olan kayitlari listeler
-- inner join ifadesini yazarken inner yazmasak ta default olarak inner join işlemi yapacaktir.

-- Not: Eger sectigimiz sutunlar icerisinde her iki tabloda da ayni sutunlar var ise acikca bildirilmek zorundadir.


--Bu sorgu, products ve categories tablolarını category_id sütunu üzerinden birleştirir ve tüm sütunları döndürür.
select * from products
inner join categories on products.category_id = categories.category_id


-- Bu SQL sorgusu, products ve categories tablolarını INNER JOIN ile birleştirir ve sadece product_name (ürün adı) ile category_name (kategori adı) sütunlarını döndürür. Sadece her iki tabloda da category_id üzerinden eşleşen kayıtlar sonuç setine dahil edilir.
select products.product_name,categories.category_name 
from products
inner join categories on products.category_id = categories.category_id


-- Bu SQL sorgusu, products (ürünler), categories (kategoriler) ve suppliers (tedarikçiler) tablolarını INNER JOIN kullanarak birleştirir.
-- Bu sorguda kullanılan p, c ve s terimleri, alias (takma ad) olarak bilinir. SQL sorgularında tabloların isimlerini kısaltmak veya daha okunabilir hale getirmek için takma adlar (alias) kullanılır.
-- p -> products / c -> categories / s -> suppliers tablosunu ifade eder.
-- Örneğin; p.product_name ifadesi, products tablosundaki product_name sütununu temsil eder
select p.product_name,c.category_name ,s.company_name
from products p
inner join categories c on p.category_id = c.category_id
inner join suppliers s on s.supplier_id = p.supplier_id

-- select * from products; -- Dependent (Bağımlı) Tablo
-- select * from categories; --Independent (Bağımsız) Tablo
-- select * from suppliers; --Independent (Bağımsız) Tablo


-- Bu SQL sorgusu, orders, customers, employees ve shippers tablolarını INNER JOIN kullanarak birleştirir. Sorgu sonucunda her siparişin kim tarafından verildiği, kiminle ilgilendiği, hangi kargo şirketiyle gönderildiği ve sipariş tarihi gibi bilgiler elde edilir.
/*
1- SELECT o.order_id SiparisNo: orders tablosundaki order_id sütunu, sipariş numarası olarak seçilir ve SiparisNo olarak adlandırılır (alias).
2- c.company_name SiparisiVeren: customers tablosundaki company_name sütunu, siparişi veren müşteri şirketin adı olarak seçilir ve SiparisiVeren olarak adlandırılır.
3- (e.First_Name || ' ' || e.last_name) Calisan: employees tablosundaki First_Name ve last_name sütunları, çalışan ad ve soyadı birleştirilerek seçilir ve Calisan olarak adlandırılır.
!!! || operatörü, iki değeri birleştirmek için kullanılır. Bu, SQL’de string birleştirme (concatenation) operatörüdür.
4- s.company_name Kargo: shippers tablosundaki company_name sütunu, kargo şirketinin adı olarak seçilir ve Kargo olarak adlandırılır.
5- o.Order_Date SiparisTarihi: orders tablosundaki Order_Date sütunu, sipariş tarihi olarak seçilir ve SiparisTarihi olarak adlandırılır.

*/
select o.order_id SiparisNo,c.company_name SiparisiVeren, (e.First_Name ||' ' || e.last_name ) Calisan ,
s.company_name Kargo , o.Order_Date SiparisTarihi 
from orders o --Ana tablo orders tablosudur ve o takma adıyla kullanılır.
inner join customers c on c.customer_id=o.customer_id --customers tablosu, customer_id üzerinden orders tablosuna bağlanır. Bu bağlantı, her siparişin hangi müşteri tarafından verildiğini belirler.
inner join employees e on e.employee_id = o.employee_id --employees tablosu, employee_id sütunu üzerinden orders tablosuna bağlanır. Bu bağlantı, her siparişle ilgilenen çalışanın kim olduğunu gösterir.
inner join shippers s on s.shipper_id = o.ship_via --shippers tablosu, shipper_id sütunu üzerinden orders tablosuna bağlanır. Bu bağlantı, her siparişin hangi kargo şirketi aracılığıyla gönderildiğini gösterir.

--Almanyadan tedarik ettigim urunler hangileridir. Ve kategorileri nedir ?
select p.product_name,c.category_name, s.company_name,s.country --products tablosundaki product_name (ürün adı), categories tablosundaki category_name (kategori adı), suppliers tablosundaki company_name (tedarikçi şirket adı), suppliers tablosundaki country (ülke) sütunlarını seçer.
from products p 
inner join suppliers s on p.supplier_id=s.supplier_id --suppliers tablosunu products tablosu ile supplier_id üzerinden birleştirir. Bu bağlantı, her ürünün hangi tedarikçi tarafından sağlandığını belirler.
inner join categories c on c.category_id=p.category_id --categories tablosunu products tablosu ile category_id üzerinden birleştirir. Bu bağlantı, her ürünün hangi kategoriye ait olduğunu belirler.
where s.country='Germany' --suppliers tablosundaki country sütununda 'Germany' (Almanya) değeri olan kayıtları filtreler.



-- Yilllara gore toplam ciro dagilimi 
select date_part('year',o.order_date) Yil, --order_date sütunundan yıl bilgisini alır. AS Yil ifadesi, bu yıl bilgisini Yil olarak adlandırır.
Round(sum(FLOOR(od.unit_price*od.quantity))) Ciro --Her sipariş detayında ürünün birim fiyatı ile miktarı çarparak sipariş detayının toplam değerini hesaplar.
from orders o
inner join order_details od on o.order_id = od.order_id --rder_details tablosunu orders tablosu ile order_id üzerinden birleştirir. Bu bağlantı, her siparişin detaylarını orders tablosuna ekler.
group by date_part('year',o.order_date) --Yıl bilgisine göre gruplama yapar. Bu, yıllara göre toplam ciroyu hesaplamak için gereklidir.
order by yil --Sonuçları yıl bazında sıralar (artış sırasına göre).