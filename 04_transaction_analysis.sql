-- Q4: Revenue vs expenses by department (completed transactions only)
SELECT department,
       SUM(CASE WHEN transaction_type = 'Revenue' THEN amount ELSE 0 END) AS total_revenue,
       SUM(CASE WHEN transaction_type = 'Expense' THEN amount ELSE 0 END) AS total_expenses,
       SUM(CASE WHEN transaction_type = 'Revenue' THEN amount ELSE -amount END) AS net_position
FROM transactions
WHERE status = 'Completed'
GROUP BY department
ORDER BY net_position DESC;

-- Q5: Completed vs pending transactions
SELECT status, COUNT(*) AS transactions, SUM(amount) AS total_amount
FROM transactions
GROUP BY status;
