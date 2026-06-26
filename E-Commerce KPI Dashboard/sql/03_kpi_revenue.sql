-- Monthly Revenue

CREATE VIEW vw_monthly_revenue AS
SELECT
    year,
    month,
    TO_CHAR(TO_DATE(month::TEXT, 'MM'), 'Mon') AS month_name,
    ROUND(SUM(total_sales)::NUMERIC, 2)        AS revenue,
    COUNT(DISTINCT invoice_no)                 AS total_orders,
    COUNT(DISTINCT customer_id)                AS unique_customers,
    ROUND(
        (SUM(total_sales) / COUNT(DISTINCT invoice_no))::NUMERIC,
        2
    ) AS aov
FROM clean_transactions
GROUP BY year, month
ORDER BY year, month;

-- Month-over-Month Growth

CREATE VIEW vw_mom_growth AS
SELECT
    year, month, revenue,
    LAG(revenue) OVER (ORDER BY year, month) AS prev_revenue,
    ROUND(
      (revenue - LAG(revenue) OVER (ORDER BY year, month))
      / NULLIF(LAG(revenue) OVER (ORDER BY year, month), 0) * 100
    , 2) AS mom_growth_pct
FROM vw_monthly_revenue;

-- Top 10 Products

CREATE VIEW vw_top_products AS
SELECT
    stock_code,
    description,
    SUM(quantity)    AS total_qty,
    ROUND(SUM(total_sales)::NUMERIC, 2) AS total_revenue
FROM clean_transactions
GROUP BY stock_code, description
ORDER BY total_revenue DESC
LIMIT 10;