# DAY 08 - ADVANCED WINDOW ANALYTICS IN SQL

## Overview
Day 08 focused on Advanced Window Functions, Rolling Analytics, and Frame Clauses in SQL. These concepts are extremely important for Data Analyst, Business Intelligence, and Financial Analytics roles. The main objective was to learn how analytical calculations are performed row-by-row without collapsing original table data. Advanced rolling calculations and cumulative analytics are heavily used in modern dashboard systems like Power BI and Tableau.

---

# Topics Covered
- Running Totals
- Running Average
- Cumulative Sum
- Moving Average
- Rolling Sum
- Rolling Maximum
- Rolling Minimum
- Window Functions
- OVER()
- ORDER BY in Window Functions
- ROWS BETWEEN
- CURRENT ROW
- PRECEDING
- FOLLOWING
- UNBOUNDED PRECEDING
- Rolling Window Analysis
- Trend Analysis
- Future Forecasting
- KPI Reporting
- Dashboard Analytics

---

# Key Concepts Learned

## Running Total
Calculates cumulative values using:
- current row
- all previous rows

Used for:
- revenue tracking
- KPI dashboards
- cumulative reporting

---

## Running Average
Calculates average using:
- current row
- previous rows

Used for:
- trend analysis
- performance tracking
- forecasting

---

## Moving Average
Uses fixed-size rolling windows for calculations.

Example:

```sql
ROWS BETWEEN 2 PRECEDING
AND CURRENT ROW
````

Used for:

* stock market analysis
* sales forecasting
* trend smoothing

---

## Frame Clauses

Frame clauses control which rows participate inside calculations.

Main syntax:

```sql
ROWS BETWEEN start AND end
```

---

# Important Frame Clause Keywords

| Keyword             | Meaning           |
| ------------------- | ----------------- |
| CURRENT ROW         | active row        |
| PRECEDING           | previous rows     |
| FOLLOWING           | next rows         |
| UNBOUNDED PRECEDING | all previous rows |

---

# Important Window Analytics Concepts

## Rolling Calculations

Use fixed-size windows for analysis.

## Cumulative Calculations

Use all previous rows till current row.

## Trend Analysis

Compares previous, current, and future values.

## Forecasting Analysis

Uses future rows for prediction logic.

---

# Files Included

## 1. advanced_running_totals.sql

Contains:

* running totals
* cumulative calculations
* moving averages
* rolling analytics

## 2. rolling_window_analysis.sql

Contains:

* rolling windows
* trend analytics
* forecasting queries
* revenue analysis

## 3. advanced_frame_clauses.sql

Contains:

* frame clause concepts
* PRECEDING
* FOLLOWING
* CURRENT ROW
* UNBOUNDED PRECEDING

## 4. window_analytics_practice.sql

Contains:

* practice questions
* rolling analytics exercises
* trend analysis tasks

## 5. assignments.sql

Contains:

* assignment questions
* solutions
* theory concepts
* interview questions

## 6. mini_project.sql

Mini project based on:

* KPI dashboards
* sales analytics
* trend analysis
* forecasting systems

---

# Mini Project Overview

## Sales Trend & KPI Analytics Dashboard

This project demonstrates:

* running totals
* rolling averages
* cumulative analytics
* forecasting analysis
* trend analysis
* dashboard reporting
* business intelligence SQL

---

# Real-World Use Cases

These SQL concepts are heavily used in:

* Power BI Dashboards
* Tableau Reporting
* Financial Analytics
* Revenue Tracking
* KPI Monitoring
* Forecasting Systems
* Trend Analysis
* Stock Market Analytics
* Business Intelligence
* Time-Series Analytics

---

# Skills Developed

* Advanced SQL
* Window Functions
* Rolling Analytics
* Frame Clauses
* Trend Analysis
* Forecasting Logic
* Dashboard Analytics
* KPI Reporting
* Financial Analytics
* Business Intelligence SQL

---

# Important Interview Concepts

## Running Total vs Moving Average

| Running Total          | Moving Average         |
| ---------------------- | ---------------------- |
| cumulative calculation | rolling calculation    |
| uses all previous rows | uses fixed-size window |

---

## PRECEDING vs FOLLOWING

| PRECEDING     | FOLLOWING   |
| ------------- | ----------- |
| previous rows | future rows |

---

## Rolling vs Cumulative Calculations

| Rolling          | Cumulative          |
| ---------------- | ------------------- |
| fixed-size frame | all previous rows   |
| moving analysis  | cumulative analysis |

---

# Most Important Learnings

```sql
Window Functions perform
analytical calculations
without collapsing rows.
```

```sql
ORDER BY controls
calculation sequence
inside window functions.
```

```sql
ROWS BETWEEN controls
which rows participate
inside calculations.
```

---

# Conclusion

Day 08 provided deep understanding of:

* advanced window functions
* rolling calculations
* cumulative analytics
* frame clauses
* KPI reporting
* forecasting logic
* business intelligence SQL

These concepts are extremely important for real-world Data Analyst and Business Intelligence roles.

```
```

