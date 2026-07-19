# Ecommerce Sales Analysis using SQL

**Author:** Piyush Jha

## Overview

This project uses **PostgreSQL** to analyze a multi-category e-commerce business and answer three practical business questions about sales performance and customer behavior. Rather than focusing on SQL syntax alone, the objective is to demonstrate how analytical SQL can be used to investigate business problems, validate hypotheses, and support data-driven decision making.

The analysis is based on **one quarter of transactional data (March–June 2026)** and follows a structured workflow: understanding the business and validating the dataset, evaluating business performance, and identifying the customer segments that create the greatest long-term value.

---

## Business Questions

This project investigates three business questions:

1. **What does the data reveal about the business and its operational health?**
2. **What explains the recent changes in revenue performance?**
3. **Which customers generate the greatest business value, and where should future marketing investment be focused?**

Detailed findings for each question are available in the `findings/` directory.

---

## Key Findings

- **Revenue declined because order volume decreased—not because customers spent less.** Revenue fell from April to May while **Average Order Value (AOV)** remained relatively stable, indicating that fewer completed orders, rather than lower customer spending, drove the decline.

- **Repeat customers are the primary revenue driver.** Although repeat customers represent only **44.55%** of the customer base, they generate **87.63%** of total revenue, demonstrating that customer retention delivers significantly greater business value than acquisition alone.

- **Customer value is highly concentrated.** The highest-spending **20%** of customers contribute **69.84%** of total revenue, suggesting that a relatively small customer segment drives most of the business's financial performance.

---

## Business Recommendation

The analysis suggests that future growth should focus on increasing completed order volume rather than increasing basket size. Since repeat customers generate the majority of revenue, marketing investment should prioritize retaining high-value customers, encouraging repeat purchases through loyalty and personalized engagement programs, and converting one-time buyers into repeat customers.

---

## Repository Structure

```
.
├── sql/
│   ├── 01_exploration.sql
│   ├── 02_revenue.sql
│   └── 03_customers.sql
│
├── findings/
│   ├── 00_executive_summary.md
│   ├── 01_business_overview.md
│   ├── 02_business_health.md
│   └── 03_customer_segments.md
│
└── README.md
```

---

## Tools Used

- PostgreSQL
- SQL
  - Common Table Expressions (CTEs)
  - Window Functions
  - Aggregate Functions
  - Joins
  - Conditional Aggregation
- Git & GitHub

---

## What I'd Do Next

Because this analysis is based on a **single quarter of transactional data**, it provides a snapshot of recent business performance rather than long-term trends. Given additional historical data, I would extend the project by:

- **Performing cohort retention analysis** to understand how customer loyalty evolves over multiple quarters.
- **Comparing Customer Lifetime Value (CLV) across acquisition channels** to evaluate the long-term effectiveness of different marketing channels.
- **Analyzing seasonal and year-over-year trends** to distinguish temporary fluctuations from sustained business growth and identify recurring demand patterns.

---

## About This Project

This project demonstrates an end-to-end analytical workflow using SQL—from data exploration and validation to business performance analysis and customer segmentation. Rather than reporting metrics in isolation, the analysis connects multiple business questions to explain **what changed, why it changed, and where the business should focus its future efforts.**
