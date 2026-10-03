# Chinook SQL Business Analysis

## Project Overview

This project analyzes the **Chinook digital media store database** using SQL Server to uncover insights into sales performance, customer behavior, product performance, artist and genre contribution, and revenue trends.

The analysis applies SQL techniques to transform transactional data into actionable business insights and recommendations.

---

## Business Objectives

The analysis focuses on answering key business questions related to:

* Sales and revenue performance
* Product and track performance
* Artist and genre contribution
* Customer purchasing behavior
* Geographic sales distribution
* Monthly revenue trends
* Customer spending patterns
* Product ranking and sales performance

---

## Dataset

The **Chinook Database** represents a digital media store containing data related to customers, employees, artists, albums, tracks, genres, invoices, and invoice line items.

The database is a widely used sample database for SQL analysis and contains transactional sales data across a four-year period.

**Source:** Chinook Database

---

## Tools & Technologies

* **Microsoft SQL Server**
* **SQL Server Management Studio (SSMS)**
* SQL
* GitHub

---

## SQL Techniques Applied

The project demonstrates:

* `SELECT` statements
* Filtering with `WHERE`
* `JOIN` operations
* `GROUP BY`
* Aggregate Functions
* `CASE` statements
* Subqueries
* Common Table Expressions (CTEs)
* Date Functions
* `ORDER BY`
* `TOP`
* Window Functions
* `RANK()`

---

## Analysis Performed

### 1. Product & Track Analysis

Analyzed track-level sales performance to identify:

* Best-selling tracks
* Total purchases by track
* Product revenue contribution
* High-performing products

### 2. Artist & Genre Analysis

Evaluated artist and genre performance to determine:

* Artists with the highest number of tracks
* Revenue contribution by genre
* Artists associated with specific genres
* Top-performing music categories

### 3. Customer Analysis

Analyzed customer purchasing behavior by:

* Total spending
* Number of invoices
* Customer purchasing activity
* Customers spending above the average

### 4. Geographic Analysis

Evaluated customer and sales distribution across countries to identify major revenue-contributing markets.

### 5. Revenue Trend Analysis

Analyzed revenue over time to identify monthly performance patterns and changes in sales activity.

### 6. Ranking Analysis

Applied the `RANK()` window function to rank products based on revenue and identify top-performing tracks.

---

## Key Insights

* A relatively small number of tracks contribute a significant share of total purchases.
* Customer spending varies considerably, with a subset of customers generating higher transaction value.
* Music genres and artists contribute differently to overall sales performance.
* Geographic distribution provides opportunities to identify high-value markets.
* Monthly revenue analysis reveals changes in purchasing activity over time.
* Ranking products by revenue helps identify the strongest contributors to overall performance.

---

## Business Recommendations

### Product Strategy

Prioritize high-performing tracks and genres when designing promotions and featured-content strategies.

### Customer Strategy

Identify high-value customers and use targeted retention or loyalty initiatives to encourage repeat purchases.

### Geographic Strategy

Focus marketing efforts on stronger markets while investigating opportunities for growth in lower-performing regions.

### Revenue Monitoring

Track monthly revenue trends to identify changes in demand and support better planning of promotional campaigns.

### Portfolio Optimization

Use product-level performance and ranking analysis to prioritize commercially successful content.

---

## Project Structure

```text
Chinook-SQL-Business-Analysis/
│
├── Chinook_SQL_Analysis.sql
└── README.md
```

---

## Learning Outcomes

Through this project, I strengthened my ability to:

* Analyze relational databases using SQL
* Connect multiple tables using JOINs
* Aggregate transactional data into business KPIs
* Apply CTEs and subqueries to analytical problems
* Use window functions for ranking analysis
* Translate SQL results into business insights and recommendations

---

## Internship

Completed as part of the **Elevvo Data Analytics Internship**.

**Track:** Data Analytics
**Project:** SQL / Chinook Database Analysis

---

## Author

**Ahmed Bayoumy**

Data Analyst | SQL • Power BI • Python • Excel
