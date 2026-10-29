# Advanced Banking Management System Using SQL

## Project Overview

The Advanced Banking Management System Using SQL is a relational database project developed using MySQL.

The system manages major banking operations including customers, branches, employees, accounts, transactions, loans, and loan payments.

The project demonstrates practical implementation of SQL database concepts such as relationships, constraints, joins, subqueries, views, stored procedures, stored functions, triggers, indexes, and transaction management.

## Database

Database Name:

`advanced_banking_management_system`

Technology:

- MySQL 8.0+
- MySQL Workbench
- SQL

## Main Modules

- Customer Management
- Branch Management
- Employee Management
- Account Management
- Transaction Management
- Loan Management
- Loan Payment Management

## Database Tables

The system contains the following tables:

1. `customers`
2. `branches`
3. `employees`
4. `accounts`
5. `transactions`
6. `loans`
7. `loan_payments`

## SQL Features Implemented

### Basic SQL

- SELECT
- WHERE
- DISTINCT
- ORDER BY
- LIMIT
- LIKE
- BETWEEN
- IN
- NOT IN
- NULL checks
- AND / OR / NOT

### Aggregate Functions

- COUNT
- SUM
- AVG
- MIN
- MAX
- GROUP BY
- HAVING

### Advanced Queries

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- Subqueries
- Correlated subqueries
- EXISTS
- NOT EXISTS
- CASE
- COALESCE
- UNION
- UNION ALL

### Database Objects

- Views
- Stored Procedures
- Stored Functions
- Triggers
- Indexes

### Transaction Management

- START TRANSACTION
- COMMIT
- ROLLBACK
- SAVEPOINT

### Data Integrity

- Primary Keys
- Foreign Keys
- UNIQUE constraints
- NOT NULL constraints
- DEFAULT values
- CHECK constraints

## Project Folder Structure

```text
Advanced Banking Management System Using SQL
│
├── database
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_insert_data.sql
│   ├── 04_queries.sql
│   ├── 05_views.sql
│   ├── 06_procedures.sql
│   ├── 07_functions.sql
│   ├── 08_triggers.sql
│   ├── 09_indexes.sql
│   ├── 10_transactions.sql
│   └── 11_constraints.sql
│
├── documentation
│   ├── requirements.md
│   ├── database-design.md
│   └── er-diagram.md
│
└── README.md