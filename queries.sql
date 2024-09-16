-- last week Sales
        SELECT 
            DATE(date_time) AS date_day, 
            SUM(product_value) AS total_sales, 
            COUNT(*) AS total_transactions
        FROM 
            sales 
        WHERE 
            date_time >= CURRENT_DATE - INTERVAL '6 days' 
            AND date_time < CURRENT_DATE + INTERVAL '1 day' 
        GROUP BY 
            DATE(date_time) 
        ORDER BY 
            date_day DESC
    
-- sales with price value lesse than 6k
        SELECT 
            email, 
            date_time, 
            product_value, 
            product_quantity, 
            product_type 
        FROM 
            sales 
        WHERE 
            product_value < 6000 
            AND date_time >= '2024-09-01' 
            AND date_time <= '2024-09-11'
        ORDER BY 
            date_time ASC, 
            product_value DESC

-- aggregation of Sales by Day and Product
        WITH filtered_sales AS (
            SELECT 
                email, 
                DATE(date_time) AS date_day, 
                product_value, 
                product_quantity, 
                product_type 
            FROM 
                sales 
            WHERE 
                product_value < 6000 
                AND date_time >= '2024-09-01' 
                AND date_time <= '2024-09-11'
        ),
        aggregated_sales AS (
            SELECT 
                date_day, 
                product_type, 
                SUM(product_value) AS total_value, 
                SUM(product_quantity) AS total_quantity,
                COUNT(*) AS total_sales
            FROM 
                filtered_sales
            GROUP BY 
                date_day, 
                product_type
        )
        SELECT 
            date_day, 
            product_type, 
            total_value, 
            total_quantity, 
            total_sales
        FROM 
            aggregated_sales
        ORDER BY 
            date_day ASC, product_type ASC;
    
-- aggregation of Sales by seller
WITH sales_by_seller AS (
    SELECT 
        email AS seller, 
        DATE(data) AS date_day, 
        product_value, 
        product_quantity, 
        product_type 
    FROM 
        sales 
    WHERE 
        product_value < 6000 
        AND data >= '2024-09-01' 
        AND data <= '2024-09-11'
    ),
    vendas_aggregated_vendedor AS (
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
        date_day ASC, seller ASC;