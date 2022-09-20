use quanlybanhang;
select * from customer;
insert into Customer(cName,cAge) values('Minh Quan', 10),
('Ngoc Oanh', 20),
('Hong Ha',50);
insert into Oder(cId, oDate, oTotalPrice) values(2, 3/21/2006,null),
(3, 3/23/2006,null),
(2, 3/16/2006, null);
select * from oder;
insert into product(pName, pPrice) values('May giat', 3),
('Tu lanh',5),
('Dieu hoa', 7),
('Quat',1),
('Bep dien', 2);
select * from product;
insert into oderdetail(oId, pId, odQTY) values(1,1,3),
(1,3,7),(1,5,3),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
select * from oderdetail;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order 
select oId, oDate, oTotalPrice from Oder;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cName, p.pName from customer c 
join oder o on o.cId = c.cId
join oderDetail oder on oder.oId = o.oId
join product p on p.pId = oder.pId;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.cName from customer c left join oder o on o.cId = c.cId where o.cId is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)

select oder.oID, oDate, sum(odQTY * pPrice) as Total from oder 
join oderdetail on oder.oID = oderdetail.oID
join product on oderdetail.pId = product.pid
group by oder.oId, oDate;


