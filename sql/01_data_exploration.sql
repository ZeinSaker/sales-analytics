-- ============================================
--   PIZZA SALES ANALYSIS – DATA EXPLORATION
-- ============================================

-- Total number of orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;

-- Total revenue
SELECT ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales;

-- Average order value
SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM pizza_sales;


-- 2. ORDERS & REVENUE OVER TIME
-- --------------------------------------------

-- Daily order count
SELECT order_date, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_date
ORDER BY order_date;

-- Monthly revenue trend
SELECT STRFTIME('%Y-%m', order_date) AS month, SUM(total_price) AS monthly_revenue
FROM pizza_sales
GROUP BY month
ORDER BY month;


-- 3. TOP SELLING ITEMS
-- --------------------------------------------

-- Top 5 best-selling pizzas (by quantity)
SELECT pizza_name, SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_sold DESC
LIMIT 5;

-- Revenue by pizza category
SELECT pizza_category, ROUND(SUM(total_price), 2) AS category_revenue
FROM pizza_sales
GROUP BY pizza_category
ORDER BY category_revenue DESC;


-- 4. SIZE AND QUANTITY ANALYSIS
-- --------------------------------------------

-- Quantity sold by pizza size
SELECT pizza_size, SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_size
ORDER BY total_sold DESC;


-- 5. ORDER TIMING PATTERNS
-- --------------------------------------------

-- Orders by hour of day
SELECT STRFTIME('%H', order_time) AS hour, COUNT(*) AS total_orders
FROM pizza_sales
GROUP BY hour
ORDER BY hour;

-- Orders by weekday (0 = Sunday, 6 = Saturday)
SELECT STRFTIME('%w', order_date) AS weekday, COUNT(*) AS total_orders
FROM pizza_sales
GROUP BY weekday
ORDER BY weekday;
