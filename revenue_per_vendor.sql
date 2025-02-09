SELECT 
    v.vendor_id,
    v.vendor_name,
    v.vendor_type,
    COUNT(DISTINCT cp.customer_id) AS customers,
    ROUND(SUM(cp.quantity * cp.cost_to_customer_per_qty),
            2) AS revenue
FROM
    farmers_market.vendor AS v
        LEFT JOIN
    farmers_market.customer_purchases AS cp ON v.vendor_id = cp.vendor_id
GROUP BY vendor_id
ORDER BY revenue DESC

