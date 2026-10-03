# Chinook SQL Business Analysis

## 📌 Project Overview

This project analyzes the **Chinook digital media store database** using SQL Server to uncover insights into sales performance, customer behavior, product performance, artist and genre contribution, and revenue trends.

The analysis applies SQL techniques to transform transactional data into actionable business insights and recommendations.

---

## 🎯 Business Objectives

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

## 📊 Dataset

The **Chinook Database** represents a digital media store containing data related to customers, employees, artists, albums, tracks, genres, invoices, and invoice line items.

The database is a widely used sample database for SQL analysis and contains transactional sales data across a four-year period.

**Source:** Chinook Database

---

## 🛠️ Tools & Technologies

* **Microsoft SQL Server**
* **SQL Server Management Studio (SSMS)**
* SQL
* GitHub

---

## ⚙️ SQL Techniques Applied

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
## 🗄️ Database Architecture & Schema Design
<img width="1020" height="585" alt="Diagram" src="https://github.com/user-attachments/assets/20e7ec33-d587-4109-8fc5-0a0fab62cdca" />

* **Architecture Type:** Normalized Relational Database (3NF / OLTP Schema).
* **Data Modeling:** Fully normalized to eliminate redundancy, featuring parent-child transactional granularity (`Invoice` header to `InvoiceLine` details).
* **Relational Depth:** Includes normalized lookup hierarchies (e.g., `InvoiceLine` ➔ `Track` ➔ `Album` ➔ `Artist`) requiring multi-table `JOIN` operations to reconstruct complete business entities.
* **Integrity:** Enforces strict Primary Key (PK) and Foreign Key (FK) referential constraints across 11 relational tables.


## 🔍 Analysis Performed

### 1. Product & Track Analysis
<img width="438" height="606" alt="1 - 2" src="https://github.com/user-attachments/assets/baceff42-6347-42f9-840f-2cf0ee429528" />

Analyzed track-level sales performance to identify:

* Best-selling tracks
* Total purchases by track
* Product revenue contribution
* High-performing products

### 2. Artist & Genre Analysis
<img width="920" height="604" alt="4" src="https://github.com/user-attachments/assets/7e39dd60-4613-4058-809b-a977bed1766b" />

Evaluated artist and genre performance to determine:

* Artists with the highest number of tracks
* Revenue contribution by genre
* Artists associated with specific genres
* Top-performing music categories

### 3. Customer Analysis
<img width="486" height="603" alt="3" src="https://github.com/user-attachments/assets/98af5faf-29a1-427e-8fb8-24bb17695ef1" />

Analyzed customer purchasing behavior by:

* Total spending
* Number of invoices
* Customer purchasing activity
* Customers spending above the average

### 4. Geographic Analysis
<img width="573" height="604" alt="5" src="https://github.com/user-attachments/assets/7f148f1c-99f6-4676-ab78-16235ef5e154" />

Evaluated customer and sales distribution across countries to identify major revenue-contributing markets.

### 5. Revenue Trend Analysis
<img width="730" height="604" alt="6" src="https://github.com/user-attachments/assets/f369805f-53e9-43e4-b2c7-60d97f90f1d3" />

Analyzed revenue over time to identify monthly performance patterns and changes in sales activity.

### 6. Ranking Analysis
<img width="500" height="602" alt="7" src="https://github.com/user-attachments/assets/3567a289-aaed-4637-9507-d273c4e0bb82" />

Applied the `RANK()` window function to rank products based on revenue and identify top-performing tracks.

---

## 🗝 Key Insights

* A relatively small number of tracks contribute a significant share of total purchases.
* Customer spending varies considerably, with a subset of customers generating higher transaction value.
* Music genres and artists contribute differently to overall sales performance.
* Geographic distribution provides opportunities to identify high-value markets.
* Monthly revenue analysis reveals changes in purchasing activity over time.
* Ranking products by revenue helps identify the strongest contributors to overall performance.

<img width="2141" height="1686" alt="Report" src="https://github.com/user-attachments/assets/6f7b6e27-342d-4a18-b68f-42810046ef1b" />

## 📈 Business Recommendations

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

## Author

**Ahmed Bayoumy**

Data Analyst | SQL • Power BI • Python • Excel
