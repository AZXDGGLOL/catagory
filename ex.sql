--1 แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า
select c.CategoryName, p.Productname, p.Unitprice
from Products as p , Categories as c
where p.CategoryID = c.CategoryID

select CategoryName, Productname, Unitprice
from products as p  join Categories as c
ON p.CategoryID = c.CategoryID
--2 จงแดสงข้อมูลหมายเลขใบสั่งชื้อและชื่อบริษัทขนส่งสิน้
select CompanyName, OrderID
from   Orders,   Shippers
where Shippers.shipperID = Orders.Shipvia

select CompanyName, OrderID
from   Orders join  Shippers
on Shippers.shipperID = Orders.Shipvia
--ต้องการรหัสสินค้า ชื่อสิน้า บรัษัทผู้จำหน่าย ประเทศ
select p.productID, p.productName, s.CompanyName, s.country
from Products p join Suppliers s on p.SupplierID = s.SupplierID 

select p.productID, p.productName, s.CompanyName, s.country
from Products p , Suppliers s where p.SupplierID = s.SupplierID 

--จงแสดงข้อมูลหมยเลขใบสั่งชื้อและชื่อบริษัทขนส่งสินค้าของใบสั่งชื้อหมยเลข 10275

select CompanyName, OrderID
from   orders,Shippers
where  Shippers.ShipperID = Orders.ShipVia
AND  OrderID = 10275

select CompanyName, OrderID
From Orders Join  Shippers
on Shippers.ShipperID=Orders.Shipvia
where OrderID=10275

--ต้องการรหัสรหัสพนักงาน ชื่อพนักงาน รหัสใบสั่งชิ้อที่เกี่ยวข้อง เรียงตมลำดับรหัสพนักงาน
select e.EmployeeID , FirstName , o.OrderID
from Employees as e join orders as o on e.EmployeeID = o.EmployeeID  
order by EmployeeID
-- ต้องการรหัสสินค้า เมือง และประเทศของบริษัทผู้จำห่าย
select productID ,ProductName, city, Country
from Products p join Suppliers s on p.SupplierID = s.SupplierID

-- ต้องการชื่อบริษัทขนส่ง และจำนวนใบสั่งชื้อที่เกี่ยวข้อง
select CompanyName, count(*)
from orders as o join shippers as s on o.Shipvia = s.shipperID
GROUP BY CompanyName
-- ต้องการรหัสสินค้า ชื่อ และจำนวนทั้งหมดที่ขายได้
select p.ProductID, p.ProductName, sum(Quantity)
from products p join [Order Details] od  on  p.ProductID = od.ProductID
GROUP BY p.ProductID,p.ProductName
order by 1

--ต้องการ รหัสพนักงาน ชืีอพนักงาน จำนวนใบสั่งชื้อที่เกี่ยวข้อง ผลรวมของค่ขนส่งในปี 1998
SELECT e.EmployeeID, FirstName , count(*) as [จำนวน order]
        , sum(freight) as [sum of freight]
from Employees e join Orders o on e.EmployeeID = o.EmployeeID
where year(orderdate) = 1998
group by e.EmployeeID, FirstName

-- ต้องการรหัสสินค้า ชื่อสินค้า ที่ nancy  ขายได้ ทั้งหมด เรียงตามลำดับรหัสสิน้า
select distinct p.ProductID,p.ProductName
from Employees e join orders o on e.EmployeeID = o.EmployeeID
                join [Order Details] od on o.OrderID = od.OrderID
                join products p on od.ProductID = p.ProductID
where e.FirstName = 'Nancy'
ORDER BY productID
-- ต้องการชื้อบริษัท ลูกคค้าชื้อ around the horn ชื้อสินค้าที่มาจากประเทศอะไรบ้าง
Select distinct s.Country
from Customers c join orders o on c.CustomerID = o.CustomerID
                join [Order Details]  od on o.OrderID = od.orderID
                join Products p on od.ProductID = p.ProductID
                join Suppliers s on s.SupplierID = p.SupplierID
where c.CompanyName = 'Around the Horn'
-- บริษัทลูกค้าชื่อ Around the Horn ซื้อสินค้าอะไรบ้าง จำนวนเท่าใดSelect distinct s.Country
Select p.ProductID, p.ProductName, sum(Quantity) as [sum of Quantity]
from Customers c join orders o on c.CustomerID = o.CustomerID
                join [Order Details]  od on o.OrderID = od.orderID
                join Products p on od.ProductID = p.ProductID
                join Suppliers s on s.SupplierID = p.SupplierID
where c.CompanyName = 'Around the Horn'
GROUP BY p.ProductID, p.ProductName
ORDER BY 1
-- ต้องการหมายเลขใบสั่งชื้อ ชื่อพนักงาน และยอดขายในใบสั่งชื้อนั้น
select o.OrderID, e.FirstName,
        sum((od.Quantity * od.UnitPrice * (1-od.discount))) as totalCash
from orders o join Employees e on o.EmployeeID = e.EmployeeID
            join [Order Details] od on o.OrderID = od.OrderID
GROUP BY o.OrderID, e.FirstName
ORDER BY OrderID