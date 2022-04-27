--Supplierları ad sırasına göre (A-Z) listele companyName
--Select CompanyName from Suppliers Order By CompanyName ASC;

--Supplierları ad sırasına göre tersten listele (Z-A) companyName
--Select CompanyName from Suppliers Order By CompanyName DESC;

--Ülkesi si UK olan supplierları listele 
--Select * From Suppliers Where Country = 'UK';

--Ülkesi si UK olan supplierları listele  (A-Z) 
--Select * From Suppliers Where Country = 'UK' Order By CompanyName ASC;

--Fiyatı 30 dan büyük kaç ürün var? ( COUNT(*) )
--Select Count(*) From Products Where UnitPrice>30;

--Ürünlerin adını tamamen küçültüp fiyat sırasına göre tersten listele 
--Select LOWER(ProductName) as 'ProductName', UnitPrice From Products Order By UnitPrice DESC;

--CompanyName ‘a’ harfi ile başlayan supplierların sadece adını ekrana yaz 
--Select * From Suppliers Where CompanyName Like 'a%';

--İsmi a harfi ile başlayan VE fiyatı 20 den büyük eşit ürünleri isme göre listele 
--Select * From Products Where ProductName Like 'a%' AND UnitPrice > 20;

--Çalışanların ad ve soyadlarını yanyana gelecek şekilde yazdır  ( Employee)
--Select LastName + ' ' + FirstName AS 'Name and Surname' From Employees; 

--Ürünün sadece KDV li fiyatını ekrana yazdır(tek kolon)
--Select ProductID,ProductName,UnitPrice, (UnitPrice*1.18) AS 'KDV' From Products;

--Region alanı NULL olan kaç tedarikçim var? ( Supplier ) ( İnternetten bakılmalı )
--Select * From Suppliers Where Region IS NULL;
--Select * From Suppliers Where Region IS NULL;

--Null olmayanlar
--Select * From Suppliers Where Region IS NOT NULL;

--İlk 5 tedarikçimi getir  - supplier
--Select top 5 * From Suppliers;

--İlk 5 tedarikçimi getir. Sadece ID ve CompanyName yazsın - supplier
--Select top 5 SupplierID, CompanyName From Suppliers;

--CompanyName e göre ilk 5 tedarikçimi getir ve ekrana sadece isimlerini yaz 
--Select Top 5 Northwind.dbo.Suppliers.CompanyName From Northwind.dbo.Suppliers Order By Northwind.dbo.Suppliers.CompanyName;

--en ucuz 5 ürünü getir
--Select Top 5 * From Northwind.dbo.Products Order By UnitPrice;

--En ucuz 5 ürünün ortalama fiyatı nedir?
--Select Top 5 AVG(UnitPrice) as 'AVG Price' From Northwind.dbo.Products;

--Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.
--Select 'TR ' + Upper(Northwind.dbo.Products.ProductName) From Northwind.dbo.Products;
﻿
--Ürünleri ada göre sırala
--Select * From Northwind.dbo.Products Order By ProductName;

--Ürünleri ada göre tersten sırala
--Select * From Northwind.dbo.Products Order By ProductName Desc;

--Ürün adı, fiyatı ve kdv ekrana yazdır
--Select Northwind.dbo.Products.ProductName , 
--Northwind.dbo.Products.UnitPrice, (Northwind.dbo.Products.UnitPrice * 1.18) AS
--KDVunitPrice From Northwind.dbo.Products;

--Fiyatı 20den küçük ürünlerin adının başına TR ekle
--Select 'TR ' + Northwind.dbo.Products.ProductName, Northwind.dbo.Products.UnitPrice 
--From Northwind.dbo.Products Where UnitPrice <20