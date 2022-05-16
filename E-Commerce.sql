-- ETicaret Veritabaný
-- Ürünün kendine ait 5 kolonu olacak
-- ÜRünün birden fazla kategorisi olabilir.
-- Her kategorinin üst veya alt kategorisi olabilir.
-- Kullanýcýlarýn en az 4 kolonu olacak.
-- Kullanýcýlar ürünleri favoriye ekleyebilecek. ( Favori tablosu )
-- Kullanýcýlar siteden bir veya birden fazla ürün alabilir. (Sipariþ, sipariþ detay tablolarý)
-- Þehir ve ilçe tablolarý olacak. sipariþin ilçe id si olacak **
Create Table Product
(
ID int PRIMARY KEY IDENTITY(1,1),
Name nvarchar(max) NOT NULL,
Explanation nvarchar(100),
Price money NOT NULL,
StockQuantity int NOT NULL	
)

Create Table Category
(
ID int PRIMARY KEY IDENTITY(1,1),
Name nvarchar(max) NOT NULL,
SubID int NOT NULL
)

Create Table CategoryProduct
(
CategoryID int NOT NULL,
ProductID int NOT NULL
)

Create Table User
(
ID int PRIMARY KEY IDENTITY(1,1),
FirstName nvarchar(max) NOT NULL,
LastName nvarchar(max) NOT NULL,
Email nvarchar(max),
Password nvarchar(max)
)

Create Table Favorite
(
UserID int NOT NULL,
ProductID int NOT NULL
)

Create Table ProductCart
(
ID int PRIMARY KEY IDENTITY(1,1),
ProductID int NOT NULL,
Quantity int NOT NULL
)

Create Table Order (
ID int PRIMARY KEY IDENTITY (1,1),
ProductCartID int NOT NULL,
TotalPrice money NOT NULL,
AddressID int NOT NULL
)

Create Table City (
ID int PRIMARY KEY IDENTITY (1,1),
Name nvarchar (MAX) NOT NULL,
)
Create Table County (
ID int PRIMARY KEY IDENTITY (1,1),
Name nvarchar (MAX) NOT NULL,
)

Create Table Address (
ID int PRIMARY KEY IDENTITY (1,1),
CityID int NOT NULL,
CountyID int NOT NULL,
DetailedAddress nvarchar(MAX),
)