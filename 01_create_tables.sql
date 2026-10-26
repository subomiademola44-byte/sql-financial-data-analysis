-- Table linking each financial record to a company
CREATE TABLE financials (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    fiscal_year INT,
    revenue DECIMAL(15,2),
    net_income DECIMAL(15,2),
    currency VARCHAR(3) DEFAULT 'USD',
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- Figures in USD millions, from company annual reports and filings
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
