SELECT laptops.model_id, laptops.model_name, laptop_data.model_processor, laptop_data.model_hdd_size, laptop_data.model_operating_system FROM laptops
JOIN laptop_data ON laptops.model_id = laptop_data.model_id;

SELECT employee_data.emp_id, employee_data.emp_name, employee_data.emp_role, employee_billing_details.emp_work_hours, employee_billing_details.emp_payperhour FROM employee_data JOIN employee_billing_details ON employee_data.emp_id = employee_billing_details.emp_id;
