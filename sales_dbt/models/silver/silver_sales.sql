{{ config(materialized='view') }}

WITH cleaned_data AS (
    SELECT 
        email, 
        DATE(data) AS date_day,
        product_value, 
        product_quantity, 
        product_type
    FROM 
        {{ ref('bronze_vendas') }}
    WHERE 
        product_value > 0 
        AND product_value < 8000
        AND data <= CURRENT_DATE
)

SELECT * FROM cleaned_data