-- View 1: Customer Account Summary

CREATE VIEW customer_account_summary AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_number,
    a.account_type,
    a.balance,
    a.status,
    b.branch_name,
    b.city
FROM customer c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN branches b
    ON a.branch_id = b.branch_id;
SELECT *
FROM customer_account_summary; 
-- View 2: Customer Transaction History

CREATE VIEW customer_transaction_history AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_number,
    t.transaction_type,
    t.amount,
    t.transaction_date,
    t.description,
    t.reference_number
FROM customer c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id;
SELECT *
FROM customer_transaction_history; 
-- View 3: Loan Payment Summary

CREATE VIEW loan_payment_summary AS
SELECT
    l.loan_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    l.loan_type,
    l.loan_amount,
    l.interest_rate,
    lp.payment_amount,
    lp.payment_date,
    lp.payment_method,
    lp.payment_status,
    lp.reference_number
FROM loans l
INNER JOIN customer c
    ON l.customer_id = c.customer_id
INNER JOIN loan_payments lp
    ON l.loan_id = lp.loan_id;   
SELECT *
FROM loan_payment_summary;    