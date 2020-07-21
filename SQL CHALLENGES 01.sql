-- find all products--
 
-- find all products that cost $1400
 
-- find all products that cost 11.99 or 13.99
 
-- find all products that do NOT cost 11.99 - using NOT
 
-- find  all products and sort them by price from greatest to least
 
-- find all employees who don't have a middle initial
 
-- find distinct product prices
 
-- find all employees whose first name starts with the letter ‘j’
 
-- find all Macbooks --
 
-- find all products that are on sale
 
-- find the average price of all products --
 
-- find all Geek Squad employees who don't have a middle initial --
 
-- find all products from the products table whose stock level is in the range of 500 to 1200. Order by Price from least to greatest. **Try this with the between keyword** 
 
--------------------------------------------------------------------------------------------------
-- #1 JOINS SECTION:
-- #1 joins: select all the computers from the products table:
-- #1 using the products table and the categories table, return the product name and the category name
SELECT * FROM products; -- this shows all that is in products (NOTES) 
SELECT * FROM categories; -- this shows all that is in categories (NOTES)

SELECT products.name, categories.name -- this selects the name from the different tables (NOTES)
FROM products, categories -- this selects the Tables (NOTES)
WHERE products.CategoryID = categories.CategoryID AND categories.Name = 'computers'; -- this takes the commpn factor ID, and makes the name be computers.(NOTES)

SELECT products.name AS 'Product Name', categories.Name AS 'Category Name' -- This changes the catagories names(NOTES)
FROM products
INNER JOIN categories -- this joins the catagories(NOTES)
ON products.CategoryID = categories.CategoryID AND categories.Name = 'computers'; -- this displays the values with the name as Computers (NOTES)


-- #2 joins: find all product names, product prices, and products ratings that have a rating of 5

SELECT p.name, p.price, r.rating -- this selects the different columns. (NOTES)
FROM products AS p, reviews AS r -- this changes products to p, and ratings to r. (NOTES)
WHERE p.ProductID = r.ProductID AND r.Rating = 5; -- this makes it so the ratin gneeds to be 5 to display. and selects the IDs(NOTES)
 
-- #3 joins: find the employee with the most total quantity sold.  use the sum() function and group by
SELECT 

-----------------------------------------------------------------
-- joins: find the name of the department, and the name of the category for Appliances and Games

-- joins: find the product name, total # sold, and total price sold,
-- for Eagles: Hotel California --You may need to use SUM()

-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)





-------------------------------------------- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
