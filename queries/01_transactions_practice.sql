/*
PROJECT: Finance Data Analyst SQL Practice — Transactions
DATABASE: finance_practice
TABLE: transactions
*/


USE finance_practice;

-- ------------------------------------------------------------
-- SECTION 1: SELECT, WHERE, ORDER BY
-- ------------------------------------------------------------

-- Q1. Display every column and every row from transactions.
 SELECT * FROM transactions;


-- Q2. Display transaction_id, transaction_date, and amount
--     for transactions with an amount greater than 700.
SELECT transaction_id, transaction_date, amount
FROM transactions
WHERE amount > 700;


-- Q3. Show all transactions from highest amount to lowest.
SELECT * 
FROM transactions 
ORDER BY amount DESC;


-- Q4. Show only transactions whose status is 'Pending'
SELECT * 
FROM transactions
WHERE status = 'Pending';



-- ------------------------------------------------------------
-- SECTION 2: COUNT, SUM, AVG, MIN, MAX
-- ------------------------------------------------------------

-- Q5. Count the total number of transactions.
SELECT COUNT(*) AS total_transactions
FROM transactions;


-- Q6. Count how many transactions have status = 'Pending'.
SELECT COUNT(*) AS Pending_transactions
FROM transactions
WHERE status = 'Pending';


-- Q7. Calculate the total amount for transactions where
--     transaction_type = 'Expense'.
SELECT SUM(amount) AS total_expenses 
FROM transactions
WHERE transaction_type = 'Expense';


-- Q8. Calculate the average amount for transactions where
--     transaction_type = 'Revenue'.
SELECT AVG(amount) AS average_revenue
FROM transactions
WHERE transaction_type = 'Revenue';


-- Q9. Find the largest and smallest transaction amounts.
SELECT 
    MIN(amount) as smallest_transaction,
    MAX(amount) as largest_transaction
FROM transactions;
   


-- ------------------------------------------------------------
-- SECTION 3: GROUP BY
-- ------------------------------------------------------------

-- Q10. Show the total transaction amount for each department.
SELECT 
     department,
     SUM(amount) AS total_amount
FROM transactions
GROUP BY department;


-- Q11. Count how many transactions belong to each status.
SELECT 
    status,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY status;

-- Q12. Show total expenses for each department.
SELECT 
     department,
     SUM(amount) AS total_expense
FROM transactions
WHERE transaction_type = 'Expense'
GROUP BY department;


-- Q13. For each transaction_type, show:
--      - the transaction_type
--      - the number of transactions
--      - the total amount

SELECT 
    transaction_type,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_type;

-- ------------------------------------------------------------
-- SECTION 4: WHERE vs HAVING
-- ------------------------------------------------------------

-- Q14. Show departments whose total transaction amount is greater than 5000.
SELECT
    department,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY department
HAVING SUM(amount) > 5000;



-- Q15. Show transaction statuses that have at least 5 transactions.
SELECT
    status,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY status
HAVING COUNT(*) >= 5;

-- ------------------------------------------------------------
-- SECTION 5: FINANCE ANALYST CHALLENGE
-- ------------------------------------------------------------

-- Q16. Create a simple transaction report with:
--      department, transaction_type, transaction_count, total_amount,
--      and average_amount.
--      Group by department and transaction_type.
--      Sort the largest total_amount first.
SELECT 
   department,
   transaction_type,
   COUNT(*) AS transaction_count,
   SUM(amount) AS total_amount,
   AVG(amount) AS average_amount
FROM transactions
GROUP BY department,
	 transaction_type
 ORDER BY total_amount DESC;   
     
-- Q17. Use CASE to classify each transaction:
--      amount >= 2000 -> 'Large'
--      amount >= 500 and amount < 2000 -> 'Medium'
--      amount < 500 -> 'Small'
--      Display transaction_id, amount, and your category.
SELECT
    transaction_id,
    amount,
    CASE
        WHEN amount >= 2000 THEN 'Large'
        WHEN amount >= 500 THEN 'Medium'
        ELSE 'Small'
    END AS transaction_category
FROM transactions;
