
--1) �r�nleri ada g�re s�rala
--Select * From Products Order By ProductName;


--2) �r�nleri ada g�re tersten s�rala
--Select * From Products Order By ProductName DESC


--3) �r�n fiyat� 20 den b�y�k ve categoryid si 3 olan �r�nleri fiyata g�re s�rala
--Select * From Products Where UnitPrice > 20 and CategoryID = 3 Order By UnitPrice;


--4) en pahal� 5 �r�n� getir
--Select top 5 * From Products Order By UnitPrice Desc; 


--5) En pahal� �r�n�m�n fiyat�
--Select top 1 * From Products Order By UnitPrice Desc;


--6) En ucuz �r�n�m�n fiyat�
--Select top 1 * From Products Order By UnitPrice Asc;


--7) En ucuz �r�n�m�n KDV li fiyat� nedir?
--Select top 1 UnitPrice, (UnitPrice*1.18) as [KDV] From Products Order By UnitPrice Asc;


--8) 1996 y�l�ndaki sipari�leri getir
--select * from Orders where YEAR(OrderDate) = 1996


--9) 1997 y�l�n�n Mart ay�n�n sipari�lerini getir
--select * from Orders where YEAR(OrderDate) = 1997 and MONTH(OrderDate) = 3;


--10) ShipCity - 1997 y�l�nda Londra'ya ka� adet sipari� gitti?
--Select Count(*) from Orders Where Year(OrderDate) = 1997 and Lower(ShipCity)='london';


--11) ProductID si 5 olan �r�n�n kategori ad� nedir
--Select c.CategoryName 
--From Products p Inner Join Categories c 
--on p.CategoryID = c.CategoryID 
--Where p.ProductID = 5


--12) �r�n ad� ve �r�n�n kategorisinin ad�
--Select p.ProductName, c.CategoryName
--From Products p Inner Join Categories c
--on p.CategoryID = c.CategoryID;


--13) �r�n�n ad�, kategorisinin ad� ve tedarik�isinin ad�
--Select p.ProductName, c.CategoryName, s.ContactName
--From Products p Inner Join Categories c 
--On p.CategoryID = c.CategoryID 
--Inner Join Suppliers s 
--on s.SupplierID = p.SupplierID;


--14) Sipari�i alan personelin ad�,soyad�, sipari� tarihi. S�ralama sipari� tarihine g�re
--Select e.FirstName + ' ' + e.LastName as [Name Surname], o.OrderDate 
--From Orders o Inner Join Employees e 
--On o.EmployeeID = e.EmployeeID Order By o.OrderDate


--15) Son 5 sipari�imin ortalama fiyat� nedir? (sepet toplam� ortalamas�)
--Select Top 5 
--o.OrderID,
--AVG(od.UnitPrice * od.Quantity) 
--From Orders o Inner Join [Order Details] od 
--on o.OrderID = od.OrderID 
--Group By o.OrderID 
--Order By o.OrderID desc;


--16) Ocak ay�nda sat�lan �r�nlerimin ad� ve kategorisinin ad� ve toplam sat�� miktar� nedir?
--Products,Categories,
--Select p.ProductName, c.CategoryName,  od.Quantity , o.OrderDate
--From Products p Inner Join Categories c
--on p.CategoryID = c.CategoryID
--Inner Join [Order Details] od
--on p.ProductID = od.ProductID
--Inner Join Orders o 
--on od.OrderID = o.OrderID
--Where MONTH(o.OrderDate) = 1;


--17) Hangi personelim hangi personelime rapor veriyor? -- Hocaya sor.


--18) Hangi �lkeden ka� m��terimiz var (distinc ve count kullan�lacak)
--Select Distinct Country, Count(*) as [Count] From Customers Group By Country;


--19) Ortalama sat�� miktar�m�n �zerindeki sat��lar�m nelerdir? (order details tablosu)
--Select * From [Order Details] Where Quantity > (Select AVG(Quantity) From [Order Details])

--20) En �ok sat�lan �r�n�m�n(adet baz�nda) ad�, kategorisinin ad� ve tedarik�isinin ad� (4 tablo birle�imi)
--Products, Category, Suppliers, Order Details
--Select top 1 p.ProductName, c.CategoryName, s.ContactName From Products P
--Inner Join [Order Details] od
--on p.ProductID = od.ProductID
--Inner Join Categories c 
--on p.CategoryID = c.CategoryID
--Inner Join Suppliers s
--on p.SupplierID = s.SupplierID
--Order By od.Quantity Desc;


--21) 10248 numaral� sipari�i alan �al��an�n ad� ve soyad� ve orderid
--Select o.OrderID, e.FirstName , e.LastName From Orders o 
--Inner Join Employees e
--on o.EmployeeID = e.EmployeeID
--Where o.OrderID = 10248


--22) 1996 y�l�nda, 5 numaral� ID ye sahip �al��an�m ka� adet sipari� ald�?
--Select Count(*) From Orders Where Year(OrderDate) = 1996 and EmployeeID = 5;


--23) 1997 y�l�nda kim ne kadar sipari� ge�ti (EmployeeID, Count)
--Select Count(*) [Order Count], EmployeeID From Orders Where YEAR(OrderDate) = 1997 Group By EmployeeID;


--24) 10248 numaral� sipari�in �r�nlerinin adlar� ve sipari� miktar�
--Select o.OrderID, p.ProductName, od.Quantity From Orders o 
--Inner Join [Order Details] od 
--on o.OrderID = od.OrderID
--Inner Join Products p 
--on od.ProductID = p.ProductID
--Where o.OrderID = 10248 


--25) 10248 numaral� sipari�in toplam fiyat�
--Select SUM(UnitPrice) as [Total] From [Order Details] Where OrderID = 10248


--26) 1996 y�l�nda cirom
--Select SUM(UnitPrice * Quantity) 
--From [Order Details] od 
--Inner Join Orders o 
--on o.OrderID = od.OrderID 
--where YEAR(OrderDate) = 1996


--27) 1996 y�l�nda en �ok ciro yapan employeeID
--Select Top 1 e.EmployeeID, SUM(UnitPrice * Quantity) as [TotalCiro] From [Order Details] od
--Inner Join Orders o 
--On od.OrderID = o.OrderID
--Inner Join Employees e
--on o.EmployeeID = e.EmployeeID
--Where YEAR(o.OrderDate) = 1996
--Group By e.EmployeeID
--Order By TotalCiro Desc


--28) 1997 Mart ay�ndaki sipari�lerimin ortalama fiyat� nedir?
--Select AVG(UnitPrice) as [AVGUnitPrice] From Orders o
--Inner Join [Order Details] od
--on o.OrderID = od.OrderID
--Where Year(OrderDate) = 1997 and MONTH(OrderDate) = 3


--29) 1997 y�l�ndaki ayl�k sat��lar� s�rala. Ocak - 500 gibi toplamda 12 sat�r olacak
--Select MONTH(o.OrderDate), SUM(UnitPrice*od.Quantity) as [Total] From Orders o 
--Inner Join [Order Details] od
--On o.OrderID = od.OrderID
--Where YEAR(OrderDate) = 1997
--Group By MONTH(o.OrderDate)
--Order By MONTH(o.OrderDate)


--30) En de�erli M��TER�M�N ad� ve soyad� (orders,orderdetails,customers)
--Select Top 1 c.ContactName, SUM(od.Quantity*od.UnitPrice) as [Total] From Customers c
--Inner Join Orders o 
--on c.CustomerID = o.CustomerID
--Inner Join [Order Details] od
--on o.OrderID = od.OrderID
--Group By c.ContactName
--Order By Total Desc