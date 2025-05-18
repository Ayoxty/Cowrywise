
Q1. High-Value Customers with Multiple Products
I started by going through the question, understanding the required information and the hints were a good pointer for me to focus on the important fields, and my backgroud knowledge of sql came in really solid.
I knew i needed to join the first_name and last_name column together to get the customers names, and since I'd be making use of multiple tables I know I need to join my tables, ehnce the use of the left join,
abd the rest was fun.
Overall, the query provides insights into users' investment and savings behavior, including the total deposits in their savings accounts.



Q2.Transaction Frequency Analysis
This question was a litlle tricky but carefuly looking at the requirement I knew I need to
uses two Common Table Expressions (CTEs):

1. Transaction_Frequency: calculates the transaction frequency level for each customer.
2. avg_transactions: calculates the average transactions per month for each customer.

The final result combines these two CTEs to provide insights into customer transaction behavior.
then I proceeded to
1. Join users_customuser and savings_savingsaccount tables on owner_id.
2. Groups the results by owner_id.
3. Counts the number of transactions for each customer.
4. Assigns a frequency level based on the transaction count:
    - High: more than 9 transactions
    - Mid: between 3 and 9 transactions
    - Low: fewer than 3 transactions
This information can be useful for businesses to understand customer behavior, identify trends, and develop targeted marketing strategies.



Q3.Account Inactivity Alert
This tested for inactive accounts with no transactions in the last 365 days. Here's a breakdown:


1. plan_id: the ID of the plan/investment.
2. owner_id: the ID of the account owner.
3. Last_Transaction: the date of the last transaction thats date difference from the current date to a year ago.
4. inactive_days: the number of days since the last transaction.
5. Type: the type of account (Investment or Savings).


The query joins two tables:

1. savings_savingsaccount: contains savings account information.
2. plans_plan: contains plan/investment information (joined on owner_id).

The join is an INNER JOIN, meaning that only records with matching owner_id values in both tables are included.

The query applies one condition:
1. transaction_date < NOW() - INTERVAL 365 DAY: only accounts with last transaction dates older than 365 days are included.

This query helped identify:
1. Inactive accounts that may require re-engagement or follow-up.
2. Accounts that may be dormant or abandoned.
3. Opportunities to reach out to customers and offer new products or services.


Q4. Customer Lifetime Value (CLV) Estimation
this question tested my use of aggregate functions and join, i approached it by 
joing two tables:
1. savings_savingsaccount: contains savings account information.
2. users_customuser: contains customer information (joined on owner_id/id).

The join is a LEFT JOIN, meaning that all records from savings_savingsaccount are included, even if there are no matching records in users_customuser.

The query calculates the estimated CLV using the following formula:

estimated_CLV = (transaction_frequency * 12 * average_revenue_per_transaction)

Where:

- transaction_frequency is calculated as COUNT(*) / tenure_months
- average_revenue_per_transaction is calculated as AVG(new_balance * 0.1), assuming that 10% of the balance is the revenue generated per transaction.
This query helped identify:

1. High-value customers with high estimated CLV.
2. Customers with low estimated CLV who may require targeted marketing or retention efforts.
3. Opportunities to increase revenue by optimizing transaction frequency or average balance.

Overall, the query provides valuable insights into customer behavior and value, which can inform marketing and retention strategies.







