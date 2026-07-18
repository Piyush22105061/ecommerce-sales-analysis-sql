-- Customer Profile


    SELECT
        c.customer_id,
        COUNT(DISTINCT o.order_id) AS order_count,
        SUM(oi.qty * oi.unit_price) AS total_spend,
        MIN(o.created_at) AS first_order_date,
        MAX(o.created_at) AS last_order_date
    FROM ecom.customers c
    JOIN ecom.orders o
        ON c.customer_id = o.customer_id
    JOIN ecom.order_items oi
        ON o.order_id = oi.order_id
    WHERE LOWER(o.status) <> 'cancelled'
    GROUP BY c.customer_id
	ORDER BY total_spend DESC

-- One-time vs Repeat Customers 

WITH customer_summary AS (
    SELECT
        c.customer_id,
        COUNT(DISTINCT o.order_id) AS order_count,
        SUM(oi.qty * oi.unit_price) AS total_spend,
        MIN(o.created_at) AS first_order_date,
        MAX(o.created_at) AS last_order_date
    FROM ecom.customers c
    JOIN ecom.orders o
        ON c.customer_id = o.customer_id
    JOIN ecom.order_items oi
        ON o.order_id = oi.order_id
    WHERE LOWER(o.status) <> 'cancelled'
    GROUP BY c.customer_id
)

SELECT
    CASE
        WHEN order_count = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS customer_segment,

    COUNT(*) AS customer_count,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS customer_share_pct,

    ROUND(SUM(total_spend), 2) AS revenue,

    ROUND(
        SUM(total_spend) * 100.0 /
        SUM(SUM(total_spend)) OVER (),
        2
    ) AS revenue_share_pct,

    ROUND(AVG(total_spend), 2) AS avg_lifetime_spend

FROM customer_summary
GROUP BY customer_segment
ORDER BY customer_segment;

-- Best Customer Segment (By NTILE)

WITH customer_summary AS (
    SELECT
        c.customer_id,
        COUNT(DISTINCT o.order_id) AS order_count,
        SUM(oi.qty * oi.unit_price) AS total_spend,
        MIN(o.created_at) AS first_order_date,
        MAX(o.created_at) AS last_order_date
    FROM ecom.customers c
    JOIN ecom.orders o
        ON c.customer_id = o.customer_id
    JOIN ecom.order_items oi
        ON o.order_id = oi.order_id
    WHERE LOWER(o.status) <> 'cancelled'
    GROUP BY c.customer_id
),
ranked_customers AS (
    SELECT
        *,
        NTILE(5) OVER (ORDER BY total_spend DESC) AS spend_quintile
    FROM customer_summary
)

SELECT
    spend_quintile,
    COUNT(*) customers,
    SUM(total_spend) revenue,
    ROUND(AVG(total_spend),2) avg_spend,
	ROUND(
        SUM(total_spend) * 100.0 /
        SUM(SUM(total_spend)) OVER (),
        2
    ) AS revenue_share_pct,
    ROUND(AVG(order_count),2) avg_orders
FROM ranked_customers
GROUP BY spend_quintile
ORDER BY spend_quintile;

-- Best Customer Segment vs Remaining Customers

WITH customer_summary AS (
    SELECT
        c.customer_id,
        COUNT(DISTINCT o.order_id) AS order_count,
        SUM(oi.qty * oi.unit_price) AS total_spend,
        MIN(o.created_at) AS first_order_date,
        MAX(o.created_at) AS last_order_date
    FROM ecom.customers c
    JOIN ecom.orders o
        ON c.customer_id = o.customer_id
    JOIN ecom.order_items oi
        ON o.order_id = oi.order_id
    WHERE LOWER(o.status) <> 'cancelled'
    GROUP BY c.customer_id
),
ranked_customers AS (
    SELECT
        *,
        NTILE(5) OVER (ORDER BY total_spend DESC) AS spend_quintile
    FROM customer_summary
)

SELECT
    CASE
        WHEN spend_quintile = 1 THEN 'Top 20% Customers'
        ELSE 'Remaining 80%'
    END AS customer_segment,

    COUNT(*) AS customers,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS customer_share_pct,

    ROUND(SUM(total_spend),2) AS revenue,

    ROUND(
        SUM(total_spend) * 100.0 /
        SUM(SUM(total_spend)) OVER (),
        2
    ) AS revenue_share_pct,

    ROUND(AVG(total_spend),2) AS avg_lifetime_spend,

    ROUND(AVG(order_count),2) AS avg_orders

FROM ranked_customers
GROUP BY customer_segment;