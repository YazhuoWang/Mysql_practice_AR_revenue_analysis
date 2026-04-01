-- Average days between order date and payment date

select
    Customer_Name,
    avg(datediff(payment_date,Order_Date)) as avg_days_to_pay
from train
where payment_status = 'Paid'
group by Customer_Name
order by avg_days_to_pay desc;
