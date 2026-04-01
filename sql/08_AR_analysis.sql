-- AR aging (assume Curdate()=2015-03-26)
select
    case
        when datediff('2015-03-26',train.Order_Date)<=30 then '0-30'
        when datediff('2015-03-26',train.Order_Date)<=60 then '31-60'
        else '60+'
    end as aging_bucket,
    sum(Sales) as total_amount
from train
where payment_status = 'unpaid'
group by aging_bucket;


-- Revenue vs Cash collected
select
    date_format(train.Order_Date, '%Y-%m') as month,
    sum(Sales) as Revenue,
    sum(
    case
        when payment_status = 'paid' then Sales
        else 0
    end
    ) as cash_collected
from train
group by month
order by month;
