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