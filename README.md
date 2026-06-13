# SQL Advanced Analytics – Superstore Customer Sales Insights

## Project Overview

This project was completed as part of the Celebal Technologies Data Engineering Internship Program. The objective was to analyze the Superstore Sales dataset using advanced SQL concepts and generate meaningful business insights from customer and sales data.

The dataset was normalized into separate tables and analyzed using Subqueries, Common Table Expressions (CTEs), JOINs, and Window Functions.

## Objective

The main objective of this project is to apply advanced SQL techniques to perform customer sales analysis and answer business-related questions using real-world sales data.

## Dataset Information

* Dataset: Superstore Sales Dataset
* Format: CSV
* Total Records: 9,994
* Key Columns:

  * Order ID
  * Customer ID
  * Customer Name
  * Product ID
  * Sales
  * Profit
  * Quantity
  * Region
  * Category

## Tables Created

The original dataset was normalized into the following tables:

### Customers

Contains customer details such as customer name, segment, city, state, and region.

### Products

Contains product information including product name, category, and sub-category.

### Orders

Contains order transaction details such as sales, quantity, discount, and profit.

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

## Analysis Performed

The following analyses were carried out:

1. Orders with sales greater than average sales
2. Highest sales order for each customer
3. Total sales per customer
4. Customers with above-average sales
5. Customer ranking using RANK() and DENSE_RANK()
6. Order ranking using ROW_NUMBER()
7. Top 3 customers based on total sales
8. Customer sales ranking using JOIN, CTE, and Window Functions
9. Top 5 customers
10. Bottom 5 customers
11. Customers with only one order
12. Highest order value per customer

## Key Findings

* A small group of customers contributed significantly to overall sales.
* Several customers generated sales well above the average customer sales value.
* Only a few customers placed a single order.
* Window functions helped identify customer rankings and highest-value orders.
* Normalization reduced data redundancy and improved data organization.

## Tools Used

* Databricks SQL
* GitHub
* Microsoft Word

## Repository Structure

```text
WEEK3
│
├── setup_data.sql
├── analytics_queries.sql
├── customer_sales_insights.sql
├── superstore.csv
```

## Conclusion

This project provided practical experience in applying advanced SQL concepts to a real-world dataset. Through normalization, customer analysis, ranking techniques, and sales insights, the project demonstrated how SQL can be used to support data-driven decision-making and business analysis.
