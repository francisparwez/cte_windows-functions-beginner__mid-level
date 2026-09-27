/* ============================================================
1. CREATE DATABASE
============================================================ */

CREATE DATABASE CTE_WindowFunctions_Practice;
GO

USE CTE_WindowFunctions_Practice;
GO

/* ============================================================
2. CREATE CUSTOMERS TABLE
============================================================ */

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);
GO

/* ============================================================
3. CREATE ORDERS TABLE
============================================================ */

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_orders_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);
GO

/* ============================================================
4. INSERT CUSTOMERS
============================================================ */

INSERT INTO
    customers (
        customer_id,
        customer_name,
        city
    )
VALUES (1, 'Ali Khan', 'Karachi'),
    (2, 'Sara Ahmed', 'Lahore'),
    (3, 'John Smith', 'Karachi'),
    (4, 'Ahmed Raza', 'Islamabad'),
    (5, 'Ayesha Malik', 'Lahore'),
    (6, 'Bilal Shah', 'Karachi'),
    (
        7,
        'Fatima Noor',
        'Rawalpindi'
    ),
    (
        8,
        'Usman Tariq',
        'Faisalabad'
    ),
    (9, 'Hassan Ali', 'Karachi'),
    (10, 'Zainab Iqbal', 'Multan'),
    (11, 'Hamza Saeed', 'Lahore'),
    (
        12,
        'Mariam Khan',
        'Islamabad'
    ),
    (13, 'Omar Farooq', 'Karachi'),
    (14, 'Sana Javed', 'Peshawar'),
    (15, 'Danish Akram', 'Lahore'),
    (16, 'Hira Aslam', 'Karachi'),
    (
        17,
        'Talha Butt',
        'Gujranwala'
    ),
    (
        18,
        'Mahnoor Sheikh',
        'Islamabad'
    ),
    (
        19,
        'Fahad Qureshi',
        'Karachi'
    ),
    (20, 'Iqra Hassan', 'Lahore'),
    (21, 'Saad Mahmood', 'Multan'),
    (22, 'Noor Fatima', 'Karachi'),
    (
        23,
        'Adnan Yousuf',
        'Rawalpindi'
    ),
    (
        24,
        'Laiba Tariq',
        'Faisalabad'
    ),
    (25, 'Waleed Ahmed', 'Karachi');
GO

/* ============================================================
5. INSERT ORDERS
============================================================ */

INSERT INTO
    orders (
        order_id,
        customer_id,
        order_date,
        amount
    )
VALUES

-- Customer 1
(1001, 1, '2026-01-05', 500),
(1002, 1, '2026-01-10', 800),
(1003, 1, '2026-02-01', 300),
(1004, 1, '2026-02-15', 1200),
(1005, 1, '2026-03-03', 700),

-- Customer 2
(1006, 2, '2026-01-08', 1200),
(1007, 2, '2026-01-20', 600),
(1008, 2, '2026-02-03', 900),
(1009, 2, '2026-03-10', 1500),

-- Customer 3
(1010, 3, '2026-01-12', 700),
(1011, 3, '2026-01-25', 700),
(1012, 3, '2026-02-10', 1500),
(1013, 3, '2026-03-15', 900),

-- Customer 4
(1014, 4, '2026-01-15', 400),
(1015, 4, '2026-02-12', 1000),
(1016, 4, '2026-03-05', 600),

-- Customer 5
(1017, 5, '2026-01-03', 300),
(1018, 5, '2026-01-18', 500),
(1019, 5, '2026-02-14', 800),
(1020, 5, '2026-03-20', 800),

-- Customer 6
(1021, 6, '2026-01-07', 1500),
(1022, 6, '2026-02-05', 700),
(1023, 6, '2026-02-25', 900),
(1024, 6, '2026-03-12', 1100),

-- Customer 7
(1025, 7, '2026-01-11', 450),
(1026, 7, '2026-02-08', 650),
(1027, 7, '2026-03-01', 850),

-- Customer 8
(1028, 8, '2026-01-14', 1000),
(1029, 8, '2026-01-28', 1200),
(1030, 8, '2026-02-18', 500),

-- Customer 9
(1031, 9, '2026-01-04', 250),
(1032, 9, '2026-02-06', 750),
(1033, 9, '2026-03-08', 1250),

-- Customer 10
(1034, 10, '2026-01-09', 600),
(1035, 10, '2026-02-11', 600),
(1036, 10, '2026-03-13', 1000),

-- Customer 11
(1037, 11, '2026-01-16', 900),
(1038, 11, '2026-02-16', 1100),
(1039, 11, '2026-03-16', 1300),

-- Customer 12
(1040, 12, '2026-01-06', 400),
(1041, 12, '2026-02-07', 700),
(1042, 12, '2026-03-17', 900),

-- Customer 13
(1043, 13, '2026-01-13', 800),
(1044, 13, '2026-01-27', 800),
(1045, 13, '2026-02-21', 1200),
(1046, 13, '2026-03-21', 1600),

-- Customer 14
(1047, 14, '2026-01-19', 350),
(1048, 14, '2026-02-19', 550),
(1049, 14, '2026-03-19', 750),

-- Customer 15
(1050, 15, '2026-01-21', 1000),
(1051, 15, '2026-02-22', 1400),
(1052, 15, '2026-03-22', 1800),

-- Customer 16
(1053, 16, '2026-01-23', 500),
(1054, 16, '2026-02-23', 500),
(1055, 16, '2026-03-23', 900),

-- Customer 17
(1056, 17, '2026-01-24', 750), (1057, 17, '2026-02-24', 1000),

-- Customer 18
(1058, 18, '2026-01-26', 650),
(1059, 18, '2026-02-26', 850),
(1060, 18, '2026-03-26', 1050);
GO

/* ============================================================
6. VERIFY THE DATA
============================================================ */

SELECT * FROM customers;

SELECT * FROM orders ORDER BY customer_id, order_date;

/* ============================================================
6. ORDERS THAT EACH CUSTOMER HAS
============================================================ */

SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY
    customer_id
ORDER BY customer_id;

/* ============================================================
7. TOTAL NUMBER OF CUSTOMERS
============================================================ */

SELECT COUNT(*) AS total_customers FROM customers;

/* ============================================================
8. TOTAL NUMBER OF ORDERS
============================================================ */

SELECT COUNT(*) AS total_orders FROM orders;

/* ============================================================
9. TOTAL SALES
============================================================ */
SELECT SUM(amount) AS total_sales FROM orders;

/* ============================================================
10. ORDERS BY MONTH
============================================================ */
SELECT
    MONTH(order_date) AS order_month,
    COUNT(*) AS order_count,
    SUM(amount) AS total_sales
FROM orders
GROUP BY
    MONTH(order_date)
ORDER BY order_month;

/* ============================================================
11. TOTAL SPENDING BY CUSTOMER
============================================================ */
SELECT customer_id, SUM(amount) AS total_spending
FROM orders
GROUP BY
    customer_id;

/* ============================================================
12. TOTAL SPENDING BY CUSTOMER WITH WINDOW FUNCTION
============================================================ */

SELECT
    customer_id,
    order_id,
    amount,
    SUM(amount) OVER (
        PARTITION BY
            customer_id
    ) AS total_spending
FROM orders;