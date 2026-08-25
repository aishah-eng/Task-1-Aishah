-- =========================================
-- PROJECT 3: SQL DATA ANALYSIS
-- =========================================
CREATE TABLE sales_project3 (
    order_id VARCHAR(20),
    order_date DATE,
    customer_id VARCHAR(20),
    product VARCHAR(50),
    quantity INTEGER,
    unit_price NUMERIC(10,2),
    shipping_address VARCHAR(100),
    payment_method VARCHAR(50),
    order_status VARCHAR(50),
    tracking_number VARCHAR(30),
    items_in_cart INTEGER,
    coupon_code VARCHAR(50),
    referral_source VARCHAR(50),
    total_price NUMERIC(10,2)
);
--1.=========================================
-- Using SELECT
select * 
from sales_project3;

--selecting specific columns
SELECT order_id,
       product,
       quantity,
       unit_price,
       total_price
FROM sales_project3;
--2.=========================================
--Using WHERE
SELECT *
FROM sales_project3
WHERE product = 'Phone';

-- To Find orders above 2,000
SELECT order_id,
       product,
       total_price
FROM sales_project3
WHERE total_price > 2000;

--TO find cancelled orders
SELECT *
FROM sales_project3
WHERE order_status = 'Cancelled';
--3.=========================================
--Using ORDER BY
--TO find highest value orders
SELECT order_id,
       product,
       quantity,
       total_price
FROM sales_project3
ORDER BY total_price DESC;

--To find lowest value orders
SELECT order_id,
       product,
       quantity,
       total_price
FROM sales_project3
ORDER BY total_price ASC;

--To find highest qauantity
SELECT order_id,
       product,
       quantity,
       total_price
FROM sales_project3
ORDER BY quantity DESC;
--4. =========================================
--Using COUNT
--To count all orders
SELECT COUNT(*) AS total_orders
FROM sales_project3;

--Using GROUP BY and Count
--To find number of orders per product
SELECT product,
       COUNT(*) AS order_count
FROM sales_project3
GROUP BY product
ORDER BY order_count DESC;

--To find order status analysis
SELECT order_status,
       COUNT(*) AS order_count
FROM sales_project3
GROUP BY order_status
ORDER BY order_count DESC;

--To find payment method analysis
SELECT payment_method,
       COUNT(*) AS order_count
FROM sales_project3
GROUP BY payment_method
ORDER BY order_count DESC;
--5.=========================================
--Using SUM
--To find total sales
SELECT SUM(total_price) AS total_sales
FROM sales_project3;
-- PROFESSIONAL INSIGHT:
-- The dataset recorded a total order value of 1,264,761.96 across
-- 1,200 orders, indicating the overall sales value captured in the
-- dataset.

--To find total sales by product
SELECT product,
       SUM(total_price) AS total_sales
FROM sales_project3
GROUP BY product
ORDER BY total_sales DESC;

--To find total quantity sold by product
SELECT product,
       SUM(quantity) AS total_quantity
FROM sales_project3
GROUP BY product
ORDER BY total_quantity DESC;
-- 6.=========================================
--Using AVG
--TO find average order value
SELECT AVG(total_price) AS average_order_value
FROM sales_project3;
-- PROFESSIONAL INSIGHT:
-- The average order value was 1,053.97 across the 1,200 orders in the
-- dataset, indicating that customers spent approximately 1,053.97 per
-- order on average.

--To find average unit price by product
SELECT product,
       AVG(unit_price) AS average_unit_price
FROM sales_project3
GROUP BY product
ORDER BY average_unit_price DESC;

--To find average quantity per order
SELECT AVG(quantity) AS average_quantity_per_order
FROM sales_project3;
-- 7.=========================================
--Combining SELECT,COUNT,SUM,AVG,GROUP BY,ORDER BY
-- To find Product Performance Analysis
SELECT product,
       COUNT(*) AS order_count,
       SUM(quantity) AS total_quantity,
       SUM(total_price) AS total_sales,
       AVG(total_price) AS average_order_value
FROM sales_project3
GROUP BY product
ORDER BY total_sales DESC;
-- PROFESSIONAL INSIGHT:
-- Chair generated the highest total sales at 195,620.11 and also recorded
-- the highest total quantity sold at 562 units, indicating strong overall
-- sales performance. Printer had the highest number of orders at 181,
-- while Laptop recorded the highest average order value at 1,110.56.
-- Phone recorded the lowest order count, total quantity sold, and total
--sales among the products analyzed.




--To find Payment Method Performance
SELECT payment_method,
       COUNT(*) AS order_count,
       SUM(total_price) AS total_sales,
       AVG(total_price) AS average_order_value
FROM sales_project3
GROUP BY payment_method
ORDER BY total_sales DESC;
-- PROFESSIONAL INSIGHT:
-- Online payment had the highest number of orders at 258, indicating that
-- it was the most frequently used payment method. However, Credit Card
-- recorded the highest total sales value at 263,847.63 and the highest
-- average order value at 1,127.55, suggesting that Credit Card transactions
-- had higher average order values. Debit Card recorded the lowest total
-- sales at 232,361.18, while Gift Card had the lowest number of orders at 230.

--To find Referral Source Performance
SELECT referral_source,
       COUNT(*) AS order_count,
       SUM(total_price) AS total_sales,
       AVG(total_price) AS average_order_value
FROM sales_project3
GROUP BY referral_source
ORDER BY total_sales DESC;
-- PROFESSIONAL INSIGHT:
-- Instagram was the strongest referral source, generating the highest
-- number of orders at 259 and the highest total sales value at 275,285.45.
-- Facebook recorded the highest average order value at 1,098.29 despite
-- having fewer orders than Instagram.Referral had the lowest
-- order count at 222 and the lowest total sales value at 226,815.58.

--To find order status and sales
SELECT order_status,
       COUNT(*) AS order_count,
       SUM(total_price) AS total_sales,
       AVG(total_price) AS average_order_value
FROM sales_project3
GROUP BY order_status
ORDER BY total_sales DESC;
-- PROFESSIONAL INSIGHT:
-- Cancelled orders recorded the highest order count at 250 and the highest
-- total sales value at 276,396.21. This is notable because a substantial
-- amount of order value is associated with cancelled transactions.
-- Returned orders recorded the lowest average order value at 984.93,
-- while Delivered orders had the lowest number of orders at 231.

--To find delivered orders only
SELECT product,
       COUNT(*) AS delivered_orders,
       SUM(quantity) AS delivered_quantity,
       SUM(total_price) AS delivered_sales
FROM sales_project3
WHERE order_status = 'Delivered'
GROUP BY product
ORDER BY delivered_sales DESC;
-- PROFESSIONAL INSIGHT:
-- Laptop recorded the highest number of delivered orders at 40 and the
-- highest delivered quantity at 121 units. It also generated the highest
-- delivered sales value at 40,714.43. Phone followed closely with 38
-- delivered orders and delivered sales of 40,345.41. Desk recorded the
-- lowest delivered sales value at 24,225.78.
-- ADDITIONAL INSIGHT:
-- Although Chair had the highest overall sales, Laptop led in delivered
-- sales, showing that product performance differs when analysis is limited
-- to successfully delivered orders.
--8. =========================================
--Using HAVING
SELECT product,
       SUM(total_price) AS total_sales
FROM sales_project3
GROUP BY product
HAVING SUM(total_price) > 100000
ORDER BY total_sales DESC;
-- PROFESSIONAL INSIGHT:
-- All seven products recorded total sales above 100,000, showing that
-- sales were distributed across every product category rather than being
-- concentrated in only a few products. Chair recorded the highest total
-- sales at 195,620.11, while Phone recorded the lowest at 151,722.39.
-- 9.=========================================
--Sales Percentage
SELECT product,
       SUM(total_price) AS total_sales,
       ROUND(
           SUM(total_price) * 100.0 /
           (SELECT SUM(total_price)
            FROM sales_project3),
           2
       ) AS sales_percentage
FROM sales_project3
GROUP BY product
ORDER BY total_sales DESC;
-- PROFESSIONAL INSIGHT:
-- Sales contribution was relatively evenly distributed across the seven
-- products. Chair and Printer each contributed 15.47% of total order value,
-- representing the highest individual contributions, while Phone contributed
-- the lowest at 12.00%. This indicates that overall order value was not
-- heavily dependent on a single product.
--10 =========================================
--Data Quality Check
--Checking for missing values in product
SELECT COUNT(*) AS missing_product
FROM sales_project3
WHERE product IS NULL;

--Checking for missing values in quantity
SELECT COUNT(*) AS missing_quantity
FROM sales_project3
WHERE quantity IS NULL;

--Checking for missing values in total price 
SELECT COUNT(*) AS missing_total_price
FROM sales_project3
WHERE total_price IS NULL;
-- DATA QUALITY INSIGHT:
-- The data quality check found no NULL values in the key fields examined,
-- indicating that the dataset contains complete values for these fields
-- and is suitable for the SQL analysis performed.

--Checking distinct values for product
SELECT DISTINCT product
FROM sales_project3; 

--checking distinct values for order status
SELECT DISTINCT order_status
FROM sales_project3;

--checking distinct values for payment method 
SELECT DISTINCT payment_method
FROM sales_project3;

--checking distinct values for referral source
SELECT DISTINCT referral_source
FROM sales_project3;






