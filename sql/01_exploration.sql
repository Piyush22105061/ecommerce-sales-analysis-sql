-- List all tables in the ecom schema
SELECT table_name
FROM information_schema.tables
WHERE table_schema='ecom';

-- View sample customer records
SELECT *
FROM ecom.customers
LIMIT 10;

-- View sample orders
SELECT *
FROM ecom.orders;

-- View sample order items
SELECT *
FROM ecom.order_items
LIMIT 10;

-- View sample products
SELECT *
FROM ecom.products
LIMIT 10;

-- View sample product variants
SELECT *
FROM ecom.product_variants
LIMIT 10;

-- View sample categories
SELECT *
FROM ecom.categories
LIMIT 10;

-- View sample brands
SELECT *
FROM ecom.brands
LIMIT 10;

-- Count rows in the core business tables

SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM ecom.customers
UNION ALL
SELECT 'orders', COUNT(*) FROM ecom.orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM ecom.order_items
UNION ALL
SELECT 'products', COUNT(*) FROM ecom.products
UNION ALL
SELECT 'product_variants', COUNT(*) FROM ecom.product_variants
UNION ALL
SELECT 'categories', COUNT(*) FROM ecom.categories
UNION ALL
SELECT 'brands', COUNT(*) FROM ecom.brands;

-- Determine the time span of the order data
SELECT
    MIN(created_at) AS first_order_date,
    MAX(created_at) AS last_order_date
FROM ecom.orders;

-- Total customers
SELECT COUNT(*)total_customer FROM ecom.customers;

-- Total orders
SELECT COUNT(*) total_orders FROM ecom.orders;

-- Total products
SELECT COUNT(*) total_products FROM ecom.products;

-- Total categories
SELECT COUNT(*) total_categories FROM ecom.categories;

-- Total brands
SELECT COUNT(*) total_brands FROM ecom.brands;

-- Average orders per customer
SELECT ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT customer_id),2)as avg_order_per_customer
FROM ecom.orders;

-- Total Revenue 
SELECT sum(total) total_revenue
from ecom.orders

-- Average Order Value
SELECT round(sum(total)/ COUNT (DISTINCT customer_id) ,2)   as avg_order_value
from ecom.orders

-- Orphan cutomer_id in 
SELECT COUNT(*) AS orphan_orders
FROM ecom.orders o
LEFT JOIN ecom.customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Status Abnormality 
SELECT status, COUNT(*) AS total_orders
FROM ecom.orders
GROUP BY status
ORDER BY status;

-- Gender Abnormality
SELECT gender , count(*) gender_count
FROM ecom.customers
GROUP BY gender
ORDER BY gender;
