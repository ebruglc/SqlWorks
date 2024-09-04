SELECT * FROM customers WHERE country = 'USA' and city = 'Seattle' --MSS'de key sensitive durumu bulunmadiginda buyuk/kucuk harf denetimi yoktur. USA veya usa run edebilir.
SELECT * FROM customers WHERE region IS NULL

SELECT * FROM orders WHERE year(ORderDate) = 1996;
SELECT * FROM orders WHERE month(ORderDate) = 7;
SELECT * FROM orders WHERE day(ORderDate) = 5;
SELECT * FROM orders WHERE datepart(year, ORderDate) = 1996
