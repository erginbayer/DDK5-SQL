
--1) ürünleri ada göre sýrala
--Select * From Products Order By ProductName;


--2) ürünleri ada göre tersten sýrala
--Select * From Products Order By ProductName DESC


--3) ürün fiyatý 20 den büyük ve categoryid si 3 olan ürünleri fiyata göre sýrala
--Select * From Products Where UnitPrice > 20 and CategoryID = 3 Order By UnitPrice;


--4) en pahalý 5 ürünü getir
--Select top 5 * From Products Order By UnitPrice Desc; 


--5) En pahalý ürünümün fiyatý
--Select top 1 * From Products Order By UnitPrice Desc;


--6) En ucuz ürünümün fiyatý
--Select top 1 * From Products Order By UnitPrice Asc;


--7) En ucuz ürünümün KDV li fiyatý nedir?
--Select top 1 UnitPrice, (UnitPrice*1.18) as [KDV] From Products Order By UnitPrice Asc;


--8) 1996 yýlýndaki sipariþleri getir
--select * from Orders where YEAR(OrderDate) = 1996


--9) 1997 yýlýnýn Mart ayýnýn sipariþlerini getir
--select * from Orders where YEAR(OrderDate) = 1997 and MONTH(OrderDate) = 3;


--10) ShipCity - 1997 yýlýnda Londra'ya kaç adet sipariþ gitti?
--Select Count(*) from Orders Where Year(OrderDate) = 1997 and Lower(ShipCity)='london';


--11) ProductID si 5 olan ürünün kategori adý nedir
--Select c.CategoryName 
--From Products p Inner Join Categories c 
--on p.CategoryID = c.CategoryID 
--Where p.ProductID = 5


--12) Ürün adý ve ürünün kategorisinin adý
--Select p.ProductName, c.CategoryName
--From Products p Inner Join Categories c
--on p.CategoryID = c.CategoryID;


--13) Ürünün adý, kategorisinin adý ve tedarikçisinin adý
--Select p.ProductName, c.CategoryName, s.ContactName
--From Products p Inner Join Categories c 
--On p.CategoryID = c.CategoryID 
--Inner Join Suppliers s 
--on s.SupplierID = p.SupplierID;


--14) Sipariþi alan personelin adý,soyadý, sipariþ tarihi. Sýralama sipariþ tarihine göre
--Select e.FirstName + ' ' + e.LastName as [Name Surname], o.OrderDate 
--From Orders o Inner Join Employees e 
--On o.EmployeeID = e.EmployeeID Order By o.OrderDate


--15) Son 5 sipariþimin ortalama fiyatý nedir? (sepet toplamý ortalamasý)
--Select Top 5 
--o.OrderID,
--AVG(od.UnitPrice * od.Quantity) 
--From Orders o Inner Join [Order Details] od 
--on o.OrderID = od.OrderID 
--Group By o.OrderID 
--Order By o.OrderID desc;


--16) Ocak ayýnda satýlan ürünlerimin adý ve kategorisinin adý ve toplam satýþ miktarý nedir?
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


--18) Hangi ülkeden kaç müþterimiz var (distinc ve count kullanýlacak)
--Select Distinct Country, Count(*) as [Count] From Customers Group By Country;


--19) Ortalama satýþ miktarýmýn üzerindeki satýþlarým nelerdir? (order details tablosu)
--Select * From [Order Details] Where Quantity > (Select AVG(Quantity) From [Order Details])

--20) En çok satýlan ürünümün(adet bazýnda) adý, kategorisinin adý ve tedarikçisinin adý (4 tablo birleþimi)
--Products, Category, Suppliers, Order Details
--Select top 1 p.ProductName, c.CategoryName, s.ContactName From Products P
--Inner Join [Order Details] od
--on p.ProductID = od.ProductID
--Inner Join Categories c 
--on p.CategoryID = c.CategoryID
--Inner Join Suppliers s
--on p.SupplierID = s.SupplierID
--Order By od.Quantity Desc;


--21) 10248 numaralý sipariþi alan çalýþanýn adý ve soyadý ve orderid
--Select o.OrderID, e.FirstName , e.LastName From Orders o 
--Inner Join Employees e
--on o.EmployeeID = e.EmployeeID
--Where o.OrderID = 10248


--22) 1996 yýlýnda, 5 numaralý ID ye sahip çalýþaným kaç adet sipariþ aldý?
--Select Count(*) From Orders Where Year(OrderDate) = 1996 and EmployeeID = 5;


--23) 1997 yýlýnda kim ne kadar sipariþ geçti (EmployeeID, Count)
--Select Count(*) [Order Count], EmployeeID From Orders Where YEAR(OrderDate) = 1997 Group By EmployeeID;


--24) 10248 numaralý sipariþin ürünlerinin adlarý ve sipariþ miktarý
--Select o.OrderID, p.ProductName, od.Quantity From Orders o 
--Inner Join [Order Details] od 
--on o.OrderID = od.OrderID
--Inner Join Products p 
--on od.ProductID = p.ProductID
--Where o.OrderID = 10248 


--25) 10248 numaralý sipariþin toplam fiyatý
--Select SUM(UnitPrice) as [Total] From [Order Details] Where OrderID = 10248


--26) 1996 yýlýnda cirom
--Select SUM(UnitPrice * Quantity) 
--From [Order Details] od 
--Inner Join Orders o 
--on o.OrderID = od.OrderID 
--where YEAR(OrderDate) = 1996


--27) 1996 yýlýnda en çok ciro yapan employeeID
--Select Top 1 e.EmployeeID, SUM(UnitPrice * Quantity) as [TotalCiro] From [Order Details] od
--Inner Join Orders o 
--On od.OrderID = o.OrderID
--Inner Join Employees e
--on o.EmployeeID = e.EmployeeID
--Where YEAR(o.OrderDate) = 1996
--Group By e.EmployeeID
--Order By TotalCiro Desc


--28) 1997 Mart ayýndaki sipariþlerimin ortalama fiyatý nedir?
--Select AVG(UnitPrice) as [AVGUnitPrice] From Orders o
--Inner Join [Order Details] od
--on o.OrderID = od.OrderID
--Where Year(OrderDate) = 1997 and MONTH(OrderDate) = 3


--29) 1997 yýlýndaki aylýk satýþlarý sýrala. Ocak - 500 gibi toplamda 12 satýr olacak
--Select MONTH(o.OrderDate), SUM(UnitPrice*od.Quantity) as [Total] From Orders o 
--Inner Join [Order Details] od
--On o.OrderID = od.OrderID
--Where YEAR(OrderDate) = 1997
--Group By MONTH(o.OrderDate)
--Order By MONTH(o.OrderDate)


--30) En deðerli MÜÞTERÝMÝN adý ve soyadý (orders,orderdetails,customers)
--Select Top 1 c.ContactName, SUM(od.Quantity*od.UnitPrice) as [Total] From Customers c
--Inner Join Orders o 
--on c.CustomerID = o.CustomerID
--Inner Join [Order Details] od
--on o.OrderID = od.OrderID
--Group By c.ContactName
--Order By Total Desc