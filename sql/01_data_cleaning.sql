-- Convert date format from DD/MM/YYYY to DATE

SELECT
    order_date,
    STR_TO_DATE(order_date, '%d/%m/%Y') AS converted_order_date,
    ship_date,
    STR_TO_DATE(ship_date, '%d/%m/%Y') AS converted_ship_date
FROM train;

-- Add new columns
ALTER TABLE train
ADD COLUMN order_date_new DATE,
ADD COLUMN ship_date_new DATE;

-- Update converted values
UPDATE train
SET
    order_date_new = STR_TO_DATE(NULLIF(order_date, ''), '%d/%m/%Y'),
    ship_date_new = STR_TO_DATE(NULLIF(ship_date, ''), '%d/%m/%Y');

-- Check for failed conversions
SELECT *
FROM train
WHERE order_date_new IS NULL;

-- Drop old columns
ALTER TABLE train DROP COLUMN order_date;
ALTER TABLE train DROP COLUMN ship_date;

-- Rename new columns
ALTER TABLE train
CHANGE order_date_new order_date DATE,
CHANGE ship_date_new ship_date DATE;
