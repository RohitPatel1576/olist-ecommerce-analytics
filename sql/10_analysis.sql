SELECT
    CASE WHEN o.is_late = 1 THEN 'Late' ELSE 'On time' END AS delivery_status,
    COUNT(*)                         AS orders_with_review,
    ROUND(AVG(r.review_score), 2)    AS avg_review_score
FROM orders o
JOIN reviews r ON o.order_id = r.order_id
WHERE o.is_late IS NOT NULL
GROUP BY delivery_status;