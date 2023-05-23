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
