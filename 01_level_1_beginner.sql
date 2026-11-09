USE CTE_WindowFunctions_Practice
/* ============================================================
1. FIRST CTE

Goal: Get comfortable creating an intermediate result.

Create a CTE called customer_orders containing:
customer_id
order_id
amount
Then select everything from the CTE.

Skill:
WITH ... AS (...)
============================================================ */

WITH
    customer_orders AS (
        SELECT customer_id, order_id, amount
        FROM orders
    )
SELECT *
FROM customer_orders;

/* ============================================================
2. CTE + Filtering

Create a CTE containing all orders where:
amount > 800
Then return the results from the CTE.
Think:
Should the filtering happen inside or outside the CTE?
Try both mentally and decide which makes more sense.
============================================================ */
WITH
    orders_more_than_800 AS (
        SELECT *
        FROM orders
        WHERE
            amount > 800
    )
SELECT *
FROM orders_more_than_800;

--3. ROW_NUMBER()
--For every customer, number their orders based on order_date .
--Expected concept:
--	Customer 1
--	Order 101 → 1
--	Order 102 → 2
--	Order 105 → 3
--	Customer 2
--	Order 103 → 1
--	Order 106 → 2
--Skill:
--	ROW_NUMBER()
--Think carefully about:
--	PARTITION BY
--	ORDER BY

SELECT c.customer_id, o.order_id, o.order_date, ROW_NUMBER() OVER (
        PARTITION BY
            c.customer_id
        ORDER BY o.order_date, o.order_id
    ) AS order_by_date
FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id;

-- 4. ROW_NUMBER() Without PARTITION
-- Number all orders from oldest to newest.
-- Don't divide them by customer.
-- Question to ask yourself:
--     What happens if I remove PARTITION BY ?
-- This is important because you need to understand what PARTITION BY actually does rather
-- than memorizing it.

SELECT
    order_id,
    customer_id,
    amount,
    order_date,
    ROW_NUMBER() OVER (
        ORDER BY order_date
    ) AS row_num
FROM orders
ORDER BY order_date ASC;

--5. RANK()
--Rank each customer's orders based on amount , highest first.
--For example:
--    Customer 1
--    800 → rank 1
--    500 → rank 2
--    300 → rank 3
--Use:
--    RANK()
--not ROW_NUMBER() .
--Skill:
--Understanding the difference between:
--    ROW_NUMBER
--    RANK
--    DENSE_RANK

SELECT c.customer_id, c.customer_name, c.city, o.amount, RANK() OVER (
        PARTITION BY
            c.customer_id
        ORDER BY o.amount DESC
    ) as amount_rank
FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id;

-- 6. Customer Total Using a Window Function
-- Return every order but also show:
--     customer_total
-- Example:
--     customer_id | order_id | amount | customer_total
--     -------------------------------------------------
--     1 | 101 | 500 | 1600
--     1 | 102 | 800 | 1600
--     1 | 105 | 300 | 1600
-- Important:
-- Do NOT use:
--     GROUP BY
-- You need to keep every order.
-- Skill:
--     SUM() OVER(...)

SELECT c.customer_id, c.customer_name, o.order_id, o.amount, SUM(o.amount) OVER (
        PARTITION BY
            c.customer_id
    ) AS customer_total
FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id;

-- 7.  Customer Average Order Value
-- Return:
--     customer_id
--     order_id
--     amount
--     average order amount for that customer
-- Again:
-- Do not collapse the rows.
-- You should still see every order.
-- Skill:
--     AVG() OVER(...)

SELECT
    c.customer_id,
    o.order_id,
    CAST(o.amount AS DECIMAL(13, 2)) AS amount,
    CAST(
        AVG(o.amount) OVER (
            PARTITION BY
                c.customer_id
        ) AS DECIMAL(13, 2)
    ) AS avg_customer_order_amount
FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id;

-- 8. Running Total
-- For each customer, calculate their cumulative spending over time.
-- Example:
--     Customer 1
--     Jan 5 → 500
--     Jan 10 → 1300
--     Feb 1 → 1600
-- Skill:
--     SUM() OVER (
--         PARTITION BY ...
--         ORDER BY ...
--     )
-- This is one of the most important window-function patterns you'll learn

SELECT c.customer_id, o.order_date, o.amount, SUM(o.amount) OVER (
        PARTITION BY
            c.customer_id
        ORDER BY
            o.order_date, o.order_id ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
    ) AS cumulative_spending
FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id;

-- 9. Previous Order Amount
-- For every customer, show:
--     order ID
--     order date
--     amount
--     previous order amount
-- Example:
--     order_id | amount | previous_amount
--     ------------------------------------
--     101 | 500 | NULL
--     102 | 800 | 500
--     105 | 300 | 800
-- Skill:
--     LAG()
-- Ask yourself:
--     Why can't I easily do this with GROUP BY ?

USE CTE_WindowFunctions_Practice

SELECT
    order_id,
    amount,
    LAG(amount) OVER (
        PARTITION BY
            customer_id
        ORDER BY order_date, order_id
    ) AS previous_amount
FROM orders;

-- 10. First Order Per Customer
-- Return only the first order for every customer.
-- This is your first problem where you'll combine:
-- CTE + Window Function
-- Think:
-- Step 1
-- Number each customer's orders.
-- Step 2
-- Keep only:
--     row_number = 1
-- This is a very important real-world SQL pattern.

USE CTE_WindowFunctions_Practice;

WITH
    ranked_orders AS (
        SELECT
            customer_id,
            order_id,
            order_date,
            ROW_NUMBER() OVER (
                PARTITION BY
                    customer_id
                ORDER BY order_date ASC, order_id ASC
            ) AS rn
        FROM orders
    )
SELECT
    customer_id,
    order_id,
    order_date
FROM ranked_orders
WHERE
    rn = 1;