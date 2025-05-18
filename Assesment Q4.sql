-- Q4. Customer Lifetime Value (CLV) Estimation


select owner_id, concat(first_name, " ", last_name) as Name, (transaction_date) AS total_transactions,
  TIMESTAMPDIFF(MONTH, MIN(transaction_date), MAX(transaction_date)) AS tenure_months,
  (COUNT(*) / TIMESTAMPDIFF(MONTH, MIN(transaction_date), MAX(transaction_date))) * 12 * AVG(new_balance*0.1) AS estimated_CLV
FROM savings_savingsaccount
inner join users_customuser
on savings_savingsaccount.owner_id = users_customuser.id
GROUP BY owner_id
order by 5 desc;

