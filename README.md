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

#### Currently working on

- 🚧 Questions 02–10

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
- [ ] Question 02 — CTE + Filtering
- [ ] Question 03 — `ROW_NUMBER()`
- [ ] Question 04 — `ROW_NUMBER()` Without `PARTITION BY`
- [ ] Question 05 — `RANK()`
- [ ] Question 06 — Customer Total Using Window Function
- [ ] Question 07 — Customer Average Order Value
- [ ] Question 08 — Running Total
- [ ] Question 09 — Previous Order Amount
- [ ] Question 10 — First Order Per Customer

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

**1 / 10 completed — 10%**

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
| Beginner Questions 02–10  | 🚧 In Progress |
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

**Beginner Question 01: COMPLETE ✅**

**CTE & Window Function Practice: IN PROGRESS 🚧**

> Next step: Complete **Question 02 — CTE + Filtering**.
