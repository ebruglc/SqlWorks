-- Like Kullanimi where sartindan sonra kullanilir.
--LIKE '%c' -> Bas harfi m olanlari cagirir.
select * from  employees where first_name ILIKE 'm%' -- Postgresql icin (Postgresql key sensitive oldugu icin "ILIKE" kullanmıs olduk. Boylece m/M fark etmeksizin komutu cgiracaktir.)
select * from  employees where first_name LIKE 'M%'  -- Postgresql icin
select * from  Employees where FirstName LIKE 'm%' -- Sql Server  icin
select * from  customer  where first_name LIKE 'm%' --mysql 

--First Name a ile bitenler
select * from  Employees where FirstName LIKE '%a'
--FirstName icerisinde 'an' olanlar
select * from  Employees where FirstName LIKE '%an%'
-- ismin ilk harf a olacak ikinci harf onemli degil  3 harf n olan calisan
select * from  Employees where FirstName LIKE 'a_n%'
-- Notlarda Italian kelimesi gecen calisanlar
select * from  Employees where Notes LIKE '%Italian%'

--------------------------------------------------------------------

-- Adinin ilk harfi a yada l olanlar
select * from  Employees where FirstName LIKE 'a%' or FirstName like 'l%'
select * from  Employees where FirstName LIKE '[al]%' 

-- Postgres icin
select * from  Employees where First_Name ILIKE 'a%' or First_Name ILIKE 'l%'  
SELECT * FROM employees WHERE first_name SIMILAR TO '[AL]%' or first_name SIMILAR TO '[al]%'
SELECT * FROM employees WHERE UPPER(first_name) SIMILAR TO '[AL]%' 

--Sql server

select * from  Employees 
where FirstName LIKE '[J-R]%' 
order by FirstName

SELECT * FROM employees 
WHERE UPPER(first_name) SIMILAR TO '[J-R]%' 
Order By first_name

-- First_name icerisinde a yada l olan kayitlar
SELECT * FROM employees 
WHERE LOWER(first_name) SIMILAR TO '%[al]%' 
Order By first_name

-- Sql server da
SELECT * FROM employees 
WHERE firstname like '%[al]%' 
Order By firstname