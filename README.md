# crm-dbt-datawarehouse-etl

This repository is part of the CRM Analytics development series. We will apply sales data analysis with **SQL**, looking for patterns in sales.


### CRM Analytics Development Series ###

The CRM development series has three stages:


**data-pipeline-pocket-reference:**

-  Repository focused on Data Engineering. We will build a front-end integration with Postgre. Based on the sales input data, this data will automatically be stored in the DB. We will apply *contract data* rules to ensure data consistency.

**crm-dbt-datawarehouse-etl:**

- repository focused on applying the necessary transformations to the data, using **DBT** as a tool. We will create our *medallion* layers, such as bronze, silver and gold, and apply the business rules to create the necessary tables or views for Business.

** :**

- 


### Analytics Engineering Process
**Data Pipeline using DBT**

To analyze the data we have in the **Sales** table, we will create a view and apply ETL, transforming the data between the bronze, silver and gold layers.

**DBT** is a tool specialized in performing data ETL. It has the Software Engineering structure for the Data area.

-> **<ins>Bronze</ins>** Dataset:
- copy of the raw dataset;

-> **<ins>Silver</ins>** Dataset:

- clear unfounded dates;
- aggregation of sales in the last 7 days;

-> **<ins>Gold</ins>** Dataset:
- aggregation by day;
- aggregation by value;