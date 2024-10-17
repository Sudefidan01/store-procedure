--Store Procedure
--Store Procedure Sql sorgu dili i�erisinde birden fazla i�lemin tan�mland��� ve yz�lma amac�na g�re geriye de�er d�nd�ren veya d�nd�rmeyen objelerdir
--Store Procedure ' ler iste�e ba�l� olarak parametre alabilirler
--SP'lerin i�erisinde Insert , Update , Delete veya Select i�emleri yap�labilir veya bu i�lemlerin hepsini bir arada kullanabilirsiniz.Herhangi bir k�s�tlama bulunmamaktad�r

--Sp'leri dizayn a��s�ndan 3 farkl� y�ntem ile y�netebilirsiniz
--	1) Create Procedure
--	2) Alter Procedure
--	3) Drop Procedure

-- 1-Create Procedure
--Yeni bir Sp olu�turmak i�in kullan�lan ifade

--Syntax
--Create Procedure | Proc (<Parametre'ler>)
--as
--begin
--	<Ssql KOmutlar�>
--end
use NORTHWND
--�rnek
--KAtegori bilgisine g�re �r�nleri listeleyen bir Sp yazal�m
create proc UrunleriListele (@catId int)
as
begin
	select * from Products where CategoryID=@catId
end

--Olu�turulan SP'leri Database i�erisinde Programmability i�erisindeki Store Procedure klas�r�nde g�rebilirsiniz
--OLu�turulan Sp'leri exec veya execute komutlar� ile �al��t�rabilirsiniz

execute UrunleriListele 3


-- 2)Alter Procedure
--Olu�turulmu� olan Sp'yi d�zenlemek veya g�ncellemek i�in kullan�l�r

--Syntax
--Alter Procedure |proc <procedureAdi> (<parametre'ler>)
--as
--begin
--	sql sorgular�
--end

--�rnek
--�r�nleriListele SP'sini tedarik�iye g�re filtreleme se�ene�i ekleyelim

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