
SELECT sale_date,ROUND(SUM(sale_cost), 2) AS Total_Sales from sales_data WHERE sale_date = '2021-12-01';

SELECT model_company ,ROUND(SUM(model_cost), 2) AS Total_Worth from laptops WHERE model_company = 'Dell';
