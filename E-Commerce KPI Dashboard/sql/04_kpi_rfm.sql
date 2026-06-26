-- Step 1-3: Hitung RFM & Segmentasi (untuk dilihat hasilnya)

WITH rfm_base AS (
    SELECT
        customer_id,
        MAX(invoice_date)                              AS last_purchase,
        (SELECT MAX(invoice_date) FROM clean_transactions)
            - MAX(invoice_date)                        AS recency_days,
        COUNT(DISTINCT invoice_no)                    AS frequency,
        ROUND(SUM(total_sales)::NUMERIC, 2)           AS monetary
    FROM clean_transactions
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY recency_days DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC)    AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC)     AS m_score
    FROM rfm_base
),
rfm_segment AS (
    SELECT *,
        (r_score + f_score + m_score) AS rfm_total,
        CASE
            WHEN r_score >= 4 AND f_score >= 4 THEN 'Champions'
            WHEN r_score >= 3 AND f_score >= 3 THEN 'Loyal Customers'
            WHEN r_score >= 4 AND f_score <= 2 THEN 'Recent Customers'
            WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
            WHEN r_score = 1 AND f_score = 1   THEN 'Lost Customers'
            ELSE 'Potential Loyalists'
        END AS segment
    FROM rfm_scores
)

-- Tampilkan hasil segmentasi (opsional, untuk verifikasi)
SELECT * FROM rfm_segment
ORDER BY rfm_total DESC;

-- Buat view summary untuk Tableau (dengan CTE di dalamnya)
CREATE VIEW vw_rfm_summary AS
WITH rfm_base AS (
    SELECT
        customer_id,
        MAX(invoice_date)                              AS last_purchase,
        (SELECT MAX(invoice_date) FROM clean_transactions)
            - MAX(invoice_date)                        AS recency_days,
        COUNT(DISTINCT invoice_no)                    AS frequency,
        ROUND(SUM(total_sales)::NUMERIC, 2)           AS monetary
    FROM clean_transactions
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY recency_days DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC)    AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC)     AS m_score
    FROM rfm_base
),
rfm_segment AS (
    SELECT *,
        (r_score + f_score + m_score) AS rfm_total,
        CASE
            WHEN r_score >= 4 AND f_score >= 4 THEN 'Champions'
            WHEN r_score >= 3 AND f_score >= 3 THEN 'Loyal Customers'
            WHEN r_score >= 4 AND f_score <= 2 THEN 'Recent Customers'
            WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
            WHEN r_score = 1 AND f_score = 1   THEN 'Lost Customers'
            ELSE 'Potential Loyalists'
        END AS segment
    FROM rfm_scores
)
SELECT
    segment,
    COUNT(*)                                 AS customer_count,
    ROUND(AVG(monetary)::NUMERIC, 2)         AS avg_monetary,
    ROUND(AVG(recency_days)::NUMERIC, 1)     AS avg_recency,
    ROUND(AVG(frequency)::NUMERIC, 1)        AS avg_frequency
FROM rfm_segment
GROUP BY segment
ORDER BY avg_monetary DESC;