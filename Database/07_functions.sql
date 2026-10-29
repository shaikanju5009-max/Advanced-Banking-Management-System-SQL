USE advanced_banking_management_system;
-- Function1:
DELIMITER //

CREATE FUNCTION get_total_loan_payments(p_loan_id INT)
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE total_paid DECIMAL(15,2);

    SELECT COALESCE(SUM(payment_amount), 0)
    INTO total_paid
    FROM loan_payments
    WHERE loan_id = p_loan_id
      AND payment_status = 'COMPLETED';

    RETURN total_paid;
END //

DELIMITER ;
SELECT get_total_loan_payments(1);
-- Function2:
DELIMITER //

CREATE FUNCTION get_customer_total_balance(p_customer_id INT)
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE total_balance DECIMAL(15,2);

    SELECT COALESCE(SUM(balance), 0)
    INTO total_balance
    FROM accounts
    WHERE customer_id = p_customer_id
      AND status = 'ACTIVE';

    RETURN total_balance;
END //

DELIMITER ;
SELECT get_customer_total_balance(1);
-- Function3:
DELIMITER //

CREATE FUNCTION get_account_transaction_count(p_account_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE transaction_count INT;

    SELECT COUNT(*)
    INTO transaction_count
    FROM transactions
    WHERE account_id = p_account_id;

    RETURN transaction_count;
END //

DELIMITER ;
SELECT get_account_transaction_count(1);