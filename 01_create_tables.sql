-- Reference table: companies
CREATE TABLE companies (
    company_id INT NOT NULL AUTO_INCREMENT,
    company_name VARCHAR(100) DEFAULT NULL,
    ticker_symbol VARCHAR(10) DEFAULT NULL,
    sector VARCHAR(50) DEFAULT NULL,
    country VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (company_id)
);

INSERT INTO companies (company_name, ticker_symbol, sector, country) VALUES
('Apple', 'AAPL', 'Technology', 'USA'),
('Microsoft', 'MSFT', 'Technology', 'USA'),
('Amazon', 'AMZN', 'Consumer', 'USA'),
('JPMorgan Chase', 'JPM', 'Financials', 'USA'),
('Tesla', 'TSLA', 'Automotive', 'USA'),
('Unilever', 'ULVR', 'Consumer', 'UK'),
('HSBC', 'HSBA', 'Financials', 'UK');

-- Internal ledger of practice transactions
CREATE TABLE transactions (
    transaction_id INT NOT NULL,
    department VARCHAR(30) DEFAULT NULL,
    transaction_type VARCHAR(20) DEFAULT NULL,
    amount DECIMAL(10,2) DEFAULT NULL,
    transaction_date DATE DEFAULT NULL,
    payment_method VARCHAR(20) DEFAULT NULL,
    status VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY (transaction_id)
);

-- Annual figures per company (USD millions, from company annual reports and filings)
CREATE TABLE financials (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    fiscal_year INT,
    revenue DECIMAL(15,2),
    net_income DECIMAL(15,2),
    currency VARCHAR(3) DEFAULT 'USD',
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

INSERT INTO financials (company_id, fiscal_year, revenue, net_income) VALUES
(1, 2023, 383285, 96995),
(1, 2024, 391035, 93736),
(1, 2025, 416161, 112010),
(2, 2023, 211915, 72361),
(2, 2024, 245122, 88136),
(2, 2025, 281724, 101832),
(3, 2023, 574785, 30425),
(3, 2024, 637959, 59248),
(3, 2025, 716924, 77670);

INSERT INTO transactions
(transaction_id, department, transaction_type, amount, transaction_date, payment_method, status) VALUES
(1, 'Sales', 'Revenue', 1200.00, '2026-01-05', 'Bank Transfer', 'Completed'),
(2, 'Finance', 'Expense', 800.00, '2026-01-07', 'Debit Card', 'Completed'),
(3, 'Sales', 'Revenue', 450.00, '2026-01-12', 'Bank Transfer', 'Completed'),
(4, 'IT', 'Expense', 1500.00, '2026-01-15', 'Credit Card', 'Completed'),
(5, 'Finance', 'Expense', 600.00, '2026-01-20', 'Bank Transfer', 'Pending'),
(6, 'Marketing', 'Expense', 950.00, '2026-01-22', 'Credit Card', 'Completed'),
(7, 'Sales', 'Revenue', 2200.00, '2026-02-02', 'Bank Transfer', 'Completed'),
(8, 'IT', 'Expense', 750.00, '2026-02-04', 'Debit Card', 'Completed'),
(9, 'HR', 'Expense', 400.00, '2026-02-08', 'Bank Transfer', 'Completed'),
(10, 'Sales', 'Revenue', 1800.00, '2026-02-10', 'Bank Transfer', 'Pending'),
(11, 'Finance', 'Expense', 1250.00, '2026-02-12', 'Credit Card', 'Completed'),
(12, 'Marketing', 'Expense', 1100.00, '2026-02-15', 'Debit Card', 'Completed'),
(13, 'Sales', 'Revenue', 2750.00, '2026-02-20', 'Bank Transfer', 'Completed'),
(14, 'HR', 'Expense', 650.00, '2026-02-22', 'Credit Card', 'Pending'),
(15, 'IT', 'Expense', 2100.00, '2026-03-01', 'Bank Transfer', 'Completed'),
(16, 'Sales', 'Revenue', 3200.00, '2026-03-03', 'Bank Transfer', 'Completed'),
(17, 'Finance', 'Expense', 900.00, '2026-03-05', 'Debit Card', 'Completed'),
(18, 'Marketing', 'Expense', 1450.00, '2026-03-08', 'Credit Card', 'Completed'),
(19, 'Sales', 'Revenue', 1600.00, '2026-03-10', 'Bank Transfer', 'Completed'),
(20, 'HR', 'Expense', 550.00, '2026-03-12', 'Debit Card', 'Completed'),
(21, 'IT', 'Expense', 1800.00, '2026-03-15', 'Credit Card', 'Pending'),
(22, 'Sales', 'Revenue', 2400.00, '2026-03-18', 'Bank Transfer', 'Completed'),
(23, 'Finance', 'Expense', 1350.00, '2026-03-20', 'Bank Transfer', 'Completed'),
(24, 'Marketing', 'Expense', 700.00, '2026-03-22', 'Debit Card', 'Pending'),
(25, 'Sales', 'Revenue', 1950.00, '2026-03-25', 'Bank Transfer', 'Completed'),
(26, 'IT', 'Expense', 950.00, '2026-03-27', 'Credit Card', 'Completed'),
(27, 'Finance', 'Expense', 500.00, '2026-03-28', 'Debit Card', 'Completed'),
(28, 'Sales', 'Revenue', 2850.00, '2026-03-29', 'Bank Transfer', 'Completed'),
(29, 'HR', 'Expense', 800.00, '2026-03-30', 'Credit Card', 'Completed'),
(30, 'Marketing', 'Expense', 1250.00, '2026-03-31', 'Bank Transfer', 'Completed');
