USE advanced_banking_management_system;
-- tigger1:
DELIMITER //

CREATE TRIGGER before_transaction_insert
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    IF NEW.transaction_date IS NULL THEN
        SET NEW.transaction_date = CURRENT_TIMESTAMP;
    END IF;
END //

DELIMITER ;
INSERT INTO transactions
(
    account_id,
    transaction_type,
    amount,
    description,
    reference_number
)
VALUES
(
    1,
    'DEPOSIT',
    5000.00,
    'Test deposit',
    'TXNTEST001'
);
SELECT *
FROM transactions
WHERE reference_number = 'TXNTEST001';
-- tigger2:
DELIMITER //

CREATE TRIGGER before_transaction_amount_insert
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Transaction amount must be greater than zero';
    END IF;
END //

DELIMITER ;
INSERT INTO transactions
(
    account_id,
    transaction_type,
    amount,
    description,
    reference_number
)
VALUES
(
    1,
    'DEPOSIT',
    -1000.00,
    'Invalid transaction test',
    'TXNTEST002'
);
-- tigger3:
DELIMITER //

CREATE TRIGGER after_transaction_insert
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    IF NEW.transaction_type = 'DEPOSIT' THEN
        UPDATE accounts
        SET balance = balance + NEW.amount
        WHERE account_id = NEW.account_id;

    ELSEIF NEW.transaction_type = 'WITHDRAWAL' THEN
        UPDATE accounts
        SET balance = balance - NEW.amount
        WHERE account_id = NEW.account_id;
    END IF;
END //

DELIMITER ;
SELECT account_id, account_number, balance
FROM accounts
WHERE account_id = 1;
INSERT INTO transactions
(
    account_id,
    transaction_type,
    amount,
    description,
    reference_number
)
VALUES
(
    1,
    'DEPOSIT',
    2000.00,
    'Trigger balance test',
    'TXNTEST003'
);
SELECT account_id, account_number, balance
FROM accounts
WHERE account_id = 1;
-- Trigger 4:
DELIMITER //

CREATE TRIGGER before_withdrawal_insert
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE current_balance DECIMAL(15,2);

    IF NEW.transaction_type = 'WITHDRAWAL' THEN

        SELECT balance
        INTO current_balance
        FROM accounts
        WHERE account_id = NEW.account_id;

        IF NEW.amount > current_balance THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient account balance for withdrawal';
        END IF;

    END IF;
END //

DELIMITER ;
INSERT INTO transactions
(
    account_id,
    transaction_type,
    amount,
    description,
    reference_number
)
VALUES
(
    1,
    'WITHDRAWAL',
    999999999.00,
    'Overdraft test',
    'TXNTEST004'
);
-- Trigger 5:
DELIMITER //

CREATE TRIGGER before_loan_payment_insert
BEFORE INSERT ON loan_payments
FOR EACH ROW
BEGIN
    DECLARE loan_amount_value DECIMAL(15,2);
    DECLARE total_paid DECIMAL(15,2);

    SELECT loan_amount
    INTO loan_amount_value
    FROM loans
    WHERE loan_id = NEW.loan_id;

    SELECT COALESCE(SUM(payment_amount), 0)
    INTO total_paid
    FROM loan_payments
    WHERE loan_id = NEW.loan_id
      AND payment_status = 'COMPLETED';

    IF total_paid + NEW.payment_amount > loan_amount_value THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Loan payment exceeds remaining loan amount';
    END IF;
END //

DELIMITER ;
SELECT loan_id, loan_amount
FROM loans
WHERE loan_id = 1;
SELECT COALESCE(SUM(payment_amount), 0) AS total_paid
FROM loan_payments
WHERE loan_id = 1
  AND payment_status = 'COMPLETED';