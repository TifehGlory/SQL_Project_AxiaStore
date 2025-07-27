
# AxiaStores SQL Database Project
## Table of Content
- [Project Overview](#project-overview)
- [Objectives](#objectives)
- [Tools and Methodologies](#tools-and-methodologies)
- [Key Analytical Questions](#key-analytical-questions)
- [Samples of SQL Queries and Results](#samples-of-sql-queries-and-results)
- [Answers to Analytical Questions and Results](#answers-to-analytical-questions-and-results)
- [References](#references)

## Project Overview
This project demonstrates a complete SQL based solution for an Electronics & Accessories retail business, *AxiaStores*. It involves designing and implementing a relational database with three core tables, Customer, Product, and Orders. While performing various analytical queries to extract insights.

## Objectives
The primary goal of this project is to
- Create a sample relational database
- Creation of multiple tables within the database with appropriate data types and constraints:
- Insertion of sample records into all tables
- Query functions like:
  - Retriever of customer details
  - Sorting alphabetically
  - The use of Join funtion for multiple tables
  - Use of aggregate functions like average and sum
 
## Tools and Methodologies 
*Tool Used:* *SQL SERVER MANAGEMENT STUDIO 21* [Download Here](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
1. Open SSMS
2. Load and execute script like:
   - Create a new database called *AxiaStores*
   - Create *CustomerTB, **ProductTB, and **OrdersTB* tables using proper data types and data constraints
   - Populate *CustomerTB, **ProductTB, and **OrdersTB* tables with the necessary data
   - Anwser analytical questions and run queries, save and document results for reporting and insights
## Samples of SQL Queries and Results
Here are examples of key queries used in the project and their results:

## Key Analytical Questions
The queries in this project aim to answer the following key questions based on the AxiaStores dataset:
1. Return the FirstName and Email of every customer who has ever purchased the product “Wireless Mouse”
2. List all customers’ full names in ascending alphabetical order (LastName, then FirstName)
3. 3. Show every order together with the customer’s full name, the product name, quantity, unit price, total price (quantity × unit price), and order date
4. Show average sales per product category and sort in descending order
5. Which city generated the highest revenue for AxiaStores

1. *CREATING DATABASE*
<pre>
CREATE DATABASE [AxiaStores]; --SQL Server
</pre>

2. *CREATING CustomerTB*
<pre>
CREATE TABLE CustomerTB
(CustomerID INT PRIMARY KEY,
FirstName VARCHAR (255),
LastName VARCHAR (255),
Email VARCHAR (255),
Phone VARCHAR (50),
City VARCHAR (100));
INSERT INTO CustomerTB (CustomerID, FirstName, LastName, Email, Phone, City)
VALUES
(1, 'Musa', 'Ahmed', 'musa.ahmed@hotmail.com', '0803‑123‑0001', 'Lagos'),
('2', 'Ray', 'Samson', 'ray.samson@yahoo.com', '0803‑123‑0002', 'Ibadan'),
('3', 'Chinedu', 'Okafor', 'chinedu.ok@yahoo.com', '0803‑123‑0003', 'Enugu'),
('4', 'Dare', 'Adewale', 'dare.ad@hotmail.com', '0803‑123‑0004', 'Abuja'),
('5', 'Efe', 'Ojo', 'efe.oj@gmail.com', '0803‑123‑0005', 'Port Harcourt'),
('6', 'Aisha', 'Bello', 'aisha.bello@hotmail.com', '0803‑123‑0006', 'Kano'),
('7', 'Tunde', 'Salami', 'tunde.salami@yahoo.c

('8', 'Nneka', 'Umeh', 'nneka.umeh@gmail.com', '0803‑123‑0008', 'Owerri'),
('9', 'Kelvin', 'Peters', 'kelvin.peters@hotmail.com', '0803‑123‑0009', 'Asaba'),
('10', 'Blessing', 'Mark', 'Blessing.mark@gmail.com', '0803‑123‑0010', 'Uyo');
</pre>

<img width="544" height="584" alt="image" src="https://github.com/user-attachments/assets/c467b6c3-f11c-4b91-b7bd-3dd48a4039d5" />


## Answers to Analytical Questions and Results

1. *Return the FirstName and Email of every customer who has ever purchased the product “Wireless Mouse”*
<pre>
--Return the FirstName and Email of every customer who has ever purchased the product “Wireless Mouse”
select c.firstname, c.email from customertb c
join OrderTB o on c.CustomerID = o.CustomerID
join ProductTB p on o.ProductID = p.ProductID
where p.ProductID=1
</pre>

<img width="233" height="73" alt="image" src="https://github.com/user-attachments/assets/0f47be63-0f18-4990-b652-6db5115df919" />


2. *List all customers’ full names in ascending alphabetical order (LastName, then FirstName)*
<pre>
--List all customers’ full names in ascending alphabetical order (LastName, then FirstName)
SELECT FirstName, LastName
FROM CustomerTB
ORDER BY LastName ASC, FirstName ASC;
</pre>

<img width="164" height="238" alt="image" src="https://github.com/user-attachments/assets/29d2bdba-34fb-469d-8fb7-4399c7125b91" />


3. *Show every order together with the customer’s full name, the product name, quantity, unit price, total price (quantity × unit price), and order date.*
<pre>
--Show every order together with the customer’s full name, the product name, quantity, unit price, total price (quantity × unit price), and order date.
select 
c.FirstName, 
c.LastName,
p.productname, 
o.quantity, 
p.unitprice,  
sum (p.unitprice * o.quantity) as 'total price'
from CustomerTB c
join ordertb o on c.customerid = c.customerid
join producttb p on o.productid = p.productid
GROUP BY 
    c.FirstName, c.LastName, p.ProductName, o.Quantity,p.UnitPrice;
</pre>

<img width="469" height="258" alt="image" src="https://github.com/user-attachments/assets/0e6e17a6-1b0e-4e05-ba7d-c68f6bdb8202" />


4. *Show average sales per product category and sort in descending order*
<pre>
--Show average sales per product category and sort in descending order
SELECT 
    p.Category,
    AVG(o.Quantity) AS AverageSales
FROM ProductTB p
JOIN OrdersTB o ON p.ProductID = o.ProductID
GROUP BY p.Category
ORDER BY AverageSales DESC;
</pre>

<img width="189" height="166" alt="image" src="https://github.com/user-attachments/assets/39f33b0e-397f-45c2-872d-466f5e568214" />


5. *Which city generated the highest revenue for AxiaStores?*
<pre>
--Which city generated the highest revenue for AxiaStores?
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
</pre>
<img width="353" height="237" alt="image" src="https://github.com/user-attachments/assets/3b16c525-03d0-4665-8e93-d9f21ef4014e" />


### References
- [Axia Africa SQL Exam](https://drive.google.com/file/d/13chnDFUr7NqbyPSRqy65d9pgeVCM86Ix/view)
- [Axia Africa](https://student.axia.africa)
