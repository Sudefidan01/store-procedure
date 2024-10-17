--Store Procedure
--Store Procedure Sql sorgu dili içerisinde birden fazla iþlemin tanýmlandýðý ve yzýlma amacýna göre geriye deðer döndüren veya döndürmeyen objelerdir
--Store Procedure ' ler isteðe baðlý olarak parametre alabilirler
--SP'lerin içerisinde Insert , Update , Delete veya Select iþemleri yapýlabilir veya bu iþlemlerin hepsini bir arada kullanabilirsiniz.Herhangi bir kýsýtlama bulunmamaktadýr

--Sp'leri dizayn açýsýndan 3 farklý yöntem ile yönetebilirsiniz
--	1) Create Procedure
--	2) Alter Procedure
--	3) Drop Procedure

-- 1-Create Procedure
--Yeni bir Sp oluþturmak için kullanýlan ifade

--Syntax
--Create Procedure | Proc (<Parametre'ler>)
--as
--begin
--	<Ssql KOmutlarý>
--end
use NORTHWND
--Örnek
--KAtegori bilgisine göre ürünleri listeleyen bir Sp yazalým
create proc UrunleriListele (@catId int)
as
begin
	select * from Products where CategoryID=@catId
end

--Oluþturulan SP'leri Database içerisinde Programmability içerisindeki Store Procedure klasöründe görebilirsiniz
--OLuþturulan Sp'leri exec veya execute komutlarý ile çalýþtýrabilirsiniz

execute UrunleriListele 3


-- 2)Alter Procedure
--Oluþturulmuþ olan Sp'yi düzenlemek veya güncellemek için kullanýlýr

--Syntax
--Alter Procedure |proc <procedureAdi> (<parametre'ler>)
--as
--begin
--	sql sorgularý
--end

--Örnek
--ÜrünleriListele SP'sini tedarikçiye göre filtreleme seçeneði ekleyelim

alter proc UrunleriListele (@catID int , @supID int)
as
begin
	select * from Products
	where CategoryID=@catID and SupplierID=@supID
end

exec UrunleriListele 3,8

-- 3)Drop Procedure
--Syntax
--Drop Procedure | Proc

drop proc UrunleriListele