-- PART 3 — CUSTOMER SALES INSIGHTS

-- Who are the top 5 customers?  
WITH cs AS (
    SELECT c.Customer_Name, ROUND(SUM(o.Sales),2) AS Total_Sales
    FROM orders o JOIN customers c ON o.Customer_ID=c.Customer_ID
    GROUP BY c.Customer_Name
)
SELECT * FROM cs ORDER BY Total_Sales DESC LIMIT 5;



-- Who are the bottom 5 customers?  
WITH customer_sales AS (
    SELECT
        c.Customer_Name,
        SUM(o.Sales) AS Total_Sales
    FROM orders o
    JOIN customers c
        ON o.Customer_ID = c.Customer_ID
    GROUP BY c.Customer_Name
)SELECT *FROM customer_sales
ORDER BY Total_Sales ASC
LIMIT 5;



-- Which customers made only one order?  
SELECT
    c.Customer_Name,
    COUNT(DISTINCT o.Order_ID) AS Order_Count,
    SUM(o.Sales) AS Total_Sales
FROM orders o
JOIN customers c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
HAVING COUNT(DISTINCT o.Order_ID) = 1
ORDER BY Total_Sales DESC



-- Customers having sales greater than average sales
WITH sales_data AS (
    SELECT
        c.Customer_Name,
        SUM(o.Sales) AS Total_Sales
    FROM orders o
    JOIN customers c
        ON o.Customer_ID = c.Customer_ID
    GROUP BY c.Customer_Name
)

SELECT *
FROM sales_data
WHERE Total_Sales > (
    SELECT AVG(Total_Sales)
    FROM sales_data
)
ORDER BY Total_Sales DESC
LIMIT 5;


-- Find the highest order value for each customer
SELECT
    c.Customer_Name,
    o.Order_ID,
    o.Sales AS Highest_Order_Value
FROM orders o
JOIN customers c
    ON o.Customer_ID = c.Customer_ID
WHERE o.Sales = (
    SELECT MAX(o2.Sales)
    FROM orders o2
    WHERE o2.Customer_ID = o.Customer_ID
)
ORDER BY o.Sales DESC
LIMIT 5;