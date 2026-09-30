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