-- Q2 Transaction Frequency Analysis

WITH Transaction_Frequency AS (
  SELECT 
    savings_savingsaccount.owner_id,
    COUNT(transaction_date) AS transaction_count,
    CASE 
      WHEN COUNT(transaction_date) > 9 THEN 'High'
      WHEN COUNT(transaction_date) BETWEEN 3 AND 9 THEN 'Mid'
      ELSE 'Low'
    END AS Frequency_level
  FROM 
    users_customuser
  INNER JOIN 
    savings_savingsaccount ON users_customuser.id = savings_savingsaccount.owner_id
  GROUP BY 
    savings_savingsaccount.owner_id
),
avg_transactions AS (
  SELECT 
    owner_id,
    COUNT(transaction_date) / TIMESTAMPDIFF(MONTH, MIN(transaction_date), MAX(transaction_date)) + 1 AS avg_transaction_per_month
  FROM 
    savings_savingsaccount
  GROUP BY 
    owner_id
)
SELECT 
  Frequency_level,
  COUNT(DISTINCT tf.owner_id) AS customer_count,
  round(AVG(at.avg_transaction_per_month),2) AS average_transactions_per_month
FROM 
  Transaction_Frequency tf
INNER JOIN 
  avg_transactions at ON tf.owner_id = at.owner_id
GROUP BY 
  Frequency_level;