# Business Overview

## What this business does

* The database represents a **multi-category ecommerce business** operating in India, offering products across categories such as **Apparel, Home & Living, and Consumer Electronics**.
* The business maintains a catalog of approximately **4,000 products** sourced from **120 brands** across **18 product categories**, indicating a diverse product portfolio rather than a niche retailer.
* In addition to order management, the platform supports inventory tracking, payments, shipping, returns, promotions, loyalty programs, customer segmentation, and marketing attribution, indicating a mature ecommerce ecosystem.

## Scale

* The business has **10,000 registered customers**, of which **8,800 have placed at least one order**, while the remaining customers are registered but have not yet made a purchase.
* Customers have placed **40,000 orders**, averaging approximately **4 orders per purchasing customer**, demonstrating healthy repeat purchase behaviour.
* The available transaction data spans **16 March 2026 to 14 June 2026** (approximately three months). While this provides a useful snapshot of recent operations, it is insufficient to evaluate long-term growth or seasonality.
* During this period, the business generated approximately **₹298.75 million (₹29.88 crore)** in revenue with an **Average Revenue generated per Customer  of ₹33,949.33**.

## What I noticed

* The platform demonstrates a mature customer and marketing strategy by capturing acquisition channels, UTM parameters, customer lifecycle stages, verification status, and marketing consent for each customer.
* A referential integrity check found **no orphan customer IDs**, confirming that every order is associated with a valid customer record.
* Two notable data quality issues were identified. First, approximately **2% of customer records have a missing (`NULL`) gender value**, which may impact customer segmentation and demographic reporting. Second, the **order status** field contains inconsistent capitalization (for example, `shipped`, `Shipped`, and `SHIPPED`), meaning identical business states are stored as different values. Without standardization, status-based reports and dashboards may produce inaccurate results.
* Overall, the underlying data is well structured and suitable for business analysis, but addressing these data quality issues before deploying production dashboards or automated reporting would improve reporting consistency and analytical reliability.
