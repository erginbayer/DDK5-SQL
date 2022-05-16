-- ETicaret Veritaban�
-- �r�n�n kendine ait 5 kolonu olacak
-- �R�n�n birden fazla kategorisi olabilir.
-- Her kategorinin �st veya alt kategorisi olabilir.
-- Kullan�c�lar�n en az 4 kolonu olacak.
-- Kullan�c�lar �r�nleri favoriye ekleyebilecek. ( Favori tablosu )
-- Kullan�c�lar siteden bir veya birden fazla �r�n alabilir. (Sipari�, sipari� detay tablolar�)
-- �ehir ve il�e tablolar� olacak. sipari�in il�e id si olacak **
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