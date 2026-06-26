WITH first_purchase AS (
    -- First purchase month per customer
    SELECT
        customer_id,
        DATE_TRUNC('month', MIN(invoice_date)) AS cohort_month
    FROM clean_transactions
    GROUP BY customer_id
),

cohort_data AS (
    SELECT
        fp.customer_id,
        fp.cohort_month,
        DATE_TRUNC('month', ct.invoice_date) AS activity_month,
        EXTRACT(YEAR FROM AGE(
            DATE_TRUNC('month', ct.invoice_date),
            fp.cohort_month
        )) * 12 +
        EXTRACT(MONTH FROM AGE(
            DATE_TRUNC('month', ct.invoice_date),
            fp.cohort_month
        ))                                   AS month_number
    FROM clean_transactions ct
    JOIN first_purchase fp USING (customer_id)
),

cohort_size AS (
    SELECT cohort_month, COUNT(DISTINCT customer_id) AS cohort_customers
    FROM first_purchase
    GROUP BY cohort_month
)

-- Retention table: rows = cohort month, columns = month number
SELECT
    TO_CHAR(cd.cohort_month, 'YYYY-MM') AS cohort,
    cd.month_number,
    COUNT(DISTINCT cd.customer_id)       AS retained_customers,
    cs.cohort_customers,
    ROUND(
        COUNT(DISTINCT cd.customer_id)::NUMERIC
        / cs.cohort_customers * 100, 1
    )                                    AS retention_rate
FROM cohort_data cd
JOIN cohort_size cs USING (cohort_month)
GROUP BY cd.cohort_month, cd.month_number, cs.cohort_customers
ORDER BY cd.cohort_month, cd.month_number;