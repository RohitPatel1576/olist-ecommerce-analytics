SELECT
    p.category,
    ROUND(SUM(oi.price), 2) AS revenue,
    ROUND(SUM(oi.price) * 100 / SUM(SUM(oi.price)) OVER (), 2) AS revenue_share_pct
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p     ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered'
GROUP BY p.category
ORDER BY revenue DESC
LIMIT 10;