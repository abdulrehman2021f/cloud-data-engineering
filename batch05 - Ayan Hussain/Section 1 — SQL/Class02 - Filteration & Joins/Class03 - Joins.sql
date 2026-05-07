-- Joins 

create schema hr;
go

create table hr.candidates(
	id int primary key identity,
	fullname varchar(100) not null);

create table hr.employees(
	id int primary key identity,
	fullname varchar(100) not null);


insert into 
	hr.candidates(fullname)
values
	('Saad'),
	('Mohsin'),
	('Owais'),
	('Haseeb')

insert into 
	hr.employees(fullname)
values
	('Haseeb'),
	('Saad'),
	('Bilal'),
	('Adnan')

select * from hr.candidates;
select * from hr.employees;

-- Syntax 
-- SELECT * FROM TABLE_1
-- INNER JOIN TABLE_2 
--		ON TABLE_1.COLUMN = TABLE_2.COLUMN

SELECT c.fullname FROM hr.candidates c
INNER JOIN hr.employees  e
	ON c.fullname = e.fullname

SELECT c.id as candid_id, e.id as emp_id, c.fullname FROM hr.candidates c
INNER JOIN hr.employees  e
	ON c.fullname = e.fullname

SELECT c.id as candid_id, e.id as emp_id, c.fullname FROM hr.candidates c
INNER JOIN hr.employees  e
	ON e.fullname = c.fullname;

-- product_name, list_price, category_id 
-- production.products 
-- order by product_name desc

SELECT 
	product_name, 
	list_price, 
	products.category_id,
	category_name
FROM
	production.products
INNER JOIN production.categories
	ON products.category_id = categories.category_id
order by 
	product_name desc;


 -- CUSTOMER FULL NAME, ORDER STATUS, ORDER_DATE 

 
select c.first_name + ' ' + c.last_name as full_name,
	o.order_status,
	o.order_date
from sales.customers C
INNER JOIN SALES.ORDERS O
	ON c.customer_id =o.customer_id

SELECT 
	p.product_name, 
	p.list_price, 
	p.category_id,
	c.category_name,
	b.brand_name
FROM
	production.products p
INNER JOIN production.categories c
	ON p.category_id = c.category_id
INNER JOIN production.brands b
	on p.brand_id = b.brand_id
order by 
	product_name desc;

Select
	*
from production.products as p
Left Join sales.order_items as oi
	ON OI.item_id = p.product_id
Left Join sales.orders as o
	ON o.order_id = p.product_id
order by o.order_date;

--Left Join
Select
	p.product_name,oi.order_id,oi.item_id,o.order_date
from production.products as p
Left Join sales.order_items as oi
	ON OI.item_id = p.product_id
Left Join sales.orders as o
	ON o.order_id = p.product_id
order by o.order_date;

-- Rigth Join 
Select
	p.product_name,oi.order_id
from production.products as p
right Join sales.order_items as oi
	ON OI.item_id = p.product_id
right Join sales.orders as o
	ON o.order_id = p.product_id
order by o.order_date;
--Rigth Join call Product name and order id
Select
	p.product_name,oi.order_id
from sales.order_items as oi
right Join production.products as P
	ON P.product_id = oi.product_id
order by oi.order_id;

--Example Full Outter Join 
Select
	p.product_name,oi.order_id
from sales.order_items as oi
Full Join production.products as P
	ON P.product_id = oi.product_id
order by oi.order_id;

--Cross Join 
-- This will throw an error because of the 'ON' clause
SELECT 
    p.product_name,
    oi.order_id
FROM sales.order_items AS oi
CROSS JOIN production.products AS p
ORDER BY oi.order_id;
-- Self Join

SELECT 
   e.staff_id as emp_staff_id,
   e.first_name + ' ' + e.last_name AS emp_Staff_name, 
   m.staff_id as manager_staff_id,
   m.first_name + ' ' + m.last_name AS Manager_name
FROM sales.staffs AS e
INNER JOIN sales.staffs AS m
   ON m.staff_id = e.manager_id;


SELECT 
   c1.first_name + ' ' + c1.last_name AS Customer_Name_1, 
   c1.city,
   c2.first_name + ' ' + c2.last_name AS Customer_Name_2
FROM sales.customers AS c1
INNER JOIN sales.customers AS c2
   On c1.customer_id>c2.customer_id	
   And (c1.city = c2.city)
Order By city;




Select * from sales.staffs

Select * from sales.order_items
