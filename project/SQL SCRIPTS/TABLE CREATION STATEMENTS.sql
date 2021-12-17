-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-12 00:53:47.146

-- tables
-- Table: Laptops
CREATE TABLE Laptops (
    model_id varchar(40) NOT NULL,
    model_name char(30) NOT NULL,
    model_company char(20) NOT NULL,
    model_cost float(10) NOT NULL,
    product_information_model_id varchar(40) NOT NULL,
    CONSTRAINT model_id PRIMARY KEY (model_id)
);

CREATE INDEX Laptops_index_cost ON Laptops (model_cost);

CREATE INDEX Laptops_index_company ON Laptops (model_company);

-- Table: customer_data
CREATE TABLE customer_data (
    model_id varchar(40) NOT NULL,
    model_cost float(10) NOT NULL,
    purchase_date date NOT NULL,
    mode_of_payment char(10) NOT NULL,
    customer_name char(20) NOT NULL,
    Laptops_model_id varchar(40) NOT NULL
);

-- Table: employee_billing_details
CREATE TABLE employee_billing_details (
    emp_id int(10) NOT NULL,
    emp_work_hours varchar(20) NOT NULL,
    emp_hours_per_week int(5) NOT NULL,
    emp_payperhour float(5) NOT NULL,
    employee_data_emp_id int(10) NOT NULL
);

-- Table: employee_data
CREATE TABLE employee_data (
    emp_id int(10) NOT NULL,
    emp_name char(20) NOT NULL,
    emp_role char(30) NOT NULL,
    emp_joining_date date NOT NULL,
    emp_phno int(50) NOT NULL,
    CONSTRAINT employee_data_pk PRIMARY KEY (emp_id)
);

-- Table: laptop_data
CREATE TABLE laptop_data (
    model_id varchar(40) NOT NULL,
    model_processor varchar(30) NOT NULL,
    model_ram_size int(5) NOT NULL,
    model_hdd_size varchar(10) NOT NULL,
    model_operating_system varchar(20) NOT NULL,
    model_screen_size float(10) NOT NULL,
    Laptops_model_id varchar(40) NOT NULL
);

CREATE INDEX laptop_data_processor ON laptop_data (model_processor);

-- Table: product_information
CREATE TABLE product_information (
    model_id varchar(40) NOT NULL,
    model_name char(30) NOT NULL,
    model_company char(20) NOT NULL,
    model_cost float(10) NOT NULL,
    model_processor varchar(30) NOT NULL,
    model_ram_size int(5) NOT NULL,
    model_hdd_size varchar(10) NOT NULL,
    model_operating_system varchar(20) NOT NULL,
    model_screen_size float(10) NOT NULL,
    CONSTRAINT product_information_pk PRIMARY KEY (model_id)
);

-- Table: sales_data
CREATE TABLE sales_data (
    model_id varchar(40) NOT NULL,
    model_name char(30) NOT NULL,
    sale_date date NOT NULL,
    sale_cost float(10) NOT NULL,
    Laptops_model_id varchar(40) NOT NULL
);

-- foreign keys
-- Reference: Laptops_product_information (table: Laptops)
ALTER TABLE Laptops ADD CONSTRAINT Laptops_product_information FOREIGN KEY Laptops_product_information (product_information_model_id)
    REFERENCES product_information (model_id);

-- Reference: customer_data_Laptops (table: customer_data)
ALTER TABLE customer_data ADD CONSTRAINT customer_data_Laptops FOREIGN KEY customer_data_Laptops (Laptops_model_id)
    REFERENCES Laptops (model_id);

-- Reference: employee_billing_details_employee_data (table: employee_billing_details)
ALTER TABLE employee_billing_details ADD CONSTRAINT employee_billing_details_employee_data FOREIGN KEY employee_billing_details_employee_data (employee_data_emp_id)
    REFERENCES employee_data (emp_id);

-- Reference: laptop_data_Laptops (table: laptop_data)
ALTER TABLE laptop_data ADD CONSTRAINT laptop_data_Laptops FOREIGN KEY laptop_data_Laptops (Laptops_model_id)
    REFERENCES Laptops (model_id);

-- Reference: sales_data_Laptops (table: sales_data)
ALTER TABLE sales_data ADD CONSTRAINT sales_data_Laptops FOREIGN KEY sales_data_Laptops (Laptops_model_id)
    REFERENCES Laptops (model_id);

-- End of file.

