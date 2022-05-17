Select * From Person.Person;
Select * From HumanResources.Department;
Select * From HumanResources.Employee
Select * From HumanResources.EmployeeDepartmentHistory



Select FirstName, MiddleName, LastName, BirthDate From Person.Person pp INNER JOIN HumanResources.Employee he 
ON pp.BusinessEntityID = he.BusinessEntityID;

--Çalýþanýn Adý, Soyadý, Telefon Numarasý, Telefon numarasýnýn tipi istiyorum
Select FirstName, MiddleName ,LastName, PhoneNumber, ppnt.Name From Person.Person pp INNER JOIN Person.PersonPhone ppp 
ON pp.BusinessEntityID = ppp.BusinessEntityID INNER JOIN Person.PhoneNumberType ppnt 
ON ppnt.PhoneNumberTypeID = ppp.PhoneNumberTypeID;

-- Çalýþanýn Adý, Soyadý Departmanýnýn Adý,
Select pp.LastName, pp.MiddleName, pp.LastName, hd.Name From Person.Person pp INNER JOIN HumanResources.Employee he
ON pp.BusinessEntityID = he.BusinessEntityID INNER JOIN HumanResources.EmployeeDepartmentHistory hedh
ON he.BusinessEntityID = hedh.BusinessEntityID INNER JOIN HumanResources.Department hd 
ON hd.DepartmentID = hedh.DepartmentID WHERE hedh.EndDate IS NULL

--Finance departmanýnda kaç adet çalýþan var?
Select COUNT(*) From HumanResources.Employee he INNER JOIN HumanResources.EmployeeDepartmentHistory hedh
ON he.BusinessEntityID = hedh.BusinessEntityID INNER JOIN HumanResources.Department hd
ON hd.DepartmentID = hedh.DepartmentID WHERE hd.Name = 'Finance' AND hedh.EndDate IS NULL


Select * From Sales.Customer
Select * From Sales.SalesOrderHeader
Select * From Sales.SalesOrderDetail
Select * From Sales.SalesTerritory
--Satýþ Sorularý
-- ADET BAZINDA en çok sipariþi veren müþterimin Id si,

SELECT TOP(1) c.CustomerID, COUNT(sod.OrderQty) as OrderQtyy FROM Sales.Customer c INNER JOIN Sales.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID INNER JOIN Sales.SalesOrderDetail sod
ON soh.SalesOrderID = sod.SalesOrderID GROUP BY c.CustomerID ORDER BY OrderQtyy DESC

-- Bugüne kadar verilmiþ en yüksek cirolu sipariþ

Select TOP(1) (UnitPrice*OrderQty) AS Total, * From Sales.SalesOrderDetail sod inner join Sales.SalesOrderHeader soh 
On sod.SalesOrderID = soh.SalesOrderID ORDER BY Total Desc

-- Sipariþ cirolarýmý TerriorityID ye göre grupla. 8, 564.000

Select TerritoryID, sum(TotalDue) From Sales.SalesOrderHeader Group By TerritoryID Order By TerritoryID

-- Kaç adet sipariþ gecikti?

Select COUNT(*) From sales.SalesOrderHeader Where ShipDate>DueDate;

-- En çok sipariþim hangi bölgeye gecikti ve kaç adet?

 Select TOP(1) stt.Name, COUNT(*) From Sales.SalesOrderHeader soh INNER JOIN Sales.SalesTerritory stt 
 ON soh.TerritoryID = stt.TerritoryID Where ShipDate>DueDate; --hatalý 

-- Vista kredi kartýyla kaç adet sipariþ verilmiþtir?



-- Sipariþ hesaplamalaýrnda discount kolonu da kullanýlacak



-- Taþýma Ücreti 50 den düþük sipariþlerimi yazdýr

Select * From Sales.SalesOrderHeader Where Freight<50;