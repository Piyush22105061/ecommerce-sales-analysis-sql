-- validating subtotal of orders to order_items price * qty
with revenue_per_orderid as (SELECT oi.order_id , SUM(qty*unit_price) revenue 
from ecom.order_items oi
group by oi.order_id)

select count(*) 
from ecom.orders o
join revenue_per_orderid r 
on r.order_id=o.order_id
where o.subtotal=r.revenue

-- Gross Revenue Q2 as we will consider subtotal (qty*unit_price) = Gross Revenue 

SELECT SUM(subtotal) as gross_revenue
from ecom.orders
where lower(status) not in ('cancelled')

-- Gross Revenue Q2 MoM as we will consider subtotal (qty*unit_price) = Gross Revenue

SELECT DATE_TRUNC('months',created_at),SUM(subtotal) as gross_revenue
from ecom.orders
where lower(status) not in ('cancelled')
group by DATE_TRUNC('months',created_at)
order by 1 


-- Net Revenue Q2 as we will consider total - refund - tax = Net Revenue 
SELECT
    ROUND(
        SUM(o.total) - COALESCE(SUM(r.refunded_amount), 0)-sum(o.tax),
        2
    ) AS net_revenue
FROM ecom.orders o
LEFT JOIN (
    SELECT
        order_id,
        SUM(amount) AS refunded_amount
    FROM ecom.refunds
    WHERE LOWER(status) = 'succeeded'
    GROUP BY order_id
) r
ON o.order_id = r.order_id
WHERE LOWER(o.status) IN ('shipped', 'delivered');

-- Net Revenue MoM 
SELECT
    DATE_TRUNC('month', o.created_at) AS month,
    ROUND( SUM(o.total) - COALESCE(SUM(r.refunded_amount)-sum(o.tax),0),2) AS net_revenue
FROM ecom.orders o
LEFT JOIN (
    SELECT
        order_id,
        SUM(amount) AS refunded_amount
    FROM ecom.refunds
    WHERE LOWER(status) = 'succeeded'
    GROUP BY order_id
) r
ON o.order_id = r.order_id
WHERE LOWER(o.status) IN ('shipped','delivered')
GROUP BY DATE_TRUNC('month', o.created_at)
ORDER BY month;

-- Gross Revenue MoM Growth %

WITH monthly_gross_revenue AS (
    SELECT
        DATE_TRUNC('month', created_at) AS month,
        SUM(subtotal) AS gross_revenue
    FROM ecom.orders
    WHERE LOWER(status) <> 'cancelled'
    GROUP BY DATE_TRUNC('month', created_at)
)

SELECT
    month,
    ROUND(gross_revenue, 2) AS gross_revenue,
    ROUND(
        (
            (gross_revenue -
            LAG(gross_revenue) OVER (ORDER BY month))
            /
            LAG(gross_revenue) OVER (ORDER BY month)
        ) * 100,
        2
    ) AS mom_growth_percent
FROM monthly_gross_revenue
ORDER BY month;

-- Net Revenue MoM Growth %

WITH monthly_net_revenue AS (
    SELECT
        DATE_TRUNC('month', o.created_at) AS month,
        SUM(o.total)
        - COALESCE(SUM(r.refunded_amount), 0)
        - SUM(o.tax) AS net_revenue
    FROM ecom.orders o
    LEFT JOIN (
        SELECT
            order_id,
            SUM(amount) AS refunded_amount
        FROM ecom.refunds
        WHERE LOWER(status) = 'succeeded'
        GROUP BY order_id
    ) r
        ON o.order_id = r.order_id
    WHERE LOWER(o.status) IN ('shipped', 'delivered')
    GROUP BY DATE_TRUNC('month', o.created_at)
)

SELECT
    month,
    ROUND(net_revenue, 2) AS net_revenue,
    ROUND(
        (
            (net_revenue -
            LAG(net_revenue) OVER (ORDER BY month))
            /
            LAG(net_revenue) OVER (ORDER BY month)
        ) * 100,
        2
    ) AS mom_growth_percent
FROM monthly_net_revenue
ORDER BY month;

-- Order Count MoM 

select date_trunc('month',created_at) as month_name , count(order_id) order_count
from ecom.orders
group by date_trunc('month',created_at)
order by 1

-- AOV MoM

select date_trunc('month',created_at) as month_name , round(sum(subtotal)/count(order_id),2) AOV_MoM
from ecom.orders
group by date_trunc('month',created_at)
order by 1
