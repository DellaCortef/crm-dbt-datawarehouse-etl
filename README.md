# crm-dbt-datawarehouse-etl

**Data Pipeline using DBT**

To analyze the data we have in the **Sales** table, we will create a view and apply ETL, transforming the data between the bronze, silver and gold layers.

**DBT**

**DBT** is a tool specialized in performing data ETL. It has the Software Engineering structure for the Data area.

- <ins>Bronze</ins> Dataset:
    - copy of the raw dataset;

- <ins>Silver</ins> Dataset:
    - clear unfounded dates;
    - aggregation of sales in the last 7 days;

- <ins>Gold</ins> Dataset:
    - aggregation by day;
    - aggregation by value;