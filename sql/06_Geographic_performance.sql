-- performance by state

select
    train.State,
    sum(Sales) as Sales_amount
from train
group by State;
