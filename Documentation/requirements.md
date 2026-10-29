# Requirements

## Project Title

Advanced Banking Management System Using SQL

## 1. Project Objective

The objective of this project is to design and implement a structured banking management database using MySQL.

The system manages customers, branches, employees, bank accounts, transactions, loans, and loan payments.

The project demonstrates database design, relationships, constraints, SQL queries, views, stored procedures, functions, triggers, indexes, and transaction management.

## 2. Target Users

The main users of the system are:

- Bank administrators
- Bank employees
- Bank managers

## 3. Main Modules

### Customer Management

The system stores and manages:

- Customer personal details
- Contact information
- Address information
- Registration details

### Branch Management

The system stores:

- Branch details
- Branch code
- Address
- City and state
- Contact information
- Manager information

### Employee Management

The system manages:

- Employee details
- Job titles
- Contact information
- Hire dates
- Salary
- Branch assignment

### Account Management

The system manages:

- Customer accounts
- Account numbers
- Account types
- Account balances
- Account opening dates
- Account status
- Branch assignment

### Transaction Management

The system records:

- Deposits
- Withdrawals
- Transfers
- Interest transactions
- Transaction amounts
- Transaction dates
- Transaction descriptions
- Transaction reference numbers

### Loan Management

The system manages:

- Customer loans
- Loan types
- Loan amounts
- Interest rates
- Loan terms
- Loan start dates
- Loan status
- Employee handling the loan

### Loan Payment Management

The system records:

- Loan payments
- Payment amounts
- Payment dates
- Payment methods
- Payment status
- Payment reference numbers

## 4. Functional Requirements

The database system should be able to:

1. Store customer information.
2. Store and manage bank branch information.
3. Store employee information and branch assignments.
4. Create and manage customer accounts.
5. Record account transactions.
6. Manage customer loans.
7. Record loan payments.
8. Maintain relationships between related tables.
9. Prevent duplicate values using UNIQUE constraints.
10. Maintain required values using NOT NULL constraints.
11. Validate data using CHECK constraints.
12. Provide useful reports using SQL queries.
13. Provide summarized information using views.
14. Execute reusable operations using stored procedures.
15. Perform calculations using stored functions.
16. Automatically enforce business rules using triggers.
17. Improve query performance using indexes.
18. Support COMMIT, ROLLBACK, and SAVEPOINT for transaction management.

## 5. Non-Functional Requirements

### Data Integrity

Primary keys and foreign keys should maintain relationships and prevent invalid references.

### Data Consistency

Constraints and triggers should help prevent invalid or inconsistent data.

### Performance

Indexes should be created on frequently searched and joined columns.

### Security

The database should use appropriate constraints and controlled database operations to protect data integrity.

### Scalability

The normalized database structure should allow additional customers, accounts, transactions, employees, branches, and loans to be added without redesigning the entire system.

## 6. System Workflow

The basic workflow of the banking system is:

Customer
→ Account
→ Transaction

Customer
→ Loan
→ Loan Payment

Branch
→ Employee

Branch
→ Account

Employee
→ Loan

## 7. Technology Requirements

- MySQL 8.0 or later
- MySQL Workbench
- Windows operating system
- SQL
- Markdown for project documentation

## 8. Expected Outcome

The final system should provide a complete relational database for managing major banking operations.

It should demonstrate practical use of MySQL database concepts including:

- Relational database design
- Normalization
- Primary and foreign keys
- Constraints
- SQL queries
- Joins
- Subqueries
- Aggregations
- Views
- Stored procedures
- Stored functions
- Triggers
- Indexes
- Transactions