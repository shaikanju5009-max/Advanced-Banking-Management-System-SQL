\# Entity Relationship Diagram



\## Database

Advanced Banking Management System



\## Entities



\### Customers

\- customer\_id (PK)

\- first\_name

\- last\_name

\- date\_of\_birth

\- gender

\- phone

\- email

\- address

\- city

\- registration\_date



\### Branches

\- branch\_id (PK)

\- branch\_name

\- branch\_code

\- address

\- city

\- state

\- phone

\- manager\_name

\- opening\_date



\### Employees

\- employee\_id (PK)

\- first\_name

\- last\_name

\- job\_title

\- phone

\- email

\- hire\_date

\- salary

\- branch\_id (FK)



\### Accounts

\- account\_id (PK)

\- customer\_id (FK)

\- branch\_id (FK)

\- account\_number

\- account\_type

\- balance

\- opening\_date

\- status



\### Transactions

\- transaction\_id (PK)

\- account\_id (FK)

\- transaction\_type

\- amount

\- transaction\_date

\- description

\- reference\_number



\### Loans

\- loan\_id (PK)

\- customer\_id (FK)

\- employee\_id (FK)

\- loan\_type

\- loan\_amount

\- interest\_rate

\- loan\_term\_months

\- start\_date

\- status



\### Loan Payments

\- payment\_id (PK)

\- loan\_id (FK)

\- payment\_amount

\- payment\_date

\- payment\_method

\- payment\_status

\- reference\_number



\## Relationships



1\. Customers → Accounts

&#x20;  - One customer can have many accounts.

&#x20;  - Relationship: 1:M



2\. Branches → Employees

&#x20;  - One branch can have many employees.

&#x20;  - Relationship: 1:M



3\. Branches → Accounts

&#x20;  - One branch can have many accounts.

&#x20;  - Relationship: 1:M



4\. Accounts → Transactions

&#x20;  - One account can have many transactions.

&#x20;  - Relationship: 1:M



5\. Customers → Loans

&#x20;  - One customer can have many loans.

&#x20;  - Relationship: 1:M



6\. Employees → Loans

&#x20;  - One employee can manage many loans.

&#x20;  - Relationship: 1:M



7\. Loans → Loan Payments

&#x20;  - One loan can have many payments.

&#x20;  - Relationship: 1:M



\## Textual ER Structure



Customers

&#x20;   |

&#x20;   | 1:M

&#x20;   v

Accounts ---------> Branches

&#x20;   |

&#x20;   | 1:M

&#x20;   v

Transactions



Customers

&#x20;   |

&#x20;   | 1:M

&#x20;   v

Loans <------------- Employees

&#x20;   |

&#x20;   | 1:M

&#x20;   v

Loan Payments

