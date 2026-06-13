# SQL Advanced Analytics – Superstore Customer Sales Insights

## Project Overview

This project was completed as part of the Celebal Technologies Data Engineering Internship Program. The aim of the project is to analyze the Superstore sales dataset using advanced SQL concepts such as Subqueries, CTEs, JOINs, and Window Functions.

The dataset was first normalized into separate tables and then used to answer various business questions related to customer sales and order performance.

---

## Objective

The objective of this project is to apply advanced SQL concepts to perform customer sales analysis and generate useful business insights from the Superstore dataset.

---

## Dataset Information

* Dataset: Superstore Sales Dataset
* Format: CSV
* Total Records: 9,994
* Important Columns:

  * Order ID
  * Customer ID
  * Customer Name
  * Product ID
  * Sales
  * Profit
  * Quantity
  * Region
  * Category

---

## Tables Created

The original dataset was divided into the following tables:

### Customers

Stores customer information such as customer name, segment, city, state, and region.

### Products

Stores product details including product name, category, and sub-category.

### Orders

Stores order transaction details such as sales, quantity, discount, and profit.

---

## SQL Concepts Used

* SELECT DISTINCT
* Subqueries
* Correlated Subqueries
* Common Table Expressions (CTEs)
* JOIN Operations
* Window Functions

  * ROW_NUMBER()
  * RANK()
  * DENSE_RANK()

---

## Analysis Performed

The following analyses were carried out:

1. Orders with sales greater than average sales
2. Highest sales order for each customer
3. Total sales per customer
4. Customers with above-average sales
5. Customer ranking using RANK() and DENSE_RANK()
6. Order ranking using ROW_NUMBER()
7. Top 3 customers based on sales
8. Customer sales ranking using JOIN + CTE + Window Functions
9. Top 5 customers
10. Bottom 5 customers
11. Customers with only one order
12. Highest order value per customer

---

## Key Findings

* A small group of customers generated a large portion of total sales.
* Some customers placed only one order.
* Several customers had sales significantly higher than the average customer sales.
* Window functions helped identify top-performing customers and highest-value orders.
* Data normalization reduced redundancy and improved data organization.

---

## Tools Used

* Databricks SQL
* GitHub
* Microsoft Word

---

## Repository Structure

```text
WEEK3
│
├── setup_data.sql
├── analytics_queries.sql
├── customer_sales_insights.sql
├── superstore.csv
```

---

## Conclusion

This project helped in understanding how advanced SQL concepts can be used to analyze real-world sales data. By using Subqueries, CTEs, JOINs, and Window Functions, meaningful insights were generated from the Superstore dataset. The project also provided hands-on experience with Databricks and SQL-based data analysis.

##
