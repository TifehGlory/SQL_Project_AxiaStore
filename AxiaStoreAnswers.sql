--1. *CREATING DATABASE*
CREATE DATABASE [AxiaStores]; --SQL Server


--2. CREATING CustomerTB

CREATE TABLE CustomerTB
(CustomerID INT PRIMARY KEY,
FirstName VARCHAR (255),
LastName VARCHAR (255),
Email VARCHAR (255),
Phone VARCHAR (50),
City VARCHAR (100));
INSERT INTO CustomerTB (CustomerID, FirstName, LastName, Email, Phone, City)
VALUES
(1, 'Musa', 'Ahmed', 'musa.ahmed@hotmail.com', '0803?123?0001', 'Lagos'),
('2', 'Ray', 'Samson', 'ray.samson@yahoo.com', '0803?123?0002', 'Ibadan'),
('3', 'Chinedu', 'Okafor', 'chinedu.ok@yahoo.com', '0803?123?0003', 'Enugu'),
('4', 'Dare', 'Adewale', 'dare.ad@hotmail.com', '0803?123?0004', 'Abuja'),
('5', 'Efe', 'Ojo', 'efe.oj@gmail.com', '0803?123?0005', 'Port Harcourt'),
('6', 'Aisha', 'Bello', 'aisha.bello@hotmail.com', '0803?123?0006', 'Kano'),
('7', 'Tunde', 'Salami', 'tunde.salami@yahoo.com', '0803?123?0007', 'Ilorin'),
('8', 'Nneka', 'Umeh', 'nneka.umeh@gmail.com', '0803?123?0008', 'Owerri'),
('9', 'Kelvin', 'Peters', 'kelvin.peters@hotmail.com', '0803?123?0009', 'Asaba'),
('10', 'Blessing', 'Mark', 'Blessing.mark@gmail.com', '0803?123?0010', 'Uyo');


--Answers to Analytical Questions and Results

--1. Return the FirstName and Email of every customer who has ever purchased the product “Wireless Mouse”*

--Return the FirstName and Email of every customer who has ever purchased the product “Wireless Mouse”
select c.firstname, c.email from customertb c
join OrdersTB o on c.CustomerID = o.CustomerID
join ProductTB p on o.ProductID = p.ProductID
where p.ProductID=1

--2. List all customers’ full names in ascending alphabetical order (LastName, then FirstName)

SELECT FirstName, LastName
FROM CustomerTB
ORDER BY LastName ASC, FirstName ASC;

--3. Show every order together with the customer’s full name, the product name, quantity, unit price, total price (quantity × unit price), and order date.

select 
c.FirstName, 
c.LastName,
p.productname, 
o.quantity, 
p.unitprice,  
sum (p.unitprice * o.quantity) as 'total price'
from CustomerTB c
join orderstb o on c.customerid = c.customerid
join producttb p on o.productid = p.productid
GROUP BY 
    c.FirstName, c.LastName, p.ProductName, o.Quantity,p.UnitPrice;

--4. Show average sales per product category and sort in descending order

SELECT 
    p.Category,
    AVG(o.Quantity) AS AverageSales
FROM ProductTB p
JOIN OrdersTB o ON p.ProductID = o.ProductID
GROUP BY p.Category
ORDER BY AverageSales DESC;

--5. Which city generated the highest revenue for AxiaStores?
SELECT 
    c.City,
    SUM(p.UnitPrice) AS TotalUnitPrice,
    SUM(o.Quantity) AS TotalQuantity,
    SUM(p.UnitPrice * o.Quantity) AS TotalRevenue
FROM 
    CustomerTB c
JOIN 
    OrdersTB o ON c.CustomerID = o.CustomerID
JOIN 
    ProductTB p ON o.ProductID = p.ProductID
GROUP BY 
    c.City
ORDER BY 
    TotalRevenue DESC;





