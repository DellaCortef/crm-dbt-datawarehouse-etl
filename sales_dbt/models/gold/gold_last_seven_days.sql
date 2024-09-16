{{ config(materialized='view') }}

SELECT 
    DATE(date_time) AS date_day, 
    SUM(product_value) AS total_sales, 
    COUNT(*) AS total_transactions
FROM 
    {{source ('silver_sales') }} 
WHERE 
    date_time >= CURRENT_DATE - INTERVAL '6 days' 
    AND date_time < CURRENT_DATE + INTERVAL '1 day' 
GROUP BY 
    DATE(date_time) 
ORDER BY 
    date_day DESC