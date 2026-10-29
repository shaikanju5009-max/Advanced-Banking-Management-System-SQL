\# Advanced Banking Management System Using SQL



\## Database Design



\### 1. Customers Table



The `customers` table stores the personal and contact information of bank customers.



| Column            | Data Type                                  | Constraint                                       | Description                             |

| -----------------   | -----------------------------             | ---------------------------                     | ----------------------------            |

| customer\_id    | INT                                             | PRIMARY KEY, AUTO\_INCREMENT | Unique customer ID               |

| first\_name       | VARCHAR(50)                            | NOT NULL                                        | Customer's first name           |

| last\_name        | VARCHAR(50)                            | NOT NULL                                        | Customer's last name            |

| date\_of\_birth  | DATE                                          | NOT NULL                                        | Customer's date of birth        |

| gender             | ENUM('Male','Female','Other') | NOT NULL                                        | Customer's gender                 |

| phone              | VARCHAR(15)                             | UNIQUE, NOT NULL                         | Customer's contact number  |

| email               | VARCHAR(100)                            | UNIQUE                                           | Customer's email address      |

| address           | VARCHAR(255)                            | NOT NULL                                        | Customer's address                |

| city                  | VARCHAR(50)                              | NOT NULL                                        | Customer's city                       |

| registration\_date | DATE                                      | DEFAULT CURRENT\_DATE                | Date the customer registered|



\### Primary Key



`customer\_id` is the primary key of the `customers` table. It uniquely identifies each customer.



\### Constraints



\* `customer\_id` uses `AUTO\_INCREMENT` so a new ID is generated automatically.

\* `first\_name`, `last\_name`, `date\_of\_birth`, `gender`, `phone`, `address`, and `city` cannot be empty because they are `NOT NULL`.

\* `phone` must be unique for each customer.

\* `email` must be unique when provided.

\* `registration\_date` automatically uses the current date when a customer is registered.

\### 2. Branches Table



The `branches` table stores information about the different branches of the bank.



| Column              | Data Type          | Constraint                                      | Description                                           |

| ------------           | ------------           | ---------------------------                     | ----------------------------------                  |

| branch\_id          | INT                     | PRIMARY KEY, AUTO\_INCREMENT | Unique branch ID                                |

| branch\_name    | VARCHAR(100)  | NOT NULL                                        | Name of the bank branch                  |

| branch\_code     | VARCHAR(20)    | UNIQUE, NOT NULL                         | Unique code assigned to the branch |

| address              | VARCHAR(255)  | NOT NULL                                        | Branch address                                    |

| city                     | VARCHAR(50)    | NOT NULL                                        | Branch city                                           |

| state                   | VARCHAR(50)    | NOT NULL                                        | Branch state                                         |

| phone                | VARCHAR(15)    | UNIQUE                                            | Branch contact number                      |

| manager\_name | VARCHAR(100)  | —                                                      | Name of the branch manager            |

| opening\_date    | DATE                  | NOT NULL                                         | Date the branch was opened             |



\### Primary Key



`branch\_id` is the primary key of the `branches` table. It uniquely identifies each bank branch.



\### Constraints



\* `branch\_id` uses `AUTO\_INCREMENT` to generate a unique branch ID automatically.

\* `branch\_name`, `branch\_code`, `address`, `city`, `state`, and `opening\_date` cannot be empty because they are `NOT NULL`.

\* `branch\_code` must be unique for every branch.

\* `phone` is unique so that the same branch contact number is not assigned to multiple branches.

\* `manager\_name` is optional because a branch may temporarily have no manager assigned.



\### 3. Employees Table



The `employees` table stores information about the employees working in the bank and identifies the branch where each employee works.



| Column      | Data Type     | Constraint                  | Description                       |

| ----------- | ------------- | --------------------------- | --------------------------------- |

| employee\_id | INT           | PRIMARY KEY, AUTO\_INCREMENT | Unique employee ID                |

| first\_name  | VARCHAR(50)   | NOT NULL                    | Employee's first name             |

| last\_name   | VARCHAR(50)   | NOT NULL                    | Employee's last name              |

| job\_title   | VARCHAR(50)   | NOT NULL                    | Employee's job title or position  |

| phone       | VARCHAR(15)   | UNIQUE, NOT NULL            | Employee's contact number         |

| email       | VARCHAR(100)  | UNIQUE                      | Employee's email address          |

| hire\_date   | DATE          | NOT NULL                    | Date the employee joined the bank |

| salary      | DECIMAL(12,2) | NOT NULL                    | Employee's salary                 |

| branch\_id   | INT           | FOREIGN KEY, NOT NULL       | Branch where the employee works   |



\### Primary Key



`employee\_id` is the primary key of the `employees` table. It uniquely identifies each employee.



\### Foreign Key



`branch\_id` is a foreign key that references `branch\_id` in the `branches` table.



This creates a one-to-many relationship:



\*\*One branch can have many employees.\*\*



\### Constraints



\* `employee\_id` uses `AUTO\_INCREMENT` to generate a unique employee ID automatically.

\* `first\_name`, `last\_name`, `job\_title`, `phone`, `hire\_date`, `salary`, and `branch\_id` cannot be empty because they are `NOT NULL`.

\* `phone` must be unique for each employee.

\* `email` must be unique when provided.

\* `branch\_id` ensures that every employee is associated with an existing branch.

\* `salary` uses `DECIMAL(12,2)` to store monetary values accurately.



\### 4. Accounts Table



The `accounts` table stores the bank accounts maintained by customers. It connects each account with a customer and a bank branch.



| Column         | Data Type                          | Constraint                  | Description                            |

| -------------- | ---------------------------------- | --------------------------- | -------------------------------------- |

| account\_id     | INT                                | PRIMARY KEY, AUTO\_INCREMENT | Unique internal account ID             |

| customer\_id    | INT                                | FOREIGN KEY, NOT NULL       | Customer who owns the account          |

| branch\_id      | INT                                | FOREIGN KEY, NOT NULL       | Branch where the account is maintained |

| account\_number | VARCHAR(20)                        | UNIQUE, NOT NULL            | Unique bank account number             |

| account\_type   | ENUM('SAVINGS','CURRENT')          | NOT NULL                    | Type of bank account                   |

| balance        | DECIMAL(15,2)                      | NOT NULL, DEFAULT 0         | Current account balance                |

| opening\_date   | DATE                               | NOT NULL                    | Date the account was opened            |

| status         | ENUM('ACTIVE','INACTIVE','CLOSED') | NOT NULL, DEFAULT 'ACTIVE'  | Current status of the account          |



\### Primary Key



`account\_id` is the primary key of the `accounts` table. It uniquely identifies each account within the database.



\### Foreign Keys



`customer\_id` references `customer\_id` in the `customers` table.



`branch\_id` references `branch\_id` in the `branches` table.



Therefore:



\* One customer can have many accounts.

\* One branch can maintain many accounts.



\### Constraints



\* `account\_id` uses `AUTO\_INCREMENT` to generate a unique internal ID.

\* `account\_number` must be unique for every bank account.

\* `customer\_id` and `branch\_id` cannot be empty and must refer to existing records.

\* `balance` uses `DECIMAL(15,2)` to accurately store monetary values.

\* New accounts have a default balance of `0`.

\* `account\_type` allows `SAVINGS` or `CURRENT`.

\* `status` allows `ACTIVE`, `INACTIVE`, or `CLOSED`.

\* New accounts have a default status of `ACTIVE`.



\### 5. Transactions Table



The `transactions` table stores the financial transactions performed on bank accounts, such as deposits, withdrawals, transfers, and interest credits.



| Column           | Data Type                                          | Constraint                          | Description                         |

| ---------------- | -------------------------------------------------- | ----------------------------------- | ----------------------------------- |

| transaction\_id   | INT                                                | PRIMARY KEY, AUTO\_INCREMENT         | Unique transaction ID               |

| account\_id       | INT                                                | FOREIGN KEY, NOT NULL               | Account involved in the transaction |

| transaction\_type | ENUM('DEPOSIT','WITHDRAWAL','TRANSFER','INTEREST') | NOT NULL                            | Type of transaction                 |

| amount           | DECIMAL(15,2)                                      | NOT NULL                            | Amount involved in the transaction  |

| transaction\_date | DATETIME                                           | NOT NULL, DEFAULT CURRENT\_TIMESTAMP | Date and time of the transaction    |

| description      | VARCHAR(255)                                       | —                                   | Additional transaction details      |

| reference\_number | VARCHAR(30)                                        | UNIQUE, NOT NULL                    | Unique transaction reference number |



\### Primary Key



`transaction\_id` is the primary key of the `transactions` table. It uniquely identifies every transaction.



\### Foreign Key



`account\_id` references `account\_id` in the `accounts` table.



This creates a one-to-many relationship:



\*\*One account can have many transactions.\*\*



\### Constraints



\* `transaction\_id` uses `AUTO\_INCREMENT` to generate a unique transaction ID.

\* `account\_id` cannot be empty and must refer to an existing account.

\* `transaction\_type` identifies whether the transaction is a deposit, withdrawal, transfer, or interest credit.

\* `amount` uses `DECIMAL(15,2)` to accurately store monetary values.

\* `transaction\_date` automatically records the current date and time when a transaction is created.

\* `reference\_number` must be unique for every transaction.

\* `description` is optional and can contain additional information about the transaction.



\### 6. Loans Table



The `loans` table stores information about loans issued by the bank to customers.



| Column           | Data Type                                                | Constraint                  | Description                     |

| ---------------- | -------------------------------------------------------- | --------------------------- | ------------------------------- |

| loan\_id          | INT                                                      | PRIMARY KEY, AUTO\_INCREMENT | Unique loan ID                  |

| customer\_id      | INT                                                      | FOREIGN KEY, NOT NULL       | Customer who received the loan  |

| employee\_id      | INT                                                      | FOREIGN KEY, NOT NULL       | Employee who processed the loan |

| loan\_type        | ENUM('HOME','PERSONAL','EDUCATION','VEHICLE','BUSINESS') | NOT NULL                    | Type of loan                    |

| loan\_amount      | DECIMAL(15,2)                                            | NOT NULL                    | Original loan amount            |

| interest\_rate    | DECIMAL(5,2)                                             | NOT NULL                    | Annual interest rate            |

| loan\_term\_months | INT                                                      | NOT NULL                    | Loan duration in months         |

| start\_date       | DATE                                                     | NOT NULL                    | Date the loan started           |

| status           | ENUM('ACTIVE','CLOSED','DEFAULTED')                      | NOT NULL, DEFAULT 'ACTIVE'  | Current loan status             |



\### Primary Key



`loan\_id` is the primary key of the `loans` table. It uniquely identifies each loan.



\### Foreign Keys



`customer\_id` references `customer\_id` in the `customers` table.



`employee\_id` references `employee\_id` in the `employees` table.



Therefore:



\* One customer can have many loans.

\* One employee can process many loans.



\### Constraints



\* `loan\_id` uses `AUTO\_INCREMENT`.

\* `customer\_id` and `employee\_id` cannot be empty and must refer to existing records.

\* `loan\_amount` uses `DECIMAL(15,2)` to accurately store the loan amount.

\* `interest\_rate` uses `DECIMAL(5,2)` to store the interest percentage.

\* `loan\_term\_months` stores the duration of the loan in months.

\* `loan\_type` identifies the category of loan.

\* New loans have a default status of `ACTIVE`.

\* `status` can be `ACTIVE`, `CLOSED`, or `DEFAULTED`.



\### 7. Loan Payments Table



The `loan\_payments` table stores the payments made by customers toward their loans.



| Column           | Data Type                             | Constraint                    | Description                         |

| ---------------- | ------------------------------------- | ----------------------------- | ----------------------------------- |

| payment\_id       | INT                                   | PRIMARY KEY, AUTO\_INCREMENT   | Unique payment ID                   |

| loan\_id          | INT                                   | FOREIGN KEY, NOT NULL         | Loan for which the payment was made |

| payment\_amount   | DECIMAL(15,2)                         | NOT NULL                      | Amount paid toward the loan         |

| payment\_date     | DATE                                  | NOT NULL                      | Date the payment was made           |

| payment\_method   | ENUM('CASH','CARD','ONLINE','CHEQUE') | NOT NULL                      | Method used to make the payment     |

| payment\_status   | ENUM('PENDING','COMPLETED','FAILED')  | NOT NULL, DEFAULT 'COMPLETED' | Status of the payment               |

| reference\_number | VARCHAR(30)                           | UNIQUE, NOT NULL              | Unique payment reference number     |



\### Primary Key



`payment\_id` is the primary key of the `loan\_payments` table. It uniquely identifies each loan payment.



\### Foreign Key



`loan\_id` references `loan\_id` in the `loans` table.



This creates a one-to-many relationship:



\*\*One loan can have many payments.\*\*



\### Constraints



\* `payment\_id` uses `AUTO\_INCREMENT` to generate a unique payment ID.

\* `loan\_id` cannot be empty and must refer to an existing loan.

\* `payment\_amount` uses `DECIMAL(15,2)` to accurately store payment amounts.

\* `payment\_date` records the date on which the payment was made.

\* `payment\_method` identifies how the payment was made.

\* New payments have a default status of `COMPLETED`.

\* `payment\_status` can be `PENDING`, `COMPLETED`, or `FAILED`.

\* `reference\_number` must be unique for every payment.



\## 8. Database Relationships



The Advanced Banking Management System uses one-to-many relationships between its main tables.



\### 8.1 Customer to Account



One customer can have many accounts.



`accounts.customer\_id` references `customers.customer\_id`.



\*\*Relationship:\*\* 1 : Many



\### 8.2 Branch to Employee



One branch can have many employees.



`employees.branch\_id` references `branches.branch\_id`.



\*\*Relationship:\*\* 1 : Many



\### 8.3 Branch to Account



One branch can maintain many accounts.



`accounts.branch\_id` references `branches.branch\_id`.



\*\*Relationship:\*\* 1 : Many



\### 8.4 Account to Transaction



One account can have many transactions.



`transactions.account\_id` references `accounts.account\_id`.



\*\*Relationship:\*\* 1 : Many



\### 8.5 Customer to Loan



One customer can have many loans.



`loans.customer\_id` references `customers.customer\_id`.



\*\*Relationship:\*\* 1 : Many



\### 8.6 Employee to Loan



One employee can process many loans.



`loans.employee\_id` references `employees.employee\_id`.



\*\*Relationship:\*\* 1 : Many



\### 8.7 Loan to Loan Payment



One loan can have many loan payments.



`loan\_payments.loan\_id` references `loans.loan\_id`.



\*\*Relationship:\*\* 1 : Many



\### Overall Relationship Structure



customers

|

| 1 : Many

v

accounts

|

| 1 : Many

v

transactions



branches

|

+---- 1 : Many ----> employees

|

+---- 1 : Many ----> accounts



customers

|

+---- 1 : Many ----> loans

|

| 1 : Many

v

loan\_payments



employees

|

+---- 1 : Many ----> loans

















