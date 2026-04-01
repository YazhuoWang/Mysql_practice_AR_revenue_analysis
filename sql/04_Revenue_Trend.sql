-- Revenue by month

select
    date_format(train.Order_Date, '%Y-%m')as month,
    sum(train.Sales) as revenue
from train
group by month
order by month;
