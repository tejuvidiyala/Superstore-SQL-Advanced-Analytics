SHOW TABLES;

SELECT COUNT(*)
FROM superstore;

SELECT *
FROM superstore
LIMIT 10;

-- Creating normalized tables from the Superstore dataset
-- Creating customers table with unique customer records
CREATE OR REPLACE TABLE customers AS
SELECT DISTINCT
    `Customer ID` AS Customer_ID,
    `Customer Name` AS Customer_Name,
    Segment,
    City,
    State,
    Region
FROM superstore;
-- Checking the data
SELECT *
FROM customers
LIMIT 10;




-- Creating products table to store product details
CREATE TABLE products (
    Product_ID STRING,
    Product_Name STRING,
    Category STRING,
    Sub_Category STRING
);
-- Inserting unique product records from the superstore table
INSERT INTO products
SELECT DISTINCT
    `Product ID`,
    `Product Name`,
    Category,
    `Sub-Category`
-- Checking whether data is loaded properly
FROM superstore;
SELECT *
FROM products
LIMIT 10;


-- Creating orders table

CREATE OR REPLACE TABLE orders (
    Order_ID STRING,
    Order_Date STRING,
    Ship_Date STRING,
    Ship_Mode STRING,
    Customer_ID STRING,
    Product_ID STRING,
    Sales DECIMAL(10,4),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,4)
);
-- Inserting unique order records

INSERT INTO orders
SELECT DISTINCT
    `Order ID`,
    `Order Date`,
    `Ship Date`,
    `Ship Mode`,
    `Customer ID`,
    `Product ID`,
    Sales,
    Quantity,
    Discount,
    Profit
FROM superstore;

SELECT *
FROM orders
LIMIT 10;

-- Table sizes after normalization
-- Original table contains 9,994 records
-- Customers table contains 793 unique customers
-- Products table contains 1,862 unique products
-- Orders table contains 9,993 unique order records
