-- Q1: Total revenue and average profit per company
SELECT c.company_name,
       SUM(f.revenue) AS total_revenue,
       AVG(f.net_income) AS avg_profit,
       COUNT(*) AS total_records
FROM financials f
JOIN companies c ON f.company_id = c.company_id
WHERE f.fiscal_year >= 2023
GROUP BY c.company_name
ORDER BY total_revenue DESC;

-- Q2: Net profit margin per company
SELECT c.company_name,
       SUM(f.revenue) AS total_revenue,
       SUM(f.net_income) AS total_net_income,
       ROUND(SUM(f.net_income) / SUM(f.revenue) * 100, 2) AS net_margin_pct
FROM financials f
JOIN companies c ON f.company_id = c.company_id
GROUP BY c.company_name
ORDER BY net_margin_pct DESC;

-- Q3: Year-on-year revenue growth
SELECT c.company_name, f.fiscal_year, f.revenue,
       LAG(f.revenue) OVER (PARTITION BY f.company_id ORDER BY f.fiscal_year) AS prev_year_revenue,
       ROUND((f.revenue - LAG(f.revenue) OVER (PARTITION BY f.company_id ORDER BY f.fiscal_year))
             / LAG(f.revenue) OVER (PARTITION BY f.company_id ORDER BY f.fiscal_year) * 100, 2) AS revenue_growth_pct
FROM financials f
JOIN companies c ON f.company_id = c.company_id
ORDER BY c.company_name, f.fiscal_year;
