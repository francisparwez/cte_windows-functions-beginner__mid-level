# 🧠 CTE & Window Functions SQL Practice

A structured **Microsoft SQL Server (T-SQL)** practice project designed to build confidence with **Common Table Expressions (CTEs)** and **Window Functions** through progressively challenging SQL problems.

The project contains **20 practice questions**:

- 🟢 10 Beginner-level questions
- 🟡 10 Mid-level questions
- 🔥 A combination of CTEs and Window Functions

The goal is not only to learn the syntax, but to develop the ability to recognize **when and why** CTEs and Window Functions should be used.

---

## 🎯 Project Objective

The main objective of this project is to strengthen SQL analytical thinking by practicing:

- Common Table Expressions (CTEs)
- Window Functions
- `PARTITION BY`
- `ORDER BY` inside Window Functions
- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`
- `LAG()`
- `LEAD()`
- Windowed aggregate functions
- Running totals
- Ranking within groups
- Top-N-per-group problems
- Comparing rows within groups
- Multi-step SQL transformations
- Combining CTEs with Window Functions

A major focus of the project is learning to translate a business requirement into:

```text
Business Problem
       ↓
Logical SQL Steps
       ↓
CTE / Window Function
       ↓
Final Result
```

---

# 🗄️ Database

**Database Name:**

```text
CTE_WindowFunctions_Practice
```

**Database Engine:**

```text
Microsoft SQL Server
```

**Language:**

```text
T-SQL
```

---

# 🏗️ Database Schema

The practice database currently contains two tables:

```text
customers
    │
    │ 1
    │
    │ many
    ▼
orders
```

### `customers`

Stores basic customer information.

| Column          | Data Type      | Description     |
| --------------- | -------------- | --------------- |
| `customer_id`   | `INT`          | Primary key     |
| `customer_name` | `VARCHAR(100)` | Customer name   |
| `city`          | `VARCHAR(50)`  | Customer's city |

### `orders`

Stores customer order information.

| Column        | Data Type       | Description                         |
| ------------- | --------------- | ----------------------------------- |
| `order_id`    | `INT`           | Primary key                         |
| `customer_id` | `INT`           | Foreign key referencing `customers` |
| `order_date`  | `DATE`          | Date of the order                   |
| `amount`      | `DECIMAL(10,2)` | Order amount                        |

---

# 📊 Practice Dataset

The database contains:

- **25 customers**
- **60 orders**
- Orders distributed across multiple customers
- Multiple orders per customer
- Different order values
- Repeated order amounts
- Orders across January, February, and March 2026

The dataset is intentionally structured to support analytical SQL problems involving:

- Customer-level calculations
- Ranking
- Running totals
- Previous/next row comparisons
- Top-N analysis
- Monthly analysis
- Customer spending analysis

---

# 📁 Project Structure

```text
cte_windows-functions-beginner__mid-level/
│
├── 00_schema__data_insertion.sql
├── 01_level_beginner.sql
└── README.md
```

### `00_schema__data_insertion.sql`

Contains:

1. Database creation
2. Table creation
3. Customer data insertion
4. Order data insertion
5. Basic data verification queries
6. Basic aggregation checks
7. Initial Window Function demonstration

### `01_level_beginner.sql`

Contains the solutions for the **Beginner-level CTE & Window Function practice questions**.

#### Completed

- ✅ Question 01 — First CTE
- ✅ Question 02 — CTE + Filtering
- ✅ Question 03 — `ROW_NUMBER()`
- ✅ Question 04 — `ROW_NUMBER()` Without `PARTITION BY`
- ✅ Question 05 — `RANK()`
- ✅ Question 06 — Customer Total Using Window Function
- ✅ Question 07 — Customer Average Order Value
- ✅ Question 08 — Running Total
- ✅ Question 09 — Previous Order Amount
- ✅ Question 10 — First Order Per Customer

#### Currently working on

- 🚧 Mid-Level Questions 11–20

---

# 🔎 Current Progress

## Phase 1 — Database & Dataset Setup ✅

- [x] Create database
- [x] Create `customers` table
- [x] Create `orders` table
- [x] Create primary keys
- [x] Create foreign key relationship
- [x] Insert 25 customers
- [x] Insert 60 orders
- [x] Verify inserted data

## Phase 2 — Basic SQL Validation ✅

- [x] Count customers
- [x] Count orders
- [x] Calculate total sales
- [x] Analyze orders by month
- [x] Calculate total spending by customer
- [x] Compare `GROUP BY` aggregation with Window Functions

## Phase 3 — CTE & Window Function Practice 🚧

### 🟢 Beginner

- [x] Question 01 — First CTE
- [x] Question 02 — CTE + Filtering
- [x] Question 03 — `ROW_NUMBER()`
- [x] Question 04 — `ROW_NUMBER()` Without `PARTITION BY`
- [x] Question 05 — `RANK()`
- [x] Question 06 — Customer Total Using Window Function
- [x] Question 07 — Customer Average Order Value
- [x] Question 08 — Running Total
- [x] Question 09 — Previous Order Amount
- [x] Question 10 — First Order Per Customer

### 🟡 Mid-Level

- [ ] Question 11 — Highest Order Per Customer
- [ ] Question 12 — Second Highest Order Per Customer
- [ ] Question 13 — Customers With Above-Average Orders
- [ ] Question 14 — Order Difference From Previous Order
- [ ] Question 15 — Top 2 Orders Per Customer
- [ ] Question 16 — Running Percentage of Customer Spending
- [ ] Question 17 — Compare Each Order With Previous Order
- [ ] Question 18 — Latest Order vs Largest Order
- [ ] Question 19 — Monthly Sales + Month-over-Month Change
- [ ] Question 20 — Customer Ranking + Top Customers

---

# 🧩 Planned Practice Levels

## 🟢 Level 1 — Beginner

The first 10 problems focus on developing the fundamental mental models for CTEs and Window Functions.

Topics include:

- Basic CTE creation
- CTE filtering
- `ROW_NUMBER()`
- `PARTITION BY`
- `RANK()`
- Windowed `SUM()`
- Windowed `AVG()`
- Running totals
- `LAG()`
- First-row-per-group problems

### Progress

**10 / 10 completed — 100%**

---

## 🟡 Level 2 — Mid-Level

The next 10 problems combine multiple concepts and require more analytical thinking.

Topics include:

- Highest order per customer
- Second-highest order
- Above-average orders
- Previous-order comparisons
- Top 2 orders per customer
- Running percentage of spending
- Percentage change
- Latest vs. largest order
- Month-over-month analysis
- Customer ranking

### Progress

**0 / 10 completed — 0%**

---

# 🧠 Key Concepts

## CTE

A **Common Table Expression** creates a temporary named result that can be referenced by the query that follows.

Example from Question 01:

```sql
WITH customer_orders AS (
    SELECT
        customer_id,
        order_id,
        amount
    FROM orders
)
SELECT *
FROM customer_orders;
```

### Question 01 — What Was Practiced?

The first exercise focuses on understanding the basic structure:

```text
WITH
    CTE_Name AS (
        SELECT ...
    )
SELECT ...
FROM CTE_Name;
```

The CTE creates an intermediate result named `customer_orders`, which can then be queried by the main `SELECT` statement.

### Question 02 — What Was Practiced?

Question 02 focuses on using a CTE to create a **filtered intermediate result**.

The selected approach was:

```sql
WITH orders_more_than_800 AS (
    SELECT *
    FROM orders
    WHERE amount > 800
)
SELECT *
FROM orders_more_than_800;
```

The key mental model is:

```text
What should my intermediate result represent?
                    ↓
Orders where amount > 800
                    ↓
Create that result with a CTE
                    ↓
Query the CTE
```

The exercise also demonstrates that filtering can technically be placed outside the CTE, but when the purpose of the CTE is specifically to represent the filtered dataset, placing the `WHERE` condition inside the CTE makes the intermediate result clearer.

### Question 03 — What Was Practiced?

Question 03 focuses on using `ROW_NUMBER()` to number each customer's orders based on `order_date`.

The solution uses:

```sql
ROW_NUMBER() OVER(
    PARTITION BY c.customer_id
    ORDER BY o.order_date, o.order_id
) AS order_by_date
```

The key mental model is:

```text
PARTITION BY
        ↓
"Start numbering again for each customer"

ORDER BY
        ↓
"Decide the order in which each customer's rows are numbered"
```

This produces numbering such as:

```text
Customer 1
Order 101 → 1
Order 102 → 2
Order 105 → 3

Customer 2
Order 103 → 1
Order 106 → 2
```

The important distinction is that `PARTITION BY` determines **when the numbering restarts**, while `ORDER BY` determines **how the rows are ordered before numbering**.

If two orders for the same customer have the same `order_date`, adding `order_id` as a second ordering column can be used as a tie-breaker for deterministic numbering.

### Question 04 — What Was Practiced?

Question 04 focuses on using `ROW_NUMBER()` **without `PARTITION BY`**.

The solution uses:

```sql
ROW_NUMBER() OVER (
    ORDER BY order_date
) AS row_num
```

The key mental model is:

```text
No PARTITION BY
        ↓
Treat all orders as one group
        ↓
Number every order continuously
        ↓
1, 2, 3, 4, ... 60
```

Unlike Question 03, the numbering does **not restart for each customer**.

### Question 03 vs Question 04

```text
Question 03
PARTITION BY customer_id
        ↓
Numbering restarts for each customer

Customer 1 → 1, 2, 3
Customer 2 → 1, 2
Customer 3 → 1, 2, 3


Question 04
No PARTITION BY
        ↓
One continuous sequence across all customers

All customers → 1, 2, 3, 4, 5, ... 60
```

The important lesson is that `PARTITION BY` controls **whether the window calculation restarts for each group**.

Question 04 also reinforces the difference between the `ORDER BY` inside `OVER()` and the final `ORDER BY`:

- `ORDER BY` inside `OVER()` determines how `ROW_NUMBER()` assigns numbers.
- The final `ORDER BY` determines how the query results are displayed.

The final query was:

```sql
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
```

### Question 05 — What Was Practiced?

Question 05 focuses on ranking each customer's orders by amount, from highest to lowest, using `RANK()`.

The solution uses:

```sql
RANK() OVER (
    PARTITION BY c.customer_id
    ORDER BY o.amount DESC
) AS amount_rank
```

- `PARTITION BY c.customer_id` starts the ranking separately for each customer.
- `ORDER BY o.amount DESC` ranks the highest order amount first.
- `RANK()` assigns the same rank to tied amounts and skips subsequent rank positions when a tie occurs.

For example, amounts `800, 500, 500, 300` receive ranks `1, 2, 2, 4`.

### `ROW_NUMBER()` vs `RANK()` vs `DENSE_RANK()`

| Amount | `ROW_NUMBER()` | `RANK()` | `DENSE_RANK()` |
| -----: | -------------: | -------: | -------------: |
|    800 |              1 |        1 |              1 |
|    500 |              2 |        2 |              2 |
|    500 |              3 |        2 |              2 |
|    300 |              4 |        4 |              3 |

- `ROW_NUMBER()` gives each row a unique number.
- `RANK()` assigns equal ranks to ties and leaves gaps after ties.
- `DENSE_RANK()` assigns equal ranks to ties without leaving gaps.

### Question 06 — What Was Practiced?

Question 06 focuses on showing every order alongside the total spending for that customer's orders, without using `GROUP BY`.

The solution uses:

```sql
SUM(o.amount) OVER (
    PARTITION BY c.customer_id
) AS customer_total
```

The key mental model is:

```text
PARTITION BY customer_id
        ↓
Calculate a total for each customer
        ↓
Keep every individual order row
        ↓
Repeat that customer's total on each of their orders
```

Unlike `GROUP BY`, which normally returns one row per customer when grouping by customer, the windowed `SUM()` preserves the individual order rows while displaying the customer-level total on each row.

Question 06 also establishes the distinction between a customer total and a running total:

- `SUM(amount) OVER (PARTITION BY customer_id)` calculates the full total for each customer.
- Adding `ORDER BY order_date` inside `OVER()` changes the calculation to a running total, ordered by date.

### Question 07 — What Was Practiced?

Question 07 focuses on calculating each customer's **average order amount** while keeping every individual order visible.

The solution uses:

```sql
AVG(o.amount) OVER (
    PARTITION BY c.customer_id
) AS avg_customer_order_amount
```

The query also casts both `amount` and the calculated average to `DECIMAL(13, 2)` so that the displayed values use two decimal places.

The key mental model is:

```text
PARTITION BY customer_id
        ↓
Calculate the average for each customer
        ↓
Keep every individual order row
        ↓
Repeat that customer's average on each of their orders
```

Unlike a grouped `AVG()` query, the windowed `AVG()` does not collapse the result into one row per customer. It preserves each order and displays the customer's average alongside it.

### Question 08 — What Was Practiced?

Question 08 focuses on calculating each customer's **cumulative spending over time** using a running total.

The solution uses:

```sql
SUM(o.amount) OVER (
    PARTITION BY c.customer_id
    ORDER BY o.order_date, o.order_id
    ROWS BETWEEN UNBOUNDED PRECEDING
             AND CURRENT ROW
) AS cumulative_spending
```

- `PARTITION BY c.customer_id` restarts the running total for each customer.
- `ORDER BY o.order_date, o.order_id` processes each customer's orders chronologically, using `order_id` as a tie-breaker when order dates match.
- `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW` includes every row from the customer's first order through the current order.

The key mental model is:

```text
Start with the customer's first order
        ↓
Add the current order amount
        ↓
Carry the accumulated total forward
        ↓
Restart when the next customer begins
```

The windowed `SUM()` preserves every individual order while displaying the cumulative spending at each point in the customer's order history.

### Question 09 — What Was Practiced?

Question 09 focuses on retrieving each customer's **previous order amount** using `LAG()`.

The solution uses:

```sql
LAG(amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date, order_id
) AS previous_amount
```

- `LAG(amount)` retrieves the amount from the preceding row in the window.
- `PARTITION BY customer_id` keeps each customer's order history separate.
- `ORDER BY order_date, order_id` defines the chronological sequence and uses `order_id` as a tie-breaker.
- The first order for each customer returns `NULL` because no previous order exists.

The key mental model is:

```text
Separate orders by customer
        ↓
Arrange each customer's orders chronologically
        ↓
Look back one row
        ↓
Return the previous order amount
```

Unlike `GROUP BY`, which aggregates rows into grouped results, `LAG()` preserves every order row and retrieves a value from the preceding row. This makes it useful for comparing transactions across time.

### Question 10 — What Was Practiced?

Question 10 combines a **CTE with `ROW_NUMBER()`** to return only the first order for each customer.

The CTE assigns a row number to each customer's orders:

```sql
WITH ranked_orders AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date ASC, order_id ASC
        ) AS rn
    FROM orders
)
SELECT
    customer_id,
    order_id,
    order_date
FROM ranked_orders
WHERE rn = 1;
```

- `PARTITION BY customer_id` restarts row numbering for each customer.
- `ORDER BY order_date ASC, order_id ASC` places the earliest order first and provides a tie-breaker.
- `ROW_NUMBER()` assigns `1` to the first order in each customer's sequence.
- The outer query filters the CTE using `WHERE rn = 1`.

The key mental model is:

```text
Step 1: Number each customer's orders
        ↓
Step 2: Store the numbered rows in a CTE
        ↓
Step 3: Keep only rows where rn = 1
        ↓
Return the first order for every customer
```

The CTE is needed because the window-function result is calculated in the query's `SELECT` phase and cannot be filtered directly in that same query's `WHERE` clause. The outer query can filter the `rn` value produced by the CTE.

This is a reusable **first-row-per-group** pattern, useful for identifying each customer's first purchase, a user's first login, or an account's earliest transaction.

---

## Window Functions

Window Functions perform calculations across related rows **without collapsing the result set**.

Example:

```sql
SELECT
    customer_id,
    order_id,
    amount,
    SUM(amount) OVER (
        PARTITION BY customer_id
    ) AS total_spending
FROM orders;
```

This allows the individual orders to remain visible while calculating the customer's total spending.

---

# 📚 Learning Strategy

The problems are intentionally designed to become progressively harder.

For each problem, the preferred approach is:

```text
1. Understand the business requirement
            ↓
2. Describe the solution in plain English
            ↓
3. Break the problem into logical steps
            ↓
4. Identify whether GROUP BY, CTE, Window Function,
   or a combination is required
            ↓
5. Write the SQL
            ↓
6. Test the result
            ↓
7. Review and improve the query
```

The primary goal is **not memorizing SQL syntax**.

The goal is to recognize patterns such as:

```text
"Number rows within each customer"
        ↓
ROW_NUMBER()

"Compare with previous row"
        ↓
LAG()

"Calculate total but keep individual rows"
        ↓
Windowed SUM()

"Find Top N within each group"
        ↓
ROW_NUMBER() + CTE

"Calculate something first, then filter it"
        ↓
CTE + Window Function

"Aggregate first, then rank"
        ↓
CTE + Window Function
```

---

# 🛠️ Technologies

- **Microsoft SQL Server**
- **T-SQL**
- SQL Server Management Studio (SSMS)
- Git
- GitHub

---

# 📈 Project Progress

| Phase                     | Status         |
| ------------------------- | -------------- |
| Database Setup            | ✅ Complete    |
| Schema Creation           | ✅ Complete    |
| Data Insertion            | ✅ Complete    |
| Data Verification         | ✅ Complete    |
| Basic Aggregation         | ✅ Complete    |
| Beginner Question 01      | ✅ Complete    |
| Beginner Question 02      | ✅ Complete    |
| Beginner Question 03      | ✅ Complete    |
| Beginner Question 04      | ✅ Complete    |
| Beginner Question 05      | ✅ Complete    |
| Beginner Question 06      | ✅ Complete    |
| Beginner Question 07      | ✅ Complete    |
| Beginner Question 08      | ✅ Complete    |
| Beginner Question 09      | ✅ Complete    |
| Beginner Question 10      | ✅ Complete    |
| Mid-Level Questions 11–20 | 🚧 Not Started |

---

# 💡 Skills Demonstrated

By completing this project, the following SQL skills will be demonstrated:

- SQL querying
- Data aggregation
- Common Table Expressions
- Window Functions
- Analytical SQL
- Ranking
- Row comparison
- Running calculations
- Group-level analysis
- Time-based analysis
- Multi-step query design
- T-SQL problem solving

---

## 📌 Current Status

**Database & Data Setup: COMPLETE ✅**

**Beginner Questions 01–10: COMPLETE ✅**

**CTE & Window Function Practice: IN PROGRESS 🚧**

> Next step: Begin **Question 11 — Highest Order Per Customer**.
