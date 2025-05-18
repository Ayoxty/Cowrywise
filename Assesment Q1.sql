-- Q1. High-Value Customers With Multiple Products

select users_customuser.id as Owner_ID, concat(first_name, " ", last_name) as Name, count(is_a_fund) as Investment_Count, count(is_regular_savings) as Savings_Count, round(new_balance,2) as Total_Deposits
from users_customuser
left join plans_plan
on users_customuser.id = plans_plan.owner_id
left join savings_savingsaccount
on users_customuser.id = savings_savingsaccount.owner_id
where (is_a_fund) != 0 and (new_balance) != 0
group by Name
order by Total_Deposits desc;