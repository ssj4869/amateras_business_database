SELECT laptops.model_id, laptops.model_name, laptop_data.model_processor, laptop_data.model_operating_system, laptops.model_cost FROM laptops
JOIN laptop_data ON laptops.model_id = laptop_data.model_id
WHERE laptops.model_cost < 750.99