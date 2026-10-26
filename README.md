# SQL Financial Data Analysis

SQL project using MySQL to clean, validate and analyse financial data across two datasets: published annual results for large public companies, and an internal transactions ledger.

## Datasets

**1. `financials` + `companies`** - annual revenue and net income for Apple, Microsoft and Amazon (3 fiscal years each), joined to a company reference table.
- Figures are in USD millions, taken from company annual reports and filings.
- Fiscal year-ends differ: Apple (September), Microsoft (June), Amazon (December).
- The `companies` table also lists JPMorgan, Tesla, Unilever and HSBC. These have no financial data loaded yet.

**2. `transactions`** - 30 practice transactions across 5 departments (Sales, Finance, IT, Marketing, HR). This is a sample dataset created for learning, not real company data.

## Data quality checks (transactions)
- Missing values in any column: **0 found**
- Zero or negative amounts: **0 found**
- Possible duplicates (same department, amount, date): **0 found**
- Category columns checked with `DISTINCT`: department, transaction type and status contain no spelling variants.

## Key findings

**Company financials (FY2023-FY2025)**
- Amazon had the highest total revenue ($1.93tn) but the lowest net margin (8.67%).
- Microsoft had the highest net margin (35.51%) and the fastest growth (about 15-16% a year).
- Apple's margin was 25.43%. Growth slowed to 2.02% in FY2024, then recovered to 6.43% in FY2025.

**Transactions**
- Completed transactions: 18,600 revenue vs 16,600 expenses, a net position of +2,000.
- Sales is the only department with revenue. IT has the highest spend (5,300).
- 5 of 30 transactions (5,550 of 40,750 in value) are Pending and were excluded from the totals.
- Totals reconcile: completed (35,200) + pending (5,550) = all transactions (40,750).

## SQL skills used
`SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING`, aggregate functions (`SUM`, `AVG`, `COUNT`), `INNER JOIN`, `PRIMARY KEY` / `FOREIGN KEY`, `CASE WHEN`, `UNION ALL`, subqueries, window functions (`LAG`).

## Limitations
- Only 3 companies and 3 years of data, so findings are illustrative, not conclusive.
- Net margin compares companies with different fiscal year-ends and business models.
- Transactions data is sample data.

## Files
- `01_create_tables.sql`
- `02_data_quality_checks.sql`
- `03_company_analysis.sql`
- `04_transaction_analysis.sql`

## Repository structure
- `queries/` - initial SQL practice queries (filtering, aggregation, GROUP BY, HAVING, CASE)
- `screenshots/` - screenshots from the earlier practice stage
- `01` to `04` .sql files - the full financial analysis project
