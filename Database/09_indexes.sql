USE advanced_banking_management_system;

-- Index for finding accounts by customer
CREATE INDEX idx_accounts_customer_id
ON accounts(customer_id);

-- Index for finding accounts by branch
CREATE INDEX idx_accounts_branch_id
ON accounts(branch_id);

-- Index for finding transactions by account
CREATE INDEX idx_transactions_account_id
ON transactions(account_id);

-- Index for finding transactions by date
CREATE INDEX idx_transactions_date
ON transactions(transaction_date);

-- Index for finding loans by customer
CREATE INDEX idx_loans_customer_id
ON loans(customer_id);

-- Index for finding loan payments by loan
CREATE INDEX idx_loan_payments_loan_id
ON loan_payments(loan_id);

-- Index for finding employees by branch
CREATE INDEX idx_employees_branch_id
ON employees(branch_id);
SHOW INDEX FROM accounts;
SHOW INDEX FROM transactions;