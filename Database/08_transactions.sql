USE advanced_banking_management_system;

START TRANSACTION;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 1;

SELECT account_id, account_number, balance
FROM accounts
WHERE account_id = 1;

ROLLBACK;

SELECT account_id, account_number, balance
FROM accounts
WHERE account_id = 1;
USE advanced_banking_management_system;

START TRANSACTION;

UPDATE accounts
SET balance = balance + 2000
WHERE account_id = 1;

SAVEPOINT deposit_savepoint;

UPDATE accounts
SET balance = balance + 3000
WHERE account_id = 1;

SELECT account_id, account_number, balance
FROM accounts
WHERE account_id = 1;

ROLLBACK TO SAVEPOINT deposit_savepoint;

SELECT account_id, account_number, balance
FROM accounts
WHERE account_id = 1;

ROLLBACK;
USE advanced_banking_management_system;

START TRANSACTION;

UPDATE accounts
SET balance = balance + 1500
WHERE account_id = 1;

COMMIT;

SELECT account_id, account_number, balance
FROM accounts
WHERE account_id = 1;