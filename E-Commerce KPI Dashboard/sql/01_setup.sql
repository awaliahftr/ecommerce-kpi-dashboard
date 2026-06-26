CREATE DATABASE ecommerce_db;
\c ecommerce_db

CREATE TABLE raw_transactions (
    invoice_no      VARCHAR(20),
    stock_code      VARCHAR(20),
    description     TEXT,
    quantity        INTEGER,
    invoice_date    TIMESTAMP,
    price           NUMERIC(10, 2),
    customer_id     VARCHAR(20),
    country         VARCHAR(100)
);