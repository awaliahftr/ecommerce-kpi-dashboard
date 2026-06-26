CREATE TABLE clean_transactions AS
SELECT
    invoice_no,
    stock_code,
    TRIM(description)                    AS description,
    quantity,
    invoice_date::DATE                   AS invoice_date,
    EXTRACT(YEAR  FROM invoice_date)::INT AS year,
    EXTRACT(MONTH FROM invoice_date)::INT AS month,
    price,
    customer_id,
    country,
    (quantity * price)                   AS total_sales
FROM raw_transactions
WHERE
    customer_id IS NOT NULL
    AND quantity > 0
    AND price    > 0
    AND invoice_no::text NOT LIKE 'C%';   

CREATE INDEX idx_customer  ON clean_transactions(customer_id);
CREATE INDEX idx_date      ON clean_transactions(invoice_date);
CREATE INDEX idx_month     ON clean_transactions(year, month);
