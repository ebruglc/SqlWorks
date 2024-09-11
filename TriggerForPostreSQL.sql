CREATE OR REPLACE FUNCTION stok_kontrol()
   RETURNS TRIGGER
   LANGUAGE PLPGSQL
AS
$$
DECLARE --eldekistok ve fark isimli iki tam sayı değişkeni tanımlanır. Bu değişkenler, stok miktarı ve sipariş ile stok arasındaki farkı tutacak.
   eldekistok int;
   fark int;
BEGIN
   raise notice 'Yeni Kayit: % Gelen Stock Id:%', NEW, NEW.product_id ; --raise notice: Veritabanı işlemi sırasında bilgilendirme mesajı verir. --NEW ifadesi, tabloya eklenen yeni satırı temsil eder. Burada, yeni kayıt bilgilerini ve ürün ID'sini ekrana yazdırır.

select p.units_in_stock into eldekistok from products p where p.product_id = NEW.product_id ; --products tablosunda, yeni eklenen siparişin product_id ile eşleşen ürünün stok miktarı eldekistok değişkenine atanır. into eldekistok: Sorgu sonucunu eldekistok değişkenine kaydeder.
raise notice 'Eldeki Stok: %', eldekistok;
select (eldekistok - new.quantity) into fark;
  raise notice 'Eldeki Stok: %  Gelen Siparis: % ve Fark: %', eldekistok, new.quantity, fark;   
    if  fark < 0 then --Eğer fark negatifse, bu durum stok yetersizliği anlamına gelir. Bu durumda, "Yeteri kadar ürün yok" mesajı verilir.
ROLLBACK: İşlem iptal edilir, yani yeni sipariş eklenmez.
       raise notice 'Eldeki Stok: %. Yeteri kadar urun yok.', (eldekistok - new.quantity);
       ROLLBACK;
    end if ;

   if NEW.quantity < 0  then  --Eğer sipariş miktarı (NEW.quantity) sıfırdan küçükse, hata mesajı verir ve işlemi geri alır. Negatif adetle sipariş oluşturulamaz.
       raise notice 'Adet 0 dan kucuk olamaz  : %',NEW.quantity;
       ROLLBACK;
    end if;
   RETURN NEW; --eni kayıt işlemi başarılıysa, fonksiyon NEW verisini döner ve ekleme işlemi tamamlanır.
END;
$$

CREATE TRIGGER order_details_before_insert
BEFORE INSERT --Bu, tetikleyicinin INSERT (ekleme) işlemi gerçekleşmeden önce çalışacağını belirtir. Yani order_details tablosuna yeni bir satır eklenmeden önce bu tetikleyici devreye girer.
ON order_details
FOR EACH ROW -- tetikleyicinin order_details tablosuna eklenecek her bir yeni satır için ayrı ayrı çalışacağını belirtir. Yani her ekleme işlemi sırasında tetikleyici bir kez çalışır.
EXECUTE FUNCTION stok_kontrol(); --Bu ifade, tetikleyicinin hangi fonksiyonu çalıştıracağını belirtir. Burada, daha önce tanımladığımız stok_kontrol() fonksiyonu çalıştırılır. Bu fonksiyon, sipariş eklenmeden önce stok miktarını kontrol eder.

select * from order_details where order_id =10248 limit 5
delete from order_details where order_id =10248 and product_id =1 
insert into order_details (order_id, product_id, unit_price, quantity, discount)
  values (10248,1,10,400,0) --insert: order_details tablosuna yeni bir sipariş ekler. order_id 10248, product_id 1, unit_price 10, quantity 400, ve discount 0 olarak belirlenmiştir.
