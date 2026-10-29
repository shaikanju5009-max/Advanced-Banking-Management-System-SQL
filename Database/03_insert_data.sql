USE advanced_banking_management_system;

INSERT INTO branches
(branch_name, branch_code, address, city, state, phone, manager_name, opening_date)
VALUES
('Dilsukhnagar Branch', 'HYD001', 'Main Road, Dilsukhnagar', 'Hyderabad', 'Telangana', '9876500001', 'Arun Kumar', '2015-04-10'),
('Mehdipatnam Branch', 'HYD002', 'Rethibowli Road, Mehdipatnam', 'Hyderabad', 'Telangana', '9876500002', 'Priya Sharma', '2016-07-15'),
('Secunderabad Branch', 'HYD003', 'S.D. Road, Secunderabad', 'Hyderabad', 'Telangana', '9876500003', 'Rahul Reddy', '2017-02-20'),
('Kukatpally Branch', 'HYD004', 'KPHB Main Road, Kukatpally', 'Hyderabad', 'Telangana', '9876500004', 'Sneha Rao', '2018-09-05'),
('Warangal Branch', 'WAR001', 'Hanamkonda Main Road', 'Warangal', 'Telangana', '9876500005', 'Vikram Singh', '2019-11-12');
select * from branches;
INSERT INTO customer
(first_name, last_name, date_of_birth, gender, phone, email, address, city, registration_date)
VALUES
('Ayesha', 'Khan', '1998-05-12', 'Female', '9876510001', 'ayesha.khan@gmail.com', '12 Charminar Road', 'Hyderabad', '2022-01-15'),
('Rahul', 'Reddy', '1995-08-20', 'Male', '9876510002', 'rahul.reddy@gmail.com', '24 Banjara Hills', 'Hyderabad', '2022-03-10'),
('Sneha', 'Sharma', '1999-02-14', 'Female', '9876510003', 'sneha.sharma@gmail.com', '18 KPHB Colony', 'Hyderabad', '2022-05-22'),
('Mohammed', 'Irfan', '1994-11-05', 'Male', '9876510004', 'mohammed.irfan@gmail.com', '45 Mehdipatnam Road', 'Hyderabad', '2022-07-18'),
('Priya', 'Patel', '1997-06-30', 'Female', '9876510005', 'priya.patel@gmail.com', '31 Kukatpally Main Road', 'Hyderabad', '2022-09-12'),
('Arjun', 'Rao', '1993-12-18', 'Male', '9876510006', 'arjun.rao@gmail.com', '10 Secunderabad Road', 'Hyderabad', '2023-01-25'),
('Fatima', 'Begum', '2000-03-08', 'Female', '9876510007', 'fatima.begum@gmail.com', '22 Tolichowki Road', 'Hyderabad', '2023-04-14'),
('Kiran', 'Kumar', '1996-09-25', 'Male', '9876510008', 'kiran.kumar@gmail.com', '16 LB Nagar Main Road', 'Hyderabad', '2023-06-20'),
('Divya', 'Reddy', '1998-01-17', 'Female', '9876510009', 'divya.reddy@gmail.com', '8 Dilsukhnagar Road', 'Hyderabad', '2023-08-05'),
('Sameer', 'Ahmed', '1992-07-11', 'Male', '9876510010', 'sameer.ahmed@gmail.com', '27 Warangal Road', 'Warangal', '2023-10-30');
select * from customer;
INSERT INTO employees
(first_name, last_name, job_title, phone, email, hire_date, salary, branch_id)
VALUES
('Arun', 'Kumar', 'Branch Manager', '9876520001', 'arun.kumar@abmsbank.com', '2018-06-10', 75000.00, 1),
('Priya', 'Sharma', 'Loan Officer', '9876520002', 'priya.sharma@abmsbank.com', '2019-02-15', 55000.00, 2),
('Rahul', 'Reddy', 'Account Manager', '9876520003', 'rahul.reddy@abmsbank.com', '2020-01-20', 50000.00, 3),
('Sneha', 'Rao', 'Cashier', '9876520004', 'sneha.rao@abmsbank.com', '2020-08-12', 42000.00, 4),
('Vikram', 'Singh', 'Branch Manager', '9876520005', 'vikram.singh@abmsbank.com', '2019-11-12', 72000.00, 5),
('Meera', 'Patel', 'Loan Officer', '9876520006', 'meera.patel@abmsbank.com', '2021-03-18', 54000.00, 1),
('Imran', 'Ahmed', 'Customer Service Executive', '9876520007', 'imran.ahmed@abmsbank.com', '2021-07-25', 38000.00, 2),
('Kiran', 'Kumar', 'Account Manager', '9876520008', 'kiran.kumar@abmsbank.com', '2022-01-10', 51000.00, 3),
('Divya', 'Reddy', 'Cashier', '9876520009', 'divya.reddy@abmsbank.com', '2022-05-16', 41000.00, 4),
('Sahil', 'Khan', 'Customer Service Executive', '9876520010', 'sahil.khan@abmsbank.com', '2023-02-05', 37000.00, 5);
select * from employees;
INSERT INTO accounts
(customer_id, branch_id, account_number, account_type, balance, opening_date, status)
VALUES
(1, 1, 'ACC100001', 'SAVINGS', 45000.00, '2022-02-01', 'ACTIVE'),
(2, 1, 'ACC100002', 'CURRENT', 85000.00, '2022-03-20', 'ACTIVE'),
(3, 2, 'ACC100003', 'SAVINGS', 32000.00, '2022-06-05', 'ACTIVE'),
(4, 2, 'ACC100004', 'CURRENT', 120000.00, '2022-08-15', 'ACTIVE'),
(5, 3, 'ACC100005', 'SAVINGS', 56000.00, '2022-10-10', 'ACTIVE'),
(6, 3, 'ACC100006', 'CURRENT', 95000.00, '2023-02-05', 'ACTIVE'),
(7, 4, 'ACC100007', 'SAVINGS', 28000.00, '2023-05-12', 'ACTIVE'),
(8, 4, 'ACC100008', 'SAVINGS', 67000.00, '2023-07-01', 'ACTIVE'),
(9, 5, 'ACC100009', 'CURRENT', 150000.00, '2023-08-20', 'ACTIVE'),
(10, 5, 'ACC100010', 'SAVINGS', 39000.00, '2023-11-05', 'ACTIVE'),
(1, 2, 'ACC100011', 'SAVINGS', 72000.00, '2024-01-15', 'ACTIVE'),
(2, 3, 'ACC100012', 'CURRENT', 110000.00, '2024-02-20', 'ACTIVE'),
(3, 4, 'ACC100013', 'SAVINGS', 48000.00, '2024-04-10', 'ACTIVE'),
(4, 5, 'ACC100014', 'CURRENT', 135000.00, '2024-06-18', 'ACTIVE'),
(5, 1, 'ACC100015', 'SAVINGS', 61000.00, '2024-09-25', 'ACTIVE');
select * from accounts;
INSERT INTO transactions
(account_id, transaction_type, amount, transaction_date, description, reference_number)
VALUES
(1, 'DEPOSIT', 10000.00, '2024-01-05 10:30:00', 'Cash deposit', 'TXN100001'),
(2, 'DEPOSIT', 25000.00, '2024-01-08 11:15:00', 'Business deposit', 'TXN100002'),
(3, 'WITHDRAWAL', 5000.00, '2024-01-12 14:20:00', 'ATM withdrawal', 'TXN100003'),
(4, 'DEPOSIT', 30000.00, '2024-01-18 09:45:00', 'Cheque deposit', 'TXN100004'),
(5, 'WITHDRAWAL', 8000.00, '2024-02-03 12:10:00', 'ATM withdrawal', 'TXN100005'),
(6, 'TRANSFER', 15000.00, '2024-02-10 15:30:00', 'Fund transfer', 'TXN100006'),
(7, 'DEPOSIT', 12000.00, '2024-02-15 10:05:00', 'Salary deposit', 'TXN100007'),
(8, 'WITHDRAWAL', 7000.00, '2024-02-22 13:40:00', 'Cash withdrawal', 'TXN100008'),
(9, 'DEPOSIT', 40000.00, '2024-03-01 09:30:00', 'Business income deposit', 'TXN100009'),
(10, 'INTEREST', 1250.00, '2024-03-05 11:00:00', 'Savings interest credited', 'TXN100010'),
(11, 'DEPOSIT', 18000.00, '2024-03-12 14:15:00', 'Online deposit', 'TXN100011'),
(12, 'WITHDRAWAL', 10000.00, '2024-03-20 16:20:00', 'Cash withdrawal', 'TXN100012'),
(13, 'DEPOSIT', 22000.00, '2024-04-02 10:45:00', 'Salary deposit', 'TXN100013'),
(14, 'TRANSFER', 20000.00, '2024-04-10 12:30:00', 'Online fund transfer', 'TXN100014'),
(15, 'WITHDRAWAL', 6000.00, '2024-04-18 15:10:00', 'ATM withdrawal', 'TXN100015'),
(1, 'INTEREST', 950.00, '2024-05-01 09:15:00', 'Savings interest credited', 'TXN100016'),
(3, 'DEPOSIT', 15000.00, '2024-05-08 11:25:00', 'Cash deposit', 'TXN100017'),
(5, 'WITHDRAWAL', 4500.00, '2024-05-15 13:50:00', 'ATM withdrawal', 'TXN100018'),
(7, 'DEPOSIT', 28000.00, '2024-06-05 10:10:00', 'Salary deposit', 'TXN100019'),
(10, 'TRANSFER', 12500.00, '2024-06-15 14:40:00', 'Fund transfer', 'TXN100020');
select * from transactions;
INSERT INTO loans
(customer_id, employee_id, loan_type, loan_amount, interest_rate, loan_term_months, start_date, status)
VALUES
(1, 1, 'HOME', 2500000.00, 8.50, 240, '2023-01-15', 'ACTIVE'),
(2, 2, 'BUSINESS', 1500000.00, 9.25, 120, '2023-03-10', 'ACTIVE'),
(3, 3, 'EDUCATION', 500000.00, 7.50, 60, '2023-05-20', 'ACTIVE'),
(4, 4, 'VEHICLE', 800000.00, 9.00, 84, '2023-07-05', 'ACTIVE'),
(5, 5, 'PERSONAL', 300000.00, 11.50, 36, '2023-09-12', 'CLOSED'),
(6, 6, 'HOME', 3200000.00, 8.25, 240, '2023-11-18', 'ACTIVE'),
(7, 7, 'EDUCATION', 400000.00, 7.75, 48, '2024-01-10', 'ACTIVE'),
(8, 8, 'VEHICLE', 950000.00, 9.50, 72, '2024-02-15', 'ACTIVE'),
(9, 9, 'BUSINESS', 2000000.00, 10.00, 120, '2024-03-20', 'ACTIVE'),
(10, 10, 'PERSONAL', 250000.00, 12.00, 24, '2024-04-25', 'DEFAULTED');
select * from loans;
INSERT INTO loan_payments
(loan_id, payment_amount, payment_date, payment_method, payment_status, reference_number)
VALUES
(1, 25000.00, '2024-01-10', 'ONLINE', 'COMPLETED', 'PAY100001'),
(1, 25000.00, '2024-02-10', 'ONLINE', 'COMPLETED', 'PAY100002'),
(2, 18000.00, '2024-01-15', 'CHEQUE', 'COMPLETED', 'PAY100003'),
(2, 18000.00, '2024-02-15', 'CHEQUE', 'COMPLETED', 'PAY100004'),
(3, 10000.00, '2024-01-20', 'ONLINE', 'COMPLETED', 'PAY100005'),
(3, 10000.00, '2024-02-20', 'ONLINE', 'COMPLETED', 'PAY100006'),
(4, 15000.00, '2024-01-25', 'CARD', 'COMPLETED', 'PAY100007'),
(4, 15000.00, '2024-02-25', 'CARD', 'COMPLETED', 'PAY100008'),
(5, 12000.00, '2024-01-05', 'CASH', 'COMPLETED', 'PAY100009'),
(5, 12000.00, '2024-02-05', 'CASH', 'COMPLETED', 'PAY100010'),
(6, 30000.00, '2024-03-10', 'ONLINE', 'COMPLETED', 'PAY100011'),
(6, 30000.00, '2024-04-10', 'ONLINE', 'COMPLETED', 'PAY100012'),
(7, 9000.00, '2024-03-15', 'CARD', 'COMPLETED', 'PAY100013'),
(7, 9000.00, '2024-04-15', 'CARD', 'COMPLETED', 'PAY100014'),
(8, 16000.00, '2024-03-20', 'ONLINE', 'COMPLETED', 'PAY100015'),
(8, 16000.00, '2024-04-20', 'ONLINE', 'COMPLETED', 'PAY100016'),
(9, 22000.00, '2024-04-25', 'CHEQUE', 'COMPLETED', 'PAY100017'),
(9, 22000.00, '2024-05-25', 'CHEQUE', 'COMPLETED', 'PAY100018'),
(10, 11000.00, '2024-05-05', 'ONLINE', 'PENDING', 'PAY100019'),
(10, 11000.00, '2024-06-05', 'ONLINE', 'FAILED', 'PAY100020');
select * from loan_payments;
show tables;