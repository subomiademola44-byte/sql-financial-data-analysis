-- Each check should return 0 issues
SELECT 'missing_values' AS check_name, COUNT(*) AS issues_found
FROM transactions
WHERE department IS NULL OR transaction_type IS NULL OR amount IS NULL
   OR transaction_date IS NULL OR payment_method IS NULL OR status IS NULL

UNION ALL

SELECT 'zero_or_negative_amounts', COUNT(*)
FROM transactions
WHERE amount <= 0

UNION ALL

SELECT 'possible_duplicates', COUNT(*)
FROM (
    SELECT 1
    FROM transactions
    GROUP BY department, amount, transaction_date
    HAVING COUNT(*) > 1
) AS dup;
