-- Top 15 customers with highest sales amount

select
    train.Customer_Name,
    sum(sales) as Sales_amount
from train
group by Customer_Name
order by Sales_amount desc
limit 15;
