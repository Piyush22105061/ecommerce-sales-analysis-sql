# Ecommerce Sales Analysis using SQL

**Author:** Piyush Jha

## Overview

This project uses PostgreSQL to analyze a multi-category e-commerce business and answer three business questions:

1. Is the business performing well?
2. What explains recent changes in sales performance?
3. Which customers create the most business value?

Rather than simply writing SQL queries, the project focuses on transforming transactional data into business insights and actionable recommendations. Each analysis builds on the previous one, progressing from understanding the business, to evaluating revenue performance, and finally identifying the customer segments that should be prioritized for future growth.

---

## The Questions

- What does the data tell us about the overall health of the business?
- Why did revenue change over the reporting period?
- Which customers contribute the greatest long-term value?

---

## Key Findings

- **Revenue declined because order volume fell—not because customers spent less.** Average Order Value remained relatively stable while revenue decreased from April to May, indicating lower completed orders rather than reduced customer spending.
- **Repeat customers are the primary revenue driver.** Although they represent only **44.55%** of customers, they generate **87.63%** of total revenue, making customer retention significantly more valuable than acquisition alone.
- **Customer value is highly concentrated.** The highest-spending **20%** of customers contribute **69.84%** of total revenue, suggesting that protecting high-value customers should be a business priority.

---

## Tools Used

- PostgreSQL
- SQL
- Git & GitHub

---

## How to Reproduce

1. Restore the ecommerce database into PostgreSQL.
2. Run the SQL files in numerical order.
3. Read the corresponding findings in the `findings/` directory.

---

## What I'd Do Next

Because this analysis uses only a single quarter of data, it provides a snapshot of recent business performance rather than long-term trends. With additional historical data, I would extend the project by:

- Performing **cohort retention analysis** to measure how customer loyalty changes over time.
- Comparing **Customer Lifetime Value (CLV)** across acquisition channels to evaluate long-term marketing effectiveness.
- Analyzing **seasonal and year-over-year trends** to distinguish temporary fluctuations from sustained business growth or decline.
