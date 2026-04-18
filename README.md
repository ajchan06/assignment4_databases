# SQL Data Analysis – Music Database (Chinook)

## Overview
This project performs advanced SQL data analysis on a relational music database (Chinook), exploring customer behavior, artist performance, playlist characteristics, and sales trends.

The work demonstrates strong understanding of relational databases through complex queries, including joins, aggregations, filtering, subqueries, and window functions.

---

## Key Features
- Multi-table JOIN operations across a normalized schema
- Aggregation using GROUP BY and HAVING
- Data filtering and pattern matching
- Subqueries and derived tables
- Window functions (RANK)
- Real-world analytical queries on customer and sales data

---

## Database Schema

The database includes core entities such as:
- Customers
- Invoices and Invoice_Items
- Tracks
- Albums
- Artists
- Genres
- Playlists

These tables are connected through foreign key relationships, enabling complex relational queries across the system.

---

## Query Breakdown

### 1. Customer Purchase Activity
Retrieve customers who made purchases:

- Uses JOIN between customers and invoices
- Filters valid records
- Returns distinct users

---

### 2. Albums and Artists
Maps albums to their creators:

- JOIN between albums and artists
- Demonstrates 1-to-many relationship usage

---

### 3. Customers per State
Counts unique customers grouped by location:

- Uses GROUP BY
- Aggregates distinct customer counts

---

### 4. High-Density Customer States
Filters states with more than 10 customers:

- Uses HAVING clause
- Demonstrates post-aggregation filtering

---

### 5. Text-Based Filtering
Finds artists with albums containing “symphony”:

- Uses case-insensitive pattern matching
- Demonstrates string filtering with LIKE

---

### 6. Multi-Join Filtering (Advanced)
Finds artists who:
- Produced MPEG tracks
- Appeared in specific playlists ("Brazilian Music", "Grunge")

Involves joins across:
- artists → albums → tracks → media_types → playlists

---

### 7. Aggregated Artist Analysis
Counts artists with at least 10 MPEG tracks:

- Uses subquery with GROUP BY
- Filters using HAVING
- Wraps result for final count

---

### 8. Playlist Duration Analysis
Calculates total playlist duration:

- Converts milliseconds to hours
- Uses aggregation and rounding
- Filters playlists longer than 2 hours

---

### 9. Top-Selling Tracks per Genre (Advanced / Creative)

This query identifies the **top 3 best-selling tracks per genre**.

Key techniques:
- Multi-table joins (genres → tracks → invoice_items)
- Aggregation of total units sold
- Window function: `RANK() OVER (PARTITION BY ...)`

Outputs:
- Genre name
- Track name
- Artist name
- Total units sold
- Rank within genre

This provides insight into:
- Revenue-driving tracks
- Genre-level performance trends

---

## Key Concepts Demonstrated
- Relational data modeling
- Foreign key relationships
- Multi-table joins
- Aggregation and grouping
- Subqueries and derived tables
- Window functions (ranking)
- Data analysis using SQL

---

## What I Learned
- How to analyze real-world datasets using SQL
- Writing efficient multi-join queries
- Using aggregation to derive business insights
- Applying window functions for ranking problems
- Structuring complex queries for readability and scalability

---

## Future Improvements
- Add indexes for performance optimization
- Build a backend API to serve queries
- Create a dashboard for visualization (React / Tableau)
- Extend analysis with machine learning models

---

## Tech Stack
- SQLite
- SQL (Joins, Aggregations, Window Functions)

---

## Author
Anthony Chan  
Computer Science, Northeastern University
