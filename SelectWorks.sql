-- Tek satirlik, yorum satiri
/*
 Cok satirlik, yorum satiri
*/

--Select veritabanindaki tablolari ya da view'leri sorgulamaya yarar.
--Genel kullanimi Select * from <tablo_adi>

--Ornekler: Product'lari listeleyelim
SELECT * FROM products;
SELECT * FROM categories;
SELECT * FROM shippers;
SELECT * FROM employees;

--SQL Server kullanıyorsanız, LIMIT anahtar kelimesi geçerli değildir. Bunun yerine, TOP ifadesini kullanmanız gerekir
SELECT * FROM orders limit 5; -- SQL Server yazimi -> SELECT TOP 5 * FROM orders;
SELECT * FROM order_details limit 5; -- SQL Server yazimi -> SELECT TOP 5 * FROM order_details; 
SELECT * FROM products WHERE product_id=11
SELECT * FROM products WHERE product_id=72

SELECT * FROM suppliers


/*
SELECT ifadesinde * kullanilirsa tablodaki butun field alanlari gelir.
Bu genelde tercih edilmez. Cunku fazladan network trafigine neden olur.
Bundan kacmanin yolu ihitiyac duyulan field'lerin tek tek aralarinda , olmak kaydiyla belirlenmesidir.
*/

SELECT employee_id,first_name,last_name FROM employees; --Bu sekilde sorgu tercih edilir.
SELECT * FROM employees;

--Data Filtreleme: Filtreleme yapmak icin WHERE sarti kullanilir.
--Ornek: Amerika'daki musterilerin listesi
SELECT * FROM customers WHERE country ='USA' ; --ulkelerin tutuldugu yer country oldugu icin 
--Ornek: Amerika'daki musterilerin Seattle'da olanlarinin listesi
SELECT * FROM customers WHERE country ='USA' and city = 'Seattle' ;

--WHERE sartinda null kayitlarin aranmasi
SELECT * FROM customers WHERE region IS NULL

--Tarih ile ilgili alanlarin sorgulanmasi
SELECT * FROM orders WHERE date_part('year', ORder_Date) = 1996
SELECT * FROM orders WHERE date_part('month', ORder_Date) = 7
SELECT * FROM orders WHERE date_part('day', ORder_Date) = 5

--Sayisal alanlarda sorgulama
SELECT * FROM orders WHERE ship_via = 3 --3 numarali kargocunun tasidigi urunler
SELECT * FROM suppliers

--Amerika disindaki tefarikcilerin listesi
SELECT * FROM suppliers WHERE country != "USA"