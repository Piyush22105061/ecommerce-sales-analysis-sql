# Executive Summary

## Business Context

This project analyzes a multi-category ecommerce business to understand its overall performance, identify the factors driving recent sales trends, and determine which customer segments contribute the greatest long-term value. Using PostgreSQL, the analysis progresses from validating the business data and operational scale, to evaluating revenue performance, and finally examining customer purchasing behaviour to provide actionable recommendations for future marketing investment.

---

## Key Findings

### 1. The business operates at meaningful scale with reliable analytical data.

The ecommerce platform manages approximately **4,000 products** across **18 categories** and **120 brands**, serving **10,000 registered customers**, of which **8,800 have made at least one purchase**. During the three-month reporting period, the business processed approximately **40,000 orders** and generated **₹29.88 crore** in revenue. Data validation confirmed strong referential integrity, with only minor quality issues such as inconsistent order status values and a small percentage of missing customer demographics.

### 2. Revenue declined because fewer orders were placed—not because customers spent less.

Revenue increased from March to April before declining in May, while **Average Order Value (AOV)** remained relatively stable throughout the reporting period. This indicates that customers continued spending similar amounts per purchase, and the decline in revenue was primarily driven by lower order volume rather than reduced customer spending. June was excluded from trend interpretation because the available data represents only a partial month.

### 3. Revenue is heavily concentrated among repeat and high-value customers.

Although **55.45%** of customers purchase only once, **44.55%** of repeat customers generate **87.63%** of total revenue. Furthermore, the highest-spending **20%** of customers contribute **69.84%** of total revenue, demonstrating that a relatively small customer segment drives the majority of business value.

---

## Recommendation

Since customer spending per order remained stable, future growth should focus on increasing completed order volume rather than increasing basket size. Marketing investment should prioritize retaining high-value customers, encouraging repeat purchases through loyalty and personalized engagement programs, and converting one-time buyers into repeat customers. These initiatives are likely to deliver a higher long-term return than focusing exclusively on customer acquisition.
