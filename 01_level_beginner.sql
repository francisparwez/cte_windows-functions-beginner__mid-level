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