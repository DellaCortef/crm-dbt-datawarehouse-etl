{{ config(materialized='view') }}

WITH cleaned_data AS (
    SELECT 
        email, 
        DATE(date_time) AS date_day,
        product_value, 
        product_quantity, 
        product_type
    FROM 
        {{source ('bronze_sales') }}
    WHERE 
        product_value > 0 
        AND product_value < 8000
        AND date_time <= CURRENT_DATE
)

SELECT * FROM cleaned_data