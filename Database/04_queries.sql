USE advanced_banking_management_system;
-- Query 1: Display all customers
SELECT *
FROM customer;
-- Query 2: Display customer names and cities
SELECT first_name, last_name, city
FROM customer;
-- Query 3: Find customers from Hyderabad
SELECT first_name, last_name, city
FROM customer
WHERE city = 'Hyderabad';
-- Query 4: Display unique customer cities
SELECT DISTINCT city
FROM customer;
-- Query 5: Sort customer by first name
SELECT customer_id, first_name, last_name, city
FROM customer
ORDER BY first_name ASC;
-- Query 6: Display first 5 customers
SELECT customer_id, first_name, last_name, city
FROM customer
LIMIT 5;
-- Query 7: Find customers whose first name starts with A
SELECT customer_id, first_name, last_name
FROM customer
WHERE first_name LIKE 'A%';
-- Query 8: Find accounts with balance between 50000 and 100000
SELECT account_id, account_number, account_type, balance
FROM accounts
WHERE balance BETWEEN 50000 AND 100000;
-- Query 9: Find customers from Hyderabad or Warangal
SELECT customer_id, first_name, last_name, city
FROM customer
WHERE city IN ('Hyderabad', 'Warangal');
-- Query 10: Find customers outside Hyderabad
SELECT customer_id, first_name, last_name, city
FROM customer
WHERE city NOT IN ('Hyderabad');
-- Query 11: Find branches without a manager name
SELECT branch_id, branch_name, manager_name
FROM branches
WHERE manager_name IS NULL;
-- Query 12: Find branches with a manager name
SELECT branch_id, branch_name, manager_name
FROM branches
WHERE manager_name IS NOT NULL;
-- Query 13: Active savings accounts with balance above 50000
SELECT account_id, account_number, account_type, balance, status
FROM accounts
WHERE account_type = 'SAVINGS'
  AND balance > 50000;
-- Query 14: Find savings or current accounts
SELECT account_id, account_number, account_type, balance
FROM accounts
WHERE account_type = 'SAVINGS'
   OR account_type = 'CURRENT';
-- Query 15: Find accounts that are not closed
SELECT account_id, account_number, account_type, balance, status
FROM accounts
WHERE NOT status = 'CLOSED';
-- Query 16: Count total customers
SELECT COUNT(*) AS total_customers
FROM customer;
-- Query 17: Count active accounts
SELECT COUNT(*) AS active_accounts
FROM accounts
WHERE status = 'ACTIVE';
-- Query 18: Calculate total account balance
SELECT SUM(balance) AS total_bank_balance
FROM accounts;
-- Query 19: Calculate average account balance
SELECT AVG(balance) AS average_account_balance
FROM accounts;
-- Query 20: Find minimum and maximum account balance
SELECT
    MIN(balance) AS minimum_balance,
    MAX(balance) AS maximum_balance
FROM accounts;
-- Query 21: Number of accounts by account type
SELECT
    account_type,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type;
-- Query 22: Total balance by account type
SELECT
    account_type,
    SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;
-- Query 23: Average balance by account type
SELECT
    account_type,
    AVG(balance) AS average_balance
FROM accounts
GROUP BY account_type;
-- Query 24: Number of customers in each city
SELECT
    city,
    COUNT(*) AS total_customers
FROM customer
GROUP BY city;
-- Query 25: Account types with total balance above 500000
SELECT
    account_type,
    SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type
HAVING SUM(balance) > 500000;
-- Query 26: Display customers and their accounts
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.account_type,
    a.balance
FROM customer c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id;
-- Query 27: Customer account and branch details
SELECT
    c.first_name,
    c.last_name,
    a.account_number,
    a.account_type,
    a.balance,
    b.branch_name,
    b.city
FROM customer c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN branches b
    ON a.branch_id = b.branch_id;    
-- Query 28: Display all customers and their accounts
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.account_type
FROM customer c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id;
-- Query 29: Display employees and their branches
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.job_title,
    b.branch_name,
    b.city
FROM employees e
INNER JOIN branches b
    ON e.branch_id = b.branch_id;
-- Query 30: Customer transaction details
SELECT
    c.first_name,
    c.last_name,
    a.account_number,
    t.transaction_type,
    t.amount,
    t.transaction_date,
    t.description
FROM customer c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id;    
-- Query 31: Display all branches and their employees
SELECT
    b.branch_id,
    b.branch_name,
    e.employee_id,
    e.first_name,
    e.last_name,
    e.job_title
FROM employees e
RIGHT JOIN branches b
    ON e.branch_id = b.branch_id;
-- Query 32: Accounts with balance above average
SELECT
    account_id,
    account_number,
    account_type,
    balance
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
);
-- Query 33: Account with the highest balance
SELECT
    account_id,
    account_number,
    account_type,
    balance
FROM accounts
WHERE balance = (
    SELECT MAX(balance)
    FROM accounts
);
-- Query 34: Customers who have loans
SELECT
    customer_id,
    first_name,
    last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM loans
);
-- Query 35: Accounts above the average balance of their account type
SELECT
    a.account_id,
    a.account_number,
    a.account_type,
    a.balance
FROM accounts a
WHERE a.balance > (
    SELECT AVG(a2.balance)
    FROM accounts a2
    WHERE a2.account_type = a.account_type
);
-- Query 36: Customers who have at least one loan
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer c
WHERE EXISTS (
    SELECT 1
    FROM loans l
    WHERE l.customer_id = c.customer_id
);
-- Query 37: Customers without a loan
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM loans l
    WHERE l.customer_id = c.customer_id
);
-- Query 38: Classify accounts based on balance
SELECT
    account_number,
    balance,
    CASE
        WHEN balance >= 100000 THEN 'High Balance'
        WHEN balance >= 50000 THEN 'Medium Balance'
        ELSE 'Low Balance'
    END AS balance_category
FROM accounts;
-- Query 39: Display customer email with fallback value
SELECT
    customer_id,
    first_name,
    last_name,
    COALESCE(email, 'Not Provided') AS email
FROM customer;
-- Query 40: Combine customer and employee names
SELECT
    first_name,
    last_name,
    'Customer' AS person_type
FROM customer

UNION

SELECT
    first_name,
    last_name,
    'Employee' AS person_type
FROM employees;
-- Query 41: LIMIT with OFFSET
SELECT
    account_id,
    account_number,
    account_type,
    balance
FROM accounts
ORDER BY balance DESC
LIMIT 5 OFFSET 5;

