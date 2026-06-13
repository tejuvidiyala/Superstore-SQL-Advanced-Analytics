-- SQL QUERIES & RESULTS


-- Find all orders where sales are greater than the average sales. (Subquery)  
SELECT Order_ID, Customer_ID, Sales
FROM orders
WHERE Sales > (SELECT AVG(Sales) FROM orders)
ORDER BY Sales DESC;


-- Find the highest sales order for each customer. (Subquery)  
SELECT
    Customer_ID,
    Order_ID,
    Sales
FROM orders o
WHERE Sales = (
    SELECT MAX(Sales)
    FROM orders
    WHERE Customer_ID = o.Customer_ID
)
ORDER BY Sales DESC;


-- Calculate total sales for each custom (CTE)  
WITH customer_sales AS (
    SELECT o.Customer_ID, c.Customer_Name,
           ROUND(SUM(o.Sales), 2) AS Total_Sales
    FROM orders o
    JOIN customers c ON o.Customer_ID = c.Customer_ID
    GROUP BY o.Customer_ID, c.Customer_Name
)
SELECT * FROM customer_sales
ORDER BY Total_Sales DESC;



-- Find customers whose total sales are above average. (CTE + Subquery)  
WITH customer_sales AS (
    SELECT
        o.Customer_ID,
        c.Customer_Name,
        SUM(o.Sales) AS Total_Sales
    FROM orders o
    JOIN customers c
        ON o.Customer_ID = c.Customer_ID
    GROUP BY o.Customer_ID, c.Customer_Name
)

SELECT *
FROM customer_sales
WHERE Total_Sales > (
    SELECT AVG(Total_Sales)
    FROM customer_sales
)
ORDER BY Total_Sales DESC;



-- Rank customers based on total sales using RANK and DENSE_RANK

WITH customer_sales AS (
    SELECT o.Customer_ID, c.Customer_Name,
           ROUND(SUM(o.Sales), 2) AS Total_Sales
    FROM orders o
    JOIN customers c ON o.Customer_ID = c.Customer_ID
    GROUP BY o.Customer_ID, c.Customer_Name
)

SELECT Customer_Name,
       Total_Sales,
       RANK() OVER (ORDER BY Total_Sales DESC) AS Sales_Rank,
       DENSE_RANK() OVER (ORDER BY Total_Sales DESC) AS Dense_Rank
FROM customer_sales
ORDER BY Total_Sales DESC;


-- Assign row numbers to each order within a customer. (Window Function + PARTITION BY)  
SELECT o.Customer_ID,
       c.Customer_Name,
       o.Order_ID,
       ROUND(o.Sales, 2) AS Sales,
       ROW_NUMBER() OVER (
           PARTITION BY o.Customer_ID
           ORDER BY o.Sales DESC
       ) AS Order_Rank
FROM orders o
JOIN customers c
    ON o.Customer_ID = c.Customer_ID
ORDER BY o.Customer_ID, Order_Rank
LIMIT 10;



-- Display top 3 customers based on total sales. (Window Function)  
WITH customer_sales AS (
    SELECT
        o.Customer_ID,
        c.Customer_Name,
        ROUND(SUM(o.Sales), 2) AS Total_Sales
    FROM orders o
    JOIN customers c
        ON o.Customer_ID = c.Customer_ID
    GROUP BY o.Customer_ID, c.Customer_Name
)

SELECT
    Customer_Name,
    Total_Sales,
    DENSE_RANK() OVER (ORDER BY Total_Sales DESC) AS Rank
FROM customer_sales
ORDER BY Total_Sales DESC
LIMIT 3;



-- Final query using JOIN, CTE and Window Functions

WITH customer_sales AS (
    SELECT
        o.Customer_ID,
        c.Customer_Name,
        c.Segment,
        c.Region,
        ROUND(SUM(o.Sales), 2) AS Total_Sales
    FROM orders o
    JOIN customers c
        ON o.Customer_ID = c.Customer_ID
    GROUP BY
        o.Customer_ID,
        c.Customer_Name,
        c.Segment,
        c.Region
)
SELECT
    Customer_Name,
    Segment,
    Region,
    Total_Sales,
    RANK() OVER (ORDER BY Total_Sales DESC) AS Rank,
    DENSE_RANK() OVER (ORDER BY Total_Sales DESC) AS Dense_Rank
FROM customer_sales
ORDER BY Total_Sales DESC
LIMIT 15;




