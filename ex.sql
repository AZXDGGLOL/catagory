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

--จงแสดงข้อมูลหมยเลขใบสั่งชื้อและชื่อบริษัทขนส่งส