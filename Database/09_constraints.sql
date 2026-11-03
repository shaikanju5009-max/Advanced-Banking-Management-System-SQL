USE advanced_banking_management_system;

ALTER TABLE accounts
ADD CONSTRAINT chk_account_balance
CHECK (balance >= 0);
SHOW CREATE TABLE accounts;
UPDATE accounts
SET balance = -500
WHERE account_id = 1;
ALTER TABLE loans
ADD CONSTRAINT chk_loan_amount
CHECK (loan_amount > 0);
SHOW CREATE TABLE loans;
UPDATE loans
SET loan_amount = -1000
WHERE loan_id = 1;
ALTER TABLE loans
ADD CONSTRAINT chk_loan_interest_rate
CHECK (interest_rate >= 0);
SHOW CREATE TABLE loans;
UPDATE loans
SET interest_rate = -5
WHERE loan_id = 1;
ALTER TABLE loans
ADD CONSTRAINT chk_loan_term
CHECK (loan_term_months > 0);
SHOW CREATE TABLE loans;
UPDATE loans
SET loan_term_months = 0
WHERE loan_id = 1;

