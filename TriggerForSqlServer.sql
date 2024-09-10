select top 10 * from [Order Details] 
select * from products where ProductID= 51 --ProductID'si 51 olan ürünün UnitsInStock'u 20 olarak goruntulenir. Elimde 30 urun varsa bu durumda ne yapmak gerekir?

-- Sql Server'da Trigger Insert, Update ve Delete islemlerinden once ya da sonra calisana yapilardir.
-- SQl Server 2 adet sanal tablo ile calisir. 
-- Yeni gelen kayitlar inserted tablosunda tutulur. Silinen kayitlar ise deleted tablosunda tutulurlar. 
-- Bu sanal tablolar hafizadadir. Tables sekmesi icerisinde gorunmezler.
-- Insert sirasinda olusan kayitlar Inserted tablosunda tutulur.
-- Update islemi sirada olusan kayitlar ise yeni gelen kayit Inserted tablosunda tutulur.
-- Silinen kayitlar yani eski hali Deleted tablosunda tutulur. 
-- Kayit silme isleminde ise silinen kayitlar deleted tablosunda tutulur.

USE [Northwind]
GO
/****** Object:  Trigger [dbo].[StokKontrol]    Script Date: 27.08.2024 09:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[StokKontrol] --Önce Create Trigger sonra Alter Trigger 
--Create Trigger -> Bu, StokKontrol adında bir trigger oluşturur. Bu tetikleyici, Order Details tablosuna bir veri eklendiğinde (INSERT işleminden sonra) çalışacaktır.
--Alter Trigger -> ALTER TRIGGER [dbo].[StokKontrol] ifadesi, zaten var olan bir tetikleyiciyi günceller. Bu tetikleyici, Order Details tablosuna bir INSERT işlemi yapıldığında çalışır.
on [dbo].[Order Details]
After Insert 
as 
Begin 
   --order details tablusuna gelen kayitlari inserted tablosundan alalim.
   -- Quantity alanina gelen kayit products tablosundaki unitsinstok alaniyla kıyaslanmasi 
   declare @productid int, @quantity int, @eldekiStok int, @productName nvarchar(40)
   declare @adet as int
   -- sanal inserted tablosundaki kayitlara ulasma 
   select @productid=i.ProductID ,@quantity=i.Quantity from inserted as i  --Açıklama: inserted sanal tablosundan gelen yeni eklenen kayıtlardan ProductID ve Quantity değerleri çekilir ve bu değerler @productid ve @quantity değişkenlerine atanır. inserted tablosu, tetikleyici çalıştığında yeni eklenen verileri tutan bir geçici tablodur.

   -- product tablosuna bakilacak --Açıklama: Products tablosundan, daha önce belirlenmiş @productid ile eşleşen ürünün stok bilgisi (UnitsInStock) ve ürün adı (ProductName) alınır ve ilgili değişkenlere atanır.
   select @eldekiStok = UnitsInStock, @productName = ProductName 
   from Products 
   where ProductID=@productid

   Set @adet =@eldekiStok - @quantity -- Mevcut stoktan sipariş edilen miktarı çıkartarak sonuç @adet değişkenine atanır.
  
   if(@adet < 1) --Açıklama: Eğer elde kalan stok, sipariş miktarından azsa (stok yetersizse), bu durumda bir hata mesajı oluşturulur. RAISERROR komutu hata oluşturmak için kullanılır ve mesajda ürün adı ve eksik miktar belirtilir.
   Begin
	   RAISERROR (N'Istenilen %s %d adet eksik var', -- Message text.
		10, -- Severity,
		1, -- State,
		@productName, -- First argument.
	   @adet); -- Second argument.
	
    -- Yapilan islemi geri al demek 
    --Açıklama: Bu komut, işlemi geri alır. Yani, stok yetersizse sipariş kaydı veritabanına eklenmez ve tüm işlem iptal edilir.
	ROLLBACK 
   end

End