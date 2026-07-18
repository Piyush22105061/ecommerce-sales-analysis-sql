# Milestone 3 – Customer Segmentation

## Business Question

The Marketing team wants to understand customer purchasing behavior to determine where Q4 marketing investment should be focused. Specifically, they want to answer:

- What percentage of customers purchase only once?
- How many customers return and place repeat orders?
- Are repeat customers significantly more valuable?
- If only one customer segment could be prioritized, which segment would provide the highest return on marketing investment?

The objective of this analysis is not simply to describe customer behavior but to identify the customer segment that contributes the greatest business value and provide actionable recommendations.

---

## Methodology

A customer-level summary was first created by aggregating all completed (non-cancelled) orders for each customer.

For every customer, the following metrics were calculated:

- Number of completed orders
- Lifetime spend
- First purchase date
- Last purchase date

This customer summary served as the foundation for all subsequent analyses.

---

## One-Time vs Repeat Customers

A **repeat customer** is defined as a customer who has placed **two or more completed orders**, while a **one-time customer** has placed exactly one completed order.

### Results

| Customer Segment | Customer Share | Revenue Share |
|------------------|---------------:|--------------:|
| One-Time Customers | **55.45%** | **12.37%** |
| Repeat Customers | **44.55%** | **87.63%** |

### Key Insight

Although more than half of customers purchase only once, they contribute only **12.37%** of total revenue.

In contrast, repeat customers account for less than half of the customer base but generate **87.63%** of total revenue.

This indicates that long-term business growth depends much more on retaining existing customers than continuously acquiring new ones.

---

# Identifying the Best Customer Segment

The term **"best customer"** can be interpreted in several ways. Common definitions include:

- Customers with the highest order frequency
- Customers with the highest lifetime spend
- Customers with the most recent purchases
- RFM (Recency, Frequency, Monetary) segmentation

For this analysis, the objective is to recommend where Marketing should invest its budget. Since Marketing ultimately aims to maximize revenue, **customer lifetime spend** was selected as the primary measure of customer value.

Customers were ranked using SQL's **NTILE(5)** window function, which divides customers into five equally sized groups based on lifetime spend. The highest-spending quintile (Top 20%) was selected as the **Best Customer Segment**.

---

## Why NTILE Instead of Order Count?

Order-count thresholds such as **"customers with 10+ orders"** may appear intuitive, but they are arbitrary and highly dependent on the dataset.

For example, defining loyal customers as those with six or more orders may work for one business but may be completely inappropriate for another with different purchasing behavior.

Using **NTILE(5)** provides several advantages:

- It is **data-driven** rather than based on manually chosen thresholds.
- Every segment contains approximately the same number of customers, making comparisons fair.
- It adapts automatically to different datasets without changing business rules.
- It aligns with Marketing's objective by ranking customers according to **actual business value (lifetime spend)**.

Additionally, order frequency does not always represent customer value.

For example:

- Customer A places **3 orders worth ₹40,000 each**.
- Customer B places **10 orders worth ₹2,000 each**.

Although Customer B purchases more frequently, Customer A contributes substantially more revenue.

Since Marketing decisions should prioritize customers who generate the greatest business value, **lifetime spend provides a more meaningful segmentation than order count alone**.

---

# Best Customer Segment Profile

The highest-spending quintile (Top 20% of customers) produced the following results:

| Metric | Top 20% Customers |
|--------|------------------:|
| Customer Share | **20%** |
| Revenue Share | **69.84%** |
| Average Lifetime Spend | **₹99,122** |
| Average Orders | **13.95** |

### Comparison with Remaining Customers

| Metric | Top 20% | Remaining 80% |
|--------|---------:|--------------:|
| Customer Share | **20%** | **80%** |
| Revenue Share | **69.84%** | **30.16%** |

### Key Insight

Only one-fifth of customers generate nearly **70% of total revenue**, indicating that customer value is highly concentrated.

This makes the highest-spending quintile the most valuable customer segment for the business.

---

# Discussion

## What does this mean for Marketing?

The analysis clearly demonstrates that revenue is not evenly distributed across customers.

A relatively small group of customers contributes the majority of business revenue. Therefore, increasing the retention and lifetime value of these customers is likely to generate a much higher return than allocating additional budget solely toward acquiring new customers.

---

## Is every repeat customer equally valuable?

Not necessarily.

This analysis defines repeat customers as customers with two or more completed orders. However, purchase frequency alone does not capture customer engagement.

For example:

- A customer placing two orders **six days apart** is likely to be highly engaged.
- A customer placing two orders **six months apart** may already be inactive.

Both customers are technically classified as repeat customers, but their future value is likely to differ.

Future analyses could incorporate **Recency (RFM Analysis)** to distinguish active repeat customers from dormant repeat customers and further improve marketing targeting.

---

## Why Lifetime Spend Best Serves Marketing

The purpose of this analysis is to answer the Marketing team's question:

> **"Where should we spend our Q4 budget?"**

While purchase frequency measures customer activity, lifetime spend directly measures customer value.

Customers who generate the highest lifetime revenue are more likely to deliver the greatest return from retention campaigns, loyalty programs, personalized recommendations, and premium customer experiences.

Therefore, defining the **Top 20% of customers by lifetime spend** provides the most actionable customer segment for Marketing.

---

# Recommendation

Based on this analysis, Q4 marketing investment should prioritize **customer retention over customer acquisition alone**.

The recommended strategy is:

1. **Protect the Top 20% Customers**
   - Loyalty programs
   - VIP benefits
   - Personalized offers
   - Early product access

2. **Develop Repeat Customers**
   - Encourage existing repeat customers to increase their lifetime spend through cross-selling and upselling.
   - Promote products that increase average order value.

3. **Reduce One-Time Customer Churn**
   - Implement post-purchase email campaigns.
   - Offer second-purchase incentives.
   - Improve customer onboarding and engagement after the first order.

Increasing the number of customers who progress into the highest-value segment is likely to produce a substantially higher return than investing the same budget exclusively in acquiring new customers.

---

# Conclusion

Customer lifetime value is highly concentrated within a relatively small segment of the customer base.

Although **55.45%** of customers purchase only once, **44.55%** of repeat customers generate **87.63%** of total revenue.

Furthermore, the **Top 20% of customers contribute nearly 70% of total revenue**, making them the most valuable customer segment.

For Q4, Marketing should focus on retaining high-value customers while encouraging more customers to progress into this segment, as this strategy is expected to deliver the greatest long-term business impact.
