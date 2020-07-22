-- find all products-- Done --

 SELECT * FROM products;
 
-- find all products that cost $1400  -- Done --

 SELECT * FROM products
 WHERE price = '1400';
 
-- find all products that cost 11.99 or 13.99 --Done--

SELECT * FROM products 
WHERE price = '11.99' OR price = '13.99';
 
-- find all products that do NOT cost 11.99 - using NOT  --Done

SELECT * FROM products
WHERE NOT price = '11.99';
 
-- find  all products and sort them by price from greatest to least --Done--

SELECT * FROM products
ORDER BY price DESC;
 
-- find all employees who don't have a middle initial--Done--

SELECT * FROM employees
WHERE MiddleInitial IS NULL;
 
-- find distinct product prices
 
-- find all employees whose first name starts with the letter ‘j’ --Done--
 
 SELECT * FROM employees
 WHERE FirstName LIKE 'j%';
 
-- find all Macbooks --  --Done--

SELECT * FROM products
WHERE Name = 'Macbook';
 
-- find all products that are on sale --Done--

SELECT * FROM products
WHERE OnSale = '1';
 
-- find the average price of all products -- --Done--

SELECT AVG(price) 
FROM products;
 
-- find all Geek Squad employees who don't have a middle initial -- --Done--

SELECT * FROM employees
WHERE title = 'Geek Squad'
AND MiddleInitial IS NULL;
 
-- find all products from the products table whose stock level is in the range of 500 to 1200. Order by Price from least to greatest. **Try this with the between keyword** --Done--

SELECT * FROM products
WHERE StockLevel BETWEEN 500 AND 1200
ORDER BY price; 
 
--------------------------------------------------------------------------------------------------
-- #1 JOINS SECTION: 
-- #1 joins: select all the computers from the products table:
-- #1 using the products table and the categories table, return the product name and the category name -- Done--

SELECT products.name AS 'Product Name', categories.Name AS 'Category Name'    -- This changes the catagories names(NOTES)
FROM products
INNER JOIN categories         -- this joins the catagories(NOTES)
ON products.CategoryID = categories.CategoryID AND categories.Name = 'computers';    -- this displays the values with the name as Computers (NOTES)


-- #2 joins: find all product names, product prices, and products ratings that have a rating of 5 --Done --

SELECT p.name, p.price, r.rating     -- this selects the different columns. (NOTES)
FROM products AS p, reviews AS r     -- this changes products to p, and ratings to r. (NOTES)
WHERE p.ProductID = r.ProductID AND r.Rating = 5;     -- this makes it so the ratin gneeds to be 5 to display. and selects the IDs(NOTES)
 
-- #3 joins: find the employee with the most total quantity sold.  use the sum() function and group by --Done--
-- (NOTE) These two do the same thing

-- (NOTE) This is useing the WHERE
SELECT SUM(s.Quantity) AS 'Quantity', e.FirstName, e.LastName      -- this sellects the different columns needed(NOTE)
FROM sales AS s, employees AS e      -- this changes the table names(NOTE)
WHERE e.EmployeeID = s.EmployeeID      -- this connects the two tables(NOTE)
GROUP BY s.EmployeeID
ORDER BY SUM(s.Quantity) DESC LIMIT 2;         --

-- (NOTE) This is useing the INNER JOIN
SELECT SUM(s.Quantity) AS 'Quantity', e.FirstName, e.LastName
FROM sales AS s 
INNER JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
GROUP BY s.EmployeeID
ORDER BY SUM(s.Quantity) DESC LIMIT 2;

-----------------------------------------------------------------
-- #4 joins: find the name of the department, and the name of the category for Appliances and Games --Done--

SELECT d.name AS 'Department Name', c.name 'Category Name'     -- this names the columns(NOTE)
FROM departments AS d
INNER JOIN categories AS c     -- these make the shortcut(NAME)
ON d.DepartmentID = c.DepartmentID   -- this connects the two Tables (NAME
AND c.name = 'Appliances' OR c.name = 'Games';    -- it needs to be an OR becouse name cannot be appliances and games. This prints out the ones only with thos names(NOTE)

-- OR--

SELECT d.name AS department, c.Name AS 'Categories'
FROM departments AS d
INNER JOIN categories AS c
ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Games' OR c.name = 'Appliances';

-- #5 joins: find the product name, total # sold, and total price sold, for Eagles: Hotel California --You may need to use SUM() --Done--

SELECT p.Name AS 'Product Name', SUM(s.Quantity) 'Total Sold', (s.PricePerUnit * Sum(s.Quantity)) 'Total Price' -- this sums the units sold, and then multiplies the price by the quantity(NOTE)
FROM products AS p
INNER JOIN sales AS s     -- These shorten the names(NOTE)
ON p.ProductID = s.ProductID     -- Connects the Tables(NOTE)
AND p.name = 'Eagles: Hotel California';     --  This shows only those with this name(NOTE)

-- #6 joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) --Done--

SELECT p.name AS 'Product Name', r.Reviewer 'User Name', r.rating 'Rating', r.comment 'Comment' -- Selects what we show(NOTE) 
FROM products AS p
INNER JOIN  reviews AS r -- Shortens the names(NAME)
ON p.ProductID = r.ProductID -- Connects the two tables(NOTE)
AND p.name = 'Visio TV' -- Selects only the visio TV(NOTE)
ORDER BY r.rating LIMIT 1; -- dont need to do ASC for ascedning. It is default.(NOTE)



-------------------------------------------- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, s.Quantity, s.Date
FROM employees AS e
INNER JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p
ON p.ProductID = s.ProductID
ORDER BY s.Quantity DESC;

-- ORDER BY e.EmployeeID, e.FirstName, e.LastName, p.Name, s.Quantity, s.Date;

-- GROUP BY e.EmployeeID, e.FirstName, e.LastName, p.Name, s.Quantity, s.Date;


-- PRACTICE --

SELECT * FROM categories AS c
INNER JOIN departments AS d
ON c.DepartmentID = d.DepartmentID
ORDER BY c.CategoryID ASC;

-- Create a  department

INSERT INTO departments (name)
VALUES ("Clearance");

-- Show the new addition

SELECT * FROM departments;

-- Create employees

INSERT INTO employees (FirstName, MiddleInitial, LastName, EmailAddress, PhoneNumber, Title, DateOfBirth)
VALUE ("Bart", "D", "Tholomue",  "bartthetart@gmail.com", "2225556677", "Geek Squad", "1996-02-15"); 

-- show the addition

SELECT * FROM employees
WHERE firstname LIKE 'Bar%';





