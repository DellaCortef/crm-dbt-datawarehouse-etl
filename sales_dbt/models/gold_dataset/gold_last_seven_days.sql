{{ config(materialized='view') }}

SELECT 
    date_day, 
    SUM(product_value) AS total_sales, 
    COUNT(*) AS total_transactions
FROM 
    {{ ref('silver_sales') }} 
WHERE 
    date_day >= CURRENT_DATE - INTERVAL '6 days' 
    AND date_day < CURRENT_DATE + INTERVAL '1 day' 
GROUP BY 
    DATE(date_day) 
ORDER BY 
    date_day DESC