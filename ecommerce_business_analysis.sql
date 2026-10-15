CREATE DATABASE ecommerce_ba;
USE ecommerce_ba;

SELECT COUNT(*) 
FROM ecommerce_orders;
RENAME TABLE ecommerce_business_analysis_1500_orders
TO ecommerce_orders;
SELECT COUNT(*)
FROM ecommerce_orders;
SELECT *
FROM ecommerce_orders;

SELECT 
    SUM(revenue) AS total_revenue
FROM ecommerce_orders;

SELECT
    SUM(profit) AS total_profit
FROM ecommerce_orders;
SELECT COUNT(*) AS total_orders
FROM ecommerce_orders;

SELECT 
    COUNT(*) AS total_orders
FROM ecommerce_orders;

SELECT 
    SUM(quantity) AS total_quantity_sold
FROM ecommerce_orders;
SELECT 
    COUNT(*) AS total_orders
FROM ecommerce_orders;
SELECT 
    SUM(quantity) AS total_quantity_sold
FROM ecommerce_orders;

SELECT
    SUM(revenue) / COUNT(*) AS average_order_value
FROM ecommerce_orders;
SELECT
    (SUM(profit) / SUM(revenue)) * 100 AS profit_margin_percentage
FROM ecommerce_orders;
SELECT
    category,
    SUM(revenue) AS total_revenue
FROM ecommerce_orders
GROUP BY category;

SELECT
    category,
    SUM(revenue) AS total_revenue
FROM ecommerce_orders
GROUP BY category
ORDER BY total_revenue DESC;

SELECT
    category,
    SUM(revenue) AS total_revenue,
    SUM(cost) AS total_cost,
    SUM(profit) AS total_profit
FROM ecommerce_orders
GROUP BY category
ORDER BY total_profit DESC;

SELECT
    category,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(revenue)) * 100 AS profit_margin
FROM ecommerce_orders
GROUP BY category
ORDER BY profit_margin DESC;

SELECT
    category,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(revenue)) * 100 AS profit_margin
FROM ecommerce_orders
GROUP BY category
ORDER BY profit_margin DESC;
SELECT
    product_name,
    revenue,
    profit
FROM ecommerce_orders
WHERE category = 'Electronics';

SELECT
    SUM(revenue) AS electronics_revenue
FROM ecommerce_orders
WHERE category = 'Electronics';

SELECT
    SUM(revenue) AS delivered_electronics_revenue
FROM ecommerce_orders
WHERE category = 'Electronics'
  AND order_status = 'Delivered';
  
  SELECT
    region,
    SUM(revenue) AS total_revenue
FROM ecommerce_orders
WHERE region IN ('North', 'West')
GROUP BY region
ORDER BY total_revenue DESC;

SELECT
    region,
    SUM(revenue) AS total_revenue
FROM ecommerce_orders
WHERE region IN ('South', 'East')
GROUP BY region
ORDER BY total_revenue DESC;

SELECT
    product_name,
    category,
    revenue,
    profit
FROM ecommerce_orders
WHERE product_name LIKE '%Smartwatch%';

SELECT DISTINCT category, product_name
FROM ecommerce_orders
ORDER BY category, product_name;

SELECT
    CASE
        WHEN revenue >= 10000 THEN 'High Value'
        WHEN revenue >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value_segment,
    COUNT(*) AS total_orders
FROM ecommerce_orders
GROUP BY order_value_segment
ORDER BY total_orders DESC;
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(revenue) AS total_revenue
FROM ecommerce_orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_year,
    order_month;
    
    SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS month_number,
    MONTHNAME(order_date) AS month_name,
    SUM(revenue) AS total_revenue
FROM ecommerce_orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY
    order_year,
    month_number;
    
    SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS month_number,
    MONTHNAME(order_date) AS month_name,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM ecommerce_orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY
    order_year,
    month_number;
    
    SELECT
    COUNT(DISTINCT customer_id) AS unique_customers
FROM ecommerce_orders;

SELECT
    customer_type,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM ecommerce_orders
GROUP BY customer_type
ORDER BY unique_customers DESC;

SELECT
    customer_id,
    customer_name,
    SUM(revenue) AS total_revenue
FROM ecommerce_orders
GROUP BY
    customer_id,
    customer_name
ORDER BY total_revenue DESC
LIMIT 10;

SELECT
    product_name,
    category,
    SUM(quantity) AS units_sold,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM ecommerce_orders
GROUP BY
    product_name,
    category
ORDER BY total_revenue DESC
LIMIT 10;

SELECT
    product_name,
    category,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(revenue)) * 100 AS profit_margin
FROM ecommerce_orders
GROUP BY
    product_name,
    category
ORDER BY profit_margin ASC;

SELECT
    product_name,
    category,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(revenue)) * 100 AS profit_margin
FROM ecommerce_orders
GROUP BY
    product_name,
    category
HAVING
    SUM(revenue) > 50000
    AND (SUM(profit) / SUM(revenue)) * 100 < 20
ORDER BY total_revenue DESC;
SELECT
    product_name,
    category,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(revenue)) * 100 AS profit_margin
FROM ecommerce_orders
GROUP BY
    product_name,
    category
ORDER BY profit_margin ASC;

SELECT
    product_name,
    category,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(revenue)) * 100 AS profit_margin
FROM ecommerce_orders
GROUP BY
    product_name,
    category
ORDER BY profit_margin ASC;

SELECT
    product_name,
    (SUM(profit) / SUM(revenue)) * 100 AS profit_margin
FROM ecommerce_orders
WHERE product_name = 'Face Wash'
GROUP BY product_name;

SELECT
    product_name,
    (SUM(profit) / SUM(revenue)) * 100 AS profit_margin
FROM ecommerce_orders
WHERE product_name = 'Fiction Book'
GROUP BY product_name;

SELECT
    product_name,
    category,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(revenue)) * 100 AS profit_margin
FROM ecommerce_orders
GROUP BY
    product_name,
    category
HAVING
    (SUM(profit) / SUM(revenue)) * 100 < 20
ORDER BY profit_margin ASC;

SELECT
    product_name,
    category,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(revenue)) * 100 AS profit_margin
FROM ecommerce_orders
GROUP BY
    product_name,
    category
HAVING
    (SUM(profit) / SUM(revenue)) * 100 < 30
ORDER BY profit_margin ASC;

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM ecommerce_orders
GROUP BY order_status
ORDER BY total_orders DESC;

SELECT
    COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) * 100.0
    / COUNT(*) AS cancellation_rate
FROM ecommerce_orders;

SELECT
    region,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) AS cancelled_orders,
    COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) * 100.0
        / COUNT(*) AS cancellation_rate
FROM ecommerce_orders
GROUP BY region
ORDER BY cancellation_rate DESC;

SELECT
    AVG(delivery_days) AS average_delivery_days
FROM ecommerce_orders;

SELECT
    region,
    AVG(delivery_days) AS average_delivery_days
FROM ecommerce_orders
GROUP BY region
ORDER BY average_delivery_days DESC;

SELECT
    COUNT(*) AS delayed_orders
FROM ecommerce_orders
WHERE delivery_days > 5;

SELECT
    COUNT(CASE WHEN delivery_days > 5 THEN 1 END) * 100.0
    / COUNT(*) AS delayed_order_percentage
FROM ecommerce_orders;

SELECT
    region,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN delivery_days > 5 THEN 1 END) AS delayed_orders,
    COUNT(CASE WHEN delivery_days > 5 THEN 1 END) * 100.0
        / COUNT(*) AS delayed_order_percentage
FROM ecommerce_orders
GROUP BY region
ORDER BY delayed_order_percentage DESC;

SELECT
    payment_method,
    COUNT(*) AS total_orders
FROM ecommerce_orders
GROUP BY payment_method
ORDER BY total_orders DESC;

SELECT
    payment_method,
    COUNT(*) AS total_orders,
    SUM(revenue) AS total_revenue
FROM ecommerce_orders
GROUP BY payment_method
ORDER BY total_revenue DESC;

CREATE TABLE customer_summary AS
SELECT DISTINCT
    customer_id,
    customer_name,
    customer_type
FROM ecommerce_orders;

CREATE TABLE customer_summary AS
SELECT DISTINCT
    customer_id,
    customer_name,
    customer_type
FROM ecommerce_orders;

SELECT *
FROM customer_summary
LIMIT 10;

SELECT
    o.order_id,
    o.customer_id,
    c.customer_name,
    c.customer_type,
    o.revenue,
    o.profit
FROM ecommerce_orders AS o
INNER JOIN customer_summary AS c
    ON o.customer_id = c.customer_id;
    
    SELECT
    c.customer_type,
    COUNT(DISTINCT c.customer_id) AS unique_customers,
    SUM(o.revenue) AS total_revenue,
    SUM(o.profit) AS total_profit
FROM ecommerce_orders AS o
INNER JOIN customer_summary AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_type
ORDER BY total_revenue DESC;

WITH category_sales AS (
    SELECT
        category,
        SUM(revenue) AS total_revenue
    FROM ecommerce_orders
    GROUP BY category
)
SELECT
    category,
    total_revenue
FROM category_sales
WHERE total_revenue > 2000000
ORDER BY total_revenue DESC;

WITH product_sales AS (
    SELECT
        category,
        product_name,
        SUM(revenue) AS total_revenue
    FROM ecommerce_orders
    GROUP BY
        category,
        product_name
)
SELECT
    category,
    product_name,
    total_revenue,
    RANK() OVER (
        PARTITION BY category
        ORDER BY total_revenue DESC
    ) AS revenue_rank
FROM product_sales
ORDER BY
    category,
    revenue_rank;