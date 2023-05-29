SELECT * FROM BusinessEntity;
SELECT * FROM Employee;
SELECT * FROM Product;
SELECT * FROM Customer;
SELECT * FROM "Order";
SELECT * FROM OrderDetails;

--HOMEWORK 1/6

--Find all Employees with FirstName = 'Antonio'
SELECT * 
FROM Employee
WHERE FirstName = 'Antonio'

--Find all Employees with DateOfBirth greater that '01.01.1979'
SELECT * 
FROM Employee
WHERE DateOfBirth > '01.01.1979'

--Find all Male Employees
SELECT * 
FROM Employee 
WHERE Gender = 'M'

--Find all Employees with lastName starting with 'T'
SELECT *
FROM Employee
WHERE lastName LIKE 'T%'

--Find all Employees hired in January/1988
SELECT * 
FROM Employee
WHERE hireDate BETWEEN '01.01.1988' AND '01.30.1988'

--Find all Employees with lastName starting with 'J' and hireDate in January/1988
SELECT * 
FROM Employee
WHERE lastName LIKE '%J'
AND hireDate BETWEEN '01.01.1988' AND '01.30.1988'

--HOMEWORK 2/6

--Find all Employees with FirstName = Antonio orderd by Last Name
SELECT * 
FROM Employee
WHERE firstName = 'Antonio'
ORDER BY lastName

--List all Employees ordered by FirstName
SELECT * 
FROM Employee
ORDER BY firstName

--Find all male Employees ordered by HireDate, starting from the last hired
SELECT * 
FROM Employee
ORDER BY hireDate DESC

--HOMEWORK 3/6

--List all Business Entity region and Customer region names in single result set WITH duplicates
SELECT region 
FROM BusinessEntity
UNION ALL
SELECT regionname
FROM Customer

--List all Business Entity region and Custmer region names in a single result WITHOUT duplicates
SELECT region
FROM BusinessEntity
UNION
SELECT regionname
FROM Customer

--List all common region names between Business Entity and Customers
SELECT region
FROM BusinessEntity
INTERSECT
SELECT regionname
FROM Customer

--HOMEWORK 4/6

--Provide create table 'Order' where it won't allow an orderdate before '01.01.2010'
CREATE TABLE "Order" (
id int primary key,
orderDate date check(orderDate >= '01.01.2010'),
status smallint null,
businessEntityId int null,
customerId int null,
employeeId int null,
totalprice int null,
comment varchar(500) null
);

INSERT INTO "Order"(id,orderDate,status, businessEntityId, customerId, employeeId, totalprice, comment)
VALUES(1221, '01.01.2009', 10, 1234,6533212,29387,18, 'Blue shoes')

INSERT INTO "Order"(id,orderDate,status, businessEntityId, customerId, employeeId, totalprice, comment)
VALUES(1221, '01.01.2011', 10, 1234,6533212,29387,18, 'Blue shoes')

SELECT * FROM "Order";

--Provide create table script for the Product table where the price will always be AT LEAST 20% higher than the cost

CREATE TABLE Product (
id int primary key,
code int null,
name varchar (50) null,
description varchar (50) null,
weight int null,
cost decimal(10,2),
price decimal(10,2) check (price >= cost * 1.2)
)
INSERT INTO product (id, cost, price )
VALUES (1234, 9.99, 9.99)

INSERT INTO product (id, cost, price )
VALUES (1234, 9.99, 18.99)

SELECT * from Product

--Provide create table script for the Product table where all description values will be UNIQUE
CREATE TABLE Product (
id int primary key,
code int null,
name varchar (50) null,
description text UNIQUE,
weight int null,
cost decimal(10,2),
price decimal(10,2) check (price >= cost * 1.2)
)

INSERT INTO product (id, description )
VALUES (12345, 'unique description')

SELECT * from Product

--HOMEWORK 5/6

--Create Foreign key constraints for the Order table with script

CREATE TABLE "Order" (
id int primary key,
name varchar (50),
orderDate date null,
businessEntityId int null,
customerId int null
)

CREATE TABLE orderDetails (
customerName varchar(50),
price int null,
id int references "Order" (id)
)

--HOMEWORK 6/6

--List all possible combinations of Customer names and Product names that can be ordered from a specific customer

SELECT c.name, p.name
from Customer c
cross join Product p
where c.name = 'customer name'

-- List  all Business Entities that has any order

SELECT * 
from BusinessEntity b
inner join "Order" o on o.businessEntityId = b.id

--List all Business Entities without orders

SELECT *
from BusinessEntity b
inner join "Order" o on o.businessEntityId = b.id
where o.id is null 

--List all Customers without orders (using Right Join and using Left join)

SELECT *
from Customer c
left join "Order" o on c.id = o.customerId

SELECT *
from Customer c
right join "Order" o on c.id = o.customerId

