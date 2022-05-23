drop database ecommerce;
create database ecommerce;
use ecommerce;

-- 1) You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the Ecommerce with the schema definition given below:

-- Supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
create table supplier (
SUPP_ID int primary key auto_increment,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50) NOT NULL,
SUPP_PHONE varchar(50) NOT NULL
);

-- Customer (CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)
create table customer (
CUS_ID int primary key auto_increment,
CUS_NAME varchar(20) NOT NULL,
CUS_PHONE varchar(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER char(1)
);

-- Category (CAT_ID,CAT_NAME)
create table category (
CAT_ID int primary key auto_increment,
CAT_NAME varchar(20) NOT NULL
);

-- Product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) 
create table product (
PRO_ID int primary key auto_increment,
PRO_NAME varchar(20) NOT NULL DEFAULT "Dummy",
PRO_DESC varchar(60),
CAT_ID int,
foreign key(CAT_ID) references category(CAT_ID)
);

-- SupplierPricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE)
create table supplier_pricing (
PRICING_ID int primary key,
PRO_ID int NOT NULL,
SUPP_ID int NOT NULL,
SUPP_PRICE int NOT NULL DEFAULT 0,
foreign key (PRO_ID) references product(PRO_ID),
foreign key (SUPP_ID)references supplier (SUPP_ID)
);

-- Order (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)
create table `order` (
ORD_ID int primary key auto_increment,
ORD_AMOUNT int NOT NULL,
ORD_DATE date NOT NULL,
CUS_ID int,
PRICING_ID int,
foreign key (CUS_ID) references customer (CUS_ID ),
foreign key (PRICING_ID) references supplier_pricing(PRICING_ID)
);

-- Rating (RAT_ID,ORD_ID,RAT_RATSTARS)
create table rating (
RAT_ID int primary key auto_increment,
ORD_ID int,
RAT_RATSTARS int NOT NULL, 
foreign key(ORD_ID) references `order`(ORD_ID)
);

show tables;
desc supplier;
desc customer;
desc category;
desc product;
desc supplier_pricing;
desc `order`;
desc rating;

-- 2) Insert the following data in the table created above:

insert into supplier values(1,'Rajesh Retails','Delhi','1234567890');
insert into supplier values(2,'Appario Ltd.','Mumbai','2589631470');
insert into supplier values(3,'Knome products','Banglore','9785462315');
insert into supplier values(4,'Bansal Retails','Kochi','8975463285');
insert into supplier values(5,'Mittal Ltd.'	,'Lucknow','7898456532');
select * from supplier;

insert into customer values(1,'AAKASH','9999999999','DELHI','M');
insert into customer values(2,'AMAN','9785463215','NOIDA','M');
insert into customer values(3,'NEHA','9999999999','	MUMBAI','F');
insert into customer values(4,'MEGHA','9994562399','KOLKATA','F');
insert into customer values(5,'PULKIT','7895999999','LUCKNOW','M');
select * from customer;

insert into category values(1,'BOOKS');
insert into category values(2,'GAMES');
insert into category values(3,'GROCERIES');
insert into category values(4,'ELECTRONICS');
insert into category values(5,'CLOTHES');
select * from category;

insert into product values(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
insert into product values(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5);
insert into product values(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
insert into product values(4,'OATS','Highly Nutritious from Nestle',3);
insert into product values(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
insert into product values(6,'MILK','1L Toned MIlk',3);
insert into product values(7,'Boat Earphones','1.5Meter long Dolby Atmos',4);
insert into product values(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5);
insert into product values(9,'Project IGI','compatible with windows 7 and above',2);
insert into product values(10,'Hoodie','Black GUCCI for 13 yrs and above',5);
insert into product values(11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1);
insert into product values(12,'Train Your Brain','By Shireen Stephen',1);
select * from product;

insert into supplier_pricing values(1,1,2,1500);
insert into supplier_pricing values(2,3,5,30000);
insert into supplier_pricing values(3,5,1,3000);
insert into supplier_pricing values(4,2,3,2500);
insert into supplier_pricing values(5,4,1,1000);
INSERT INTO supplier_pricing VALUES(6,12,2,780);
INSERT INTO supplier_pricing VALUES(7,12,4,789);
INSERT INTO supplier_pricing VALUES(8,3,1,31000);
INSERT INTO supplier_pricing VALUES(9,1,5,1450);
INSERT INTO supplier_pricing VALUES(10,4,2,999);
INSERT INTO supplier_pricing VALUES(11,7,3,549);
INSERT INTO supplier_pricing VALUES(12,7,4,529);
INSERT INTO supplier_pricing VALUES(13,6,2,105);
INSERT INTO supplier_pricing VALUES(14,6,1,99);
INSERT INTO supplier_pricing VALUES(15,2,5,2999);
INSERT INTO supplier_pricing VALUES(16,5,2,2999);
select * from supplier_pricing;

insert into `order` values(101,1500,'2021-10-06',2,1);
insert into `order` values(102,1000,'2021-10-12',3,5);
insert into `order` values(103,30000,'2021-09-16',5,2);
insert into `order` values(104,1500,'2021-10-05',1,1);
insert into `order` values(105,3000,'2021-08-16',4,3);
insert into `order` values(106,1450,'2021-08-18',1,9);
insert into `order` values(107,789,'2021-09-01',3,7);
insert into `order` values(108,780,'2021-09-07',5,6);
insert into `order` values(109,3000,'2021-00-10',5,3);
insert into `order` values(110,2500,'2021-09-10',2,4);
insert into `order` values(111,1000,'2021-09-15',4,5);
insert into `order` values(112,789,'2021-09-16',4,7);
insert into `order` values(113,31000,'2021-09-16',1,8);
insert into `order` values(114,1000,'2021-09-16',3,5);
insert into `order` values(115,3000,'2021-09-16',5,3);
insert into `order` values(116,99,'2021-09-17',2,14);
select * from `order`;

insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,1);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,4);
insert into rating values(8,108,4);
insert into rating values(9,109,3);
insert into rating values(10,110,5);
insert into rating values(11,111,3);
insert into rating values(12,112,4);
insert into rating values(13,113,2);
insert into rating values(14,114,1);
insert into rating values(15,115,1);
insert into rating values(16,116,0);
select * from rating;

-- 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

select CUS_GENDER, count(CUS_GENDER) from customer
where CUS_ID in (select CUS_ID from `order` group by CUS_ID
having sum(ORD_AMOUNT) >=3000)
group by CUS_GENDER
order by CUS_GENDER;

-- 4) Display all the orders along with product name ordered by a customer having Customer_Id=2

select ORD_ID, ORD_AMOUNT, ORD_DATE, O.CUS_ID, O.PRICING_ID, PRO_NAME
from `order` O, customer C, SUPPLIER_PRICING SP, product P
where  O.CUS_ID = C.CUS_ID
and O.PRICING_ID = SP.PRICING_ID
and SP.PRO_ID = P.PRO_ID
and C.CUS_ID = 2;

-- 5) Display the Supplier details who can supply more than one product

select * from supplier where 
SUPP_ID in (select SUPP_ID from supplier_pricing group by SUPP_ID having count(SUPP_ID) > 1);

-- 6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product

select @@session.sql_mode into @session_sql_mode;
set session sql_mode='';

select c.CAT_ID, CAT_NAME, PRO_NAME, MIN_PRICE from
(select CAT_ID, p.PRO_ID, min(SUPP_PRICE) as MIN_PRICE from supplier_pricing sp, product p where
sp.PRO_ID = p.PRO_ID group by p.CAT_ID) as CAT_MIN_PRICE, category c, product p
where c.CAT_ID = p.CAT_ID
and p.PRO_ID = CAT_MIN_PRICE.PRO_ID;

set session sql_mode=@session_sql_mode;

-- 7) Display the Id and Name of the Product ordered after “2021-10-05”.

select p.PRO_ID, PRO_NAME from product p, supplier_pricing sp, `order` o
where p.PRO_ID = sp.PRO_ID
and sp.PRICING_ID = o.PRICING_ID
and o.ORD_DATE > '2021-10-05';

-- 8) Display customer name and gender whose names start or end with character 'A'.

select CUS_NAME, CUS_GENDER from customer where CUS_NAME like 'A%' or CUS_NAME like '%A';

-- 9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.

DELIMITER &&
CREATE PROCEDURE display_supplier_ratings()
BEGIN

select s.SUPP_ID, s.SUPP_NAME, avg(rat_ratstars),
case when avg(rat_ratstars) = 5 then 'EXCELLENT SERVICE'
	when avg(rat_ratstars) > 4 then 'GOOD SERVICE'
	when avg(rat_ratstars) > 2 then 'AVERAGE SERVICE'
else 'POOR SERVICE'
end as type_of_service
from supplier s, `order` o, supplier_pricing sp, rating r
where s.SUPP_ID = sp.SUPP_ID
and sp.PRICING_ID = o.PRICING_ID
and o.ORD_ID = r.ORD_ID
group by s.SUPP_ID order by s.SUPP_ID;
END &&
DELIMITER ;

call display_supplier_ratings();