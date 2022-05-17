Select * From Person.Person;
Select * From HumanResources.Department;
Select * From HumanResources.Employee
Select * From HumanResources.EmployeeDepartmentHistory



Select FirstName, MiddleName, LastName, BirthDate From Person.Person pp INNER JOIN HumanResources.Employee he 
ON pp.BusinessEntityID = he.BusinessEntityID;

--�al��an�n Ad�, Soyad�, Telefon Numaras�, Telefon numaras�n�n tipi istiyorum
Select FirstName, MiddleName ,LastName, PhoneNumber, ppnt.Name From Person.Person pp INNER JOIN Person.PersonPhone ppp 
ON pp.BusinessEntityID = ppp.BusinessEntityID INNER JOIN Person.PhoneNumberType ppnt 
ON ppnt.PhoneNumberTypeID = ppp.PhoneNumberTypeID;

-- �al��an�n Ad�, Soyad� Departman�n�n Ad�,
Select pp.LastName, pp.MiddleName, pp.LastName, hd.Name From Person.Person pp INNER JOIN HumanResources.Employee he
ON pp.BusinessEntityID = he.BusinessEntityID INNER JOIN HumanResources.EmployeeDepartmentHistory hedh
ON he.BusinessEntityID = hedh.BusinessEntityID INNER JOIN HumanResources.Department hd 
ON hd.DepartmentID = hedh.DepartmentID WHERE hedh.EndDate IS NULL

--Finance departman�nda ka� adet �al��an var?
Select COUNT(*) From HumanResources.Employee he INNER JOIN HumanResources.EmployeeDepartmentHistory hedh
ON he.BusinessEntityID = hedh.BusinessEntityID INNER JOIN HumanResources.Department hd
ON hd.DepartmentID = hedh.DepartmentID WHERE hd.Name = 'Finance' AND hedh.EndDate IS NULL


Select * From Sales.Customer
Select * From Sales.SalesOrderHeader
Select * From Sales.SalesOrderDetail
Select * From Sales.SalesTerritory
--Sat�� Sorular�
-- ADET BAZINDA en �ok sipari�i veren m��terimin Id si,

SELECT TOP(1) c.CustomerID, COUNT(sod.OrderQty) as OrderQtyy FROM Sales.Customer c INNER JOIN Sales.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID INNER JOIN Sales.SalesOrderDetail sod
ON soh.SalesOrderID = sod.SalesOrderID GROUP BY c.CustomerID ORDER BY OrderQtyy DESC

-- Bug�ne kadar verilmi� en y�ksek cirolu sipari�

Select TOP(1) (UnitPrice*OrderQty) AS Total, * From Sales.SalesOrderDetail sod inner join Sales.SalesOrderHeader soh 
On sod.SalesOrderID = soh.SalesOrderID ORDER BY Total Desc

-- Sipari� cirolar�m� TerriorityID ye g�re grupla. 8, 564.000

Select TerritoryID, sum(TotalDue) From Sales.SalesOrderHeader Group By TerritoryID Order By TerritoryID

-- Ka� adet sipari� gecikti?

Select COUNT(*) From sales.SalesOrderHeader Where ShipDate>DueDate;

-- En �ok sipari�im hangi b�lgeye gecikti ve ka� adet?

 Select TOP(1) stt.Name, COUNT(*) From Sales.SalesOrderHeader soh INNER JOIN Sales.SalesTerritory stt 
 ON soh.TerritoryID = stt.TerritoryID Where ShipDate>DueDate; --hatal� 

-- Vista kredi kart�yla ka� adet sipari� verilmi�tir?



-- Sipari� hesaplamala�rnda discount kolonu da kullan�lacak



-- Ta��ma �creti 50 den d���k sipari�lerimi yazd�r

Select * From Sales.SalesOrderHeader Where Freight<50;