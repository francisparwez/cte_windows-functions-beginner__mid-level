-- 11. Highest Order Per Customer
-- Return the largest order for each customer.
-- Output:
--     customer_id
--     order_id
--     amount
-- Constraint:
-- Don't use:
--     MAX(amount)
--     GROUP BY customer_id
-- You need to return the entire order row.
-- Hint:
-- Think:
--     ROW_NUMBER()
--     ↓
--     CTE
--     ↓
--     WHERE row_number = 1

USE CTE_WindowFunctions_Practice;

WITH
    ranked_customer AS (
        SELECT c.customer_id, o.order_id, o.amount, ROW_NUMBER() OVER (
                PARTITION BY
                    c.customer_id
                ORDER BY o.amount DESC, o.order_id ASC
            ) AS row_num
        FROM customers c
            JOIN orders o ON c.customer_id = o.customer_id
    )
SELECT customer_id, order_id, amount
FROM ranked_customer
WHERE
    row_num = 1

--12 Second Highest Order Per Customer
--Return the second-largest order for every customer.
--For example:
--	Customer 1
--	800 → #1
--	500 → #2 ← return this
--	300 → #3
--Think about:
--	ROW_NUMBER()
--or
--	DENSE_RANK()
--Which one would be safer if duplicate amounts exist?

USE CTE_WindowFunctions_Practice;

WITH
    ranked_customer AS (
        SELECT c.customer_id, o.order_id, o.amount, ROW_NUMBER() OVER (
                PARTITION BY
                    c.customer_id
                ORDER BY o.amount DESC, o.order_id ASC
            ) AS row_num
        FROM customers c
            JOIN orders o ON c.customer_id = o.customer_id
    )
SELECT customer_id, order_id, amount
FROM ranked_customer
WHERE
    row_num = 2