WITH sales_by_seller AS (
    SELECT 
        email AS seller, 
        DATE(date_day) AS date_day, 
        product_value, 
        product_quantity, 
        product_type 
    FROM 
        {{ ref('silver_sales') }}  
    WHERE 
        product_value < 6000 
        AND date_day >= '2024-09-01' 
        AND date_day <= '2024-09-11'
    ),
    sales_aggregated_seller AS (
        SELECT 
            seller, 
            date_day, 
            SUM(product_value) AS total_value, 
            SUM(product_quantity) AS total_quantity, 
            COUNT(*) AS total_sales
        FROM 
            sales_by_seller
        GROUP BY 
            seller, 
            date_day
    )
    SELECT 
        seller, 
        date_day, 
        total_value, 
        total_quantity, 
        total_vendas
    FROM 
        sales_aggregated_seller
    ORDER BY 