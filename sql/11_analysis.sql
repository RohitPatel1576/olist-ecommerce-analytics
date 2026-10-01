WITH seller_revenue AS (
    SELECT
        oi.seller_id,
        s.seller_state,
        COUNT(DISTINCT o.order_id) AS orders_count,
        ROUND(SUM(oi.price), 2)    AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN sellers s      ON oi.seller_id = s.seller_id
    WHERE o.order_status = 'delivered'
    GROUP BY oi.seller_id, s.seller_state
),
ranked AS (
    SELECT *, RANK() OVER (ORDER BY revenue DESC) AS rnk
    FROM seller_revenue
)
SELECT rnk, seller_id, seller_state, orders_count, revenue
FROM ranked
WHERE rnk <= 10
ORDER BY rnk;