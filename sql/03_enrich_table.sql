-- Enrich table with simulated payment data for AR analysis

alter table train
add column payment_date date,
add column payment_status varchar(20);

update train
set payment_date = date_add(train.Order_Date, interval floor(rand()*60)day );

update train
set payment_status =
    case
        WHEN RAND() > 0.2 THEN 'Paid'
        else 'unpaid'
    end;
