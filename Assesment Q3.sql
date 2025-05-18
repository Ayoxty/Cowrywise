-- Q3. Account Inactivity Alert

select plan_id, savings_savingsaccount.owner_id, transaction_date as Last_Transaction, DATEDIFF(NOW(), MAX(transaction_date)) AS inactive_days,
 CASE
    WHEN is_a_fund = 1 then "Investment"
    WHEN is_regular_savings THEN "Savings"
  END AS Type
FROM savings_savingsaccount
inner join plans_plan
USING (owner_id)
WHERE transaction_date < NOW() - INTERVAL 365 DAY 
group by 2
order by owner_id;