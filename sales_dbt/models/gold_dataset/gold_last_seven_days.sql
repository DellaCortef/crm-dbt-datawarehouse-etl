{{ config(materialized='view') }}

WITH sales_seven_days AS (
    SELECT 
        date_day, 
        product_type, 
        SUM(product_value) AS total_sales, 
        SUM(product_quantity) AS total_quantity, 
        COUNT(*) AS total_transactions
    FROM 
        {{ ref('silver_sales') }}
    WHERE 
        date_day >= CURRENT_DATE - INTERVAL '6 days'
    GROUP BY 
        date_day, product_type
)

    SELECT 
        date_day, 
        product_type, 
        total_sales, 
        total_quantity, 
        total_transactions
    FROM 
        sales_seven_days
    ORDER BY 
        date_day ASC