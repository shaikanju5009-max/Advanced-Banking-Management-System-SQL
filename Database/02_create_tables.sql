USE advanced_banking_management_system;
CREATE TABLE customer( 
customer_id INT PRIMARY KEY auto_increment,
first_name VARCHAR(50) NOT NULL,
last_name varchar(50) NOT NULL,
date_of_birth DATE NOT NULL,
gender ENUM('Male','Female','Other') NOT NULL,
phone varchar(15) UNIQUE NOT NULL,
email VARCHAR(100) UNIQUE,
address VARCHAR(225) NOT NULL,
city VARCHAR(50) NOT NULL,
registration_date DATE DEFAULT(current_date)
);
CREATE TABLE branches (
branch_id INT PRIMARY KEY auto_increment,
branch_name VARCHAR(100) NOT NULL,
branch_code VARCHAR(20) UNIQUE NOT NULL,
address VARCHAR(255) NOT NULL,
city VARCHAR(50) NOT NULL,
state varchar(50) NOT NULL,
phone VARCHAR(15) UNIQUE,
manager_name varchar(100),
opening_date DATE NOT NULL
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE NOT NULL,
    salary DECIMAL(12,2) NOT NULL,
    branch_id INT NOT NULL,
    
    CONSTRAINT fk_employee_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
);
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    account_type ENUM('SAVINGS', 'CURRENT') NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0,
    opening_date DATE NOT NULL,
    status ENUM('ACTIVE', 'INACTIVE', 'CLOSED') NOT NULL DEFAULT 'ACTIVE',

    CONSTRAINT fk_account_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id),

    CONSTRAINT fk_account_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
);
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    transaction_type ENUM('DEPOSIT', 'WITHDRAWAL', 'TRANSFER', 'INTEREST') NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    transaction_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255),
    reference_number VARCHAR(30) UNIQUE NOT NULL,

    CONSTRAINT fk_transaction_account
        FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);
CREATE TABLE loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    loan_type ENUM('HOME', 'PERSONAL', 'EDUCATION', 'VEHICLE', 'BUSINESS') NOT NULL,
    loan_amount DECIMAL(15,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    loan_term_months INT NOT NULL,
    start_date DATE NOT NULL,
    status ENUM('ACTIVE', 'CLOSED', 'DEFAULTED') NOT NULL DEFAULT 'ACTIVE',

    CONSTRAINT fk_loan_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id),

    CONSTRAINT fk_loan_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);
CREATE TABLE loan_payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    loan_id INT NOT NULL,
    payment_amount DECIMAL(15,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method ENUM('CASH', 'CARD', 'ONLINE', 'CHEQUE') NOT NULL,
    payment_status ENUM('PENDING', 'COMPLETED', 'FAILED') NOT NULL DEFAULT 'COMPLETED',
    reference_number VARCHAR(30) UNIQUE NOT NULL,

    CONSTRAINT fk_payment_loan
        FOREIGN KEY (loan_id)
        REFERENCES loans(loan_id)
);