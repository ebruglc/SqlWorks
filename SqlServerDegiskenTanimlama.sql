-- Declare keyword ile tanimlama yapilir. 
-- degisken isimleri mutlaka @ isareti ile baslamak zorundadir.
declare @sayi1 as int =0;
DECLARE @sayi2 int 
declare @dogurmTarihi DATETIME
declare @isim char(10) -- Sabit uzunlukta 10 elemanli 
declare @soyisim varchar(50);
declare @adres nvarchar(50);

declare @pi decimal(18,5) = 3.14;

--DEgiskenler deger atama 
--1. Yol Set komutu ile
set @isim = 'Ali';
--2. yol Select kullanarak 
select @soyisim = 'Yilmaz'

--degiskenleri ekrana yazdirma 
--1.yol print komutu 
print @isim 
print @soyisim 
-- 2. yol select
select @isim, @soyisim