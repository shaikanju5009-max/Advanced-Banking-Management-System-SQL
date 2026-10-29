-- Procedure 1: Get customer account details

DELIMITER //

CREATE PROCEDURE get_customer_accounts(IN p_customer_id INT)
BEGIN
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        a.account_number,
        a.account_type,
        a.balance,
        a.status,
        b.branch_name
    FROM customer c
    INNER JOIN accounts a
        ON c.customer_id = a.customer_id
    INNER JOIN branches b
        ON a.branch_id = b.branch_id
    WHERE c.customer_id = p_customer_id;
END //

DELIMITER ;
CALL get_customer_accounts(1);
-- Procedure 2: Get account transaction history

DELIMITER //

CREATE PROCEDURE get_transaction_history(IN p_account_id INT)
BEGIN
    SELECT
        transaction_id,
        transaction_type,
        amount,
        transaction_date,
        description,
        reference_number
    FROM transactions
    WHERE account_id = p_account_id
    ORDER BY transaction_date DESC;
END //

DELIMITER ;
CALL get_transaction_history(1);
-- Procedure 3: Get customer loan details
DELIMITER //

CREATE PROCEDURE get_customer_loans(IN p_customer_id INT)
BEGIN
    SELECT
        l.loan_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        l.loan_type,
        l.loan_amount,
        l.interest_rate,
        l.loan_term_months,
        l.start_date,
        l.status
    FROM loans AS l
    INNER JOIN customer AS c
        ON l.customer_id = c.customer_id
    WHERE l.customer_id = p_customer_id;
END //

DELIMITER ;
CALL get_customer_loans(1);