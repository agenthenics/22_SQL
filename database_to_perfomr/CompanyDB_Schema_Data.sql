
-- Create Database
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

-- Department Table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

-- Employee Table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    hire_date DATE,
    dept_id INT,
    salary DECIMAL(10, 2),
    age INT,
    FOREIGN KEY (manager_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(50)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Sample Data

-- Departments
INSERT INTO Department VALUES 
(1, 'Engineering'), (2, 'Sales'), (3, 'HR'), (4, 'Marketing');

-- Employees
INSERT INTO Employee VALUES 
(101, 'Alice', NULL, '2015-06-20', 1, 90000, 40),
(102, 'Bob', 101, '2017-07-15', 1, 75000, 35),
(103, 'Charlie', 101, '2018-08-10', 2, 72000, 38),
(104, 'David', 102, '2019-04-25', 2, 68000, 30),
(105, 'Eva', 101, '2016-03-12', 3, 60000, 45),
(106, 'Frank', 105, '2020-02-11', 3, 58000, 29),
(107, 'Grace', 101, '2021-09-01', 4, 55000, 32),
(108, 'Heidi', 105, '2022-01-17', 4, 52000, 27),
(109, 'Ivan', 101, '2023-05-03', 1, 50000, 25);

-- Customers
INSERT INTO Customer VALUES
(1, 'Customer A', 'North'),
(2, 'Customer B', 'South'),
(3, 'Customer C', 'East'),
(4, 'Customer D', 'West'),
(5, 'Customer E', 'East');

-- Orders
INSERT INTO Orders VALUES
(201, 1, '2024-01-05', 250.00),
(202, 2, '2024-01-15', 300.00),
(203, 1, '2024-02-20', 450.00),
(204, 3, '2024-03-05', 200.00),
(205, 2, '2024-03-15', 600.00),
(206, 1, '2024-04-01', 500.00),
(207, 4, '2024-04-10', 100.00),
(208, 2, '2024-04-20', 700.00),
(209, 5, '2024-04-25', 150.00),
(210, 1, '2024-05-05', 300.00),
(211, 2, '2024-05-15', 200.00),
(212, 2, '2024-06-01', 500.00);

-- Products
INSERT INTO Product VALUES
(301, 'Mouse'),
(302, 'Keyboard'),
(303, 'Monitor'),
(304, 'USB Cable'),
(305, 'Laptop Stand'),
(306, 'Webcam');

-- Order Details
INSERT INTO OrderDetails VALUES
(401, 201, 301, 2),
(402, 202, 302, 1),
(403, 203, 303, 1),
(404, 204, 304, 3),
(405, 205, 302, 2),
(406, 206, 305, 1),
(407, 207, 303, 1),
(408, 208, 301, 4),
(409, 209, 306, 2);
