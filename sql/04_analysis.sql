WITH monthly AS (
    SELECT
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS order_month,
        ROUND(SUM(oi.price), 2)                          AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY order_month
),
with_prev AS (
    SELECT
        order_month,
        revenue,
        LAG(revenue) OVER (ORDER BY order_month) AS prev_month_revenue
    FROM monthly
)
SELECT
    order_month,
    revenue,
    prev_month_revenue,
    ROUND((revenue - prev_month_revenue) / NULLIF(prev_month_revenue, 0) * 100, 2) AS mom_growth_pct
FROM with_prev
ORDER BY order_month;