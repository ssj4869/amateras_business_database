SELECT laptops.model_id, laptops.model_name, laptop_data.model_operating_system, laptop_data.model_processor, sales_data.sale_date, sales_data.sale_cost FROM laptops
LEFT JOIN laptop_data ON laptops.model_id = laptop_data.model_id
LEFT JOIN sales_data ON laptops.model_id = sales_data.model_id

