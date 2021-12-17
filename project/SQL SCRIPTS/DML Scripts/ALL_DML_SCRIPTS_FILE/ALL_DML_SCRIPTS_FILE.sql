INSERT INTO product_information VALUES 
('DELL_246T', 'Dell Inspiron 246', 'Dell', '599.99', 'Intel Core i5 - 7th gen 7664Q', '8', '512GB', 'Windows 11 HOME - 1120', '15.6');

INSERT INTO laptops VALUES ('DELL_246T', 'Dell Inspiron 246', 'Dell', '599.99', 'DELL_246T');

INSERT INTO employee_data VALUES ('1648', 'Jack Leach', 'Cleaning Staff', '2021-08-08', '9746321598');

UPDATE employee_billing_details SET emp_work_hours = '10AM - 3:30PM' WHERE emp_id = '1987'

UPDATE employee_data SET emp_joining_date = '2021-09-09' WHERE emp_id = '1413';

UPDATE employee_data SET emp_role = 'Cleaning Manager' WHERE emp_id = '1648';

DELETE FROM employee_data WHERE emp_id = '1648';

SELECT * FROM laptops;

SELECT laptops.model_id, laptops.model_name, laptop_data.model_processor, laptop_data.model_hdd_size, laptop_data.model_operating_system FROM laptops
JOIN laptop_data ON laptops.model_id = laptop_data.model_id;

SELECT employee_data.emp_id, employee_data.emp_name, employee_data.emp_role, employee_billing_details.emp_work_hours, employee_billing_details.emp_payperhour FROM employee_data JOIN employee_billing_details ON employee_data.emp_id = employee_billing_details.emp_id;

SELECT sale_date,ROUND(SUM(sale_cost), 2) AS Total_Sales from sales_data WHERE sale_date = '2021-12-01';

SELECT model_company ,ROUND(SUM(model_cost), 2) AS Total_Worth from laptops WHERE model_company = 'Dell';

SELECT laptops.model_id, laptops.model_name, laptop_data.model_operating_system, laptop_data.model_processor, sales_data.sale_date, sales_data.sale_cost FROM laptops
LEFT JOIN laptop_data ON laptops.model_id = laptop_data.model_id
LEFT JOIN sales_data ON laptops.model_id = sales_data.model_id

SELECT laptops.model_id, laptops.model_name, laptop_data.model_processor, laptop_data.model_operating_system, laptops.model_cost FROM laptops
JOIN laptop_data ON laptops.model_id = laptop_data.model_id
WHERE laptops.model_cost < 750.99