CREATE TABLE employee
(Employee_ID Char(5) Not Null,
First_Name VarChar(100) Not Null,
Last_Name VarChar(100) Not Null,
Contact Char(9) Not Null,
Gender Char(1) Not Null,
PRIMARY KEY (Employee_ID))

CREATE TABLE dataset
(Dataset_ID Char(2) Not Null,
Dataset_Name VarChar(100) Not Null,
PRIMARY KEY (Dataset_ID))

CREATE TABLE customer
(Customer_ID Char(5) Not Null,
First_Name VarChar(100) Not Null,
Last_Name VarChar(100) Not Null,
Contact Char(8) Not Null,
Company_Name VarChar(100) Not Null,
PRIMARY KEY (Customer_ID))

CREATE TABLE model
(Model_ID Char(5) Not Null,
Model_Type VarChar(100) Not Null,
Train_Date Char(10) Not Null,
Accuracy Decimal(3,1) Not Null,
Parent_Model_ID Char(5) Null,
Dataset_ID Char(2) Not Null,
PRIMARY KEY (Model_ID),
FOREIGN KEY (Parent_Model_ID) references model(Model_ID),
FOREIGN KEY (Dataset_ID) references dataset(Dataset_ID))

CREATE TABLE customer_order
(Order_ID VarChar(10) Not Null,
Accuracy Decimal(3,1) Not Null,
Order_Date Char(10) Not Null,
Completion_Date Char(10) Not Null,
Customer_ID Char(5) Not Null,
Model_Type VarChar(100) Null,
PRIMARY KEY (Order_ID),
FOREIGN KEY (Customer_ID) REFERENCES customer(Customer_ID))

CREATE TABLE solution
(Model_ID Char(5) Not Null,
Order_ID VarChar(10) Not Null,
Employee_ID Char(5) Not Null,
Date_Assigned Char(10) Not Null,
PRIMARY KEY (Order_ID, Employee_ID, Model_ID),
FOREIGN KEY (Order_ID) REFERENCES customer_order(Order_ID),
FOREIGN KEY (Employee_ID) REFERENCES employee(Employee_ID),
FOREIGN KEY (Model_ID) REFERENCES model(Model_ID))

--ALTER TABLE customer_order
--ALTER COLUMN Order_ID VarChar(10) Not Null
--DROP TABLE IF EXISTS solution;

--INSERT DATA INTO TABLES
SELECT * FROM customer
SELECT * FROM employee
SELECT * FROM dataset
SELECT * FROM model
SELECT * FROM customer_order
SELECT * FROM solution

SELECT * from customer_order
SELECT * from model
  SELECT * from solution

INSERT INTO customer (Customer_ID, First_Name, Last_Name, Contact, Company_Name) VALUES 
('c1231', 'Macie', 'Chew', '21313445', 'Power AI Ltd.'),
('c2231', 'June', 'Gu', '23591312', 'Fish and Dogs'),
('c3231', 'Miller', 'Wu', '34513265', 'Smart Commute'),
('c4231', 'Paul', 'Halim', '11390442', 'B&C Furniture'),
('c5231', 'Bella', 'Tan', '75813435', 'City Drainage'),
('c6231', 'Kiara', 'Sakura', '24634521', 'City Power'),
('c7231', 'Bowen', 'Han', '75643524', 'Country Development');

INSERT INTO employee (Employee_ID, First_Name, Last_Name, Contact, Gender) VALUES
('s1111', 'Peter', 'Phua', '142524124', 'M'),
('s2222', 'George', 'Mason', '344324251', 'M'),
('s3333', 'Francis', 'Lee', '234235246', 'M'),
('s4444', 'Alice', 'Wong', '324567342', 'F'),
('s5555', 'William', 'Chong', '893456114', 'M'),
('s6666', 'Brilliant', 'Dior', '907456251', 'F');

INSERT INTO dataset(Dataset_ID, Dataset_Name) VALUES
('d1', 'Adult'),
('d2', 'River'),
('d3', 'Arizona'),
('d4', 'Vermont'),
('d5', 'Covertype'),
('d6', 'Iris');

INSERT INTO model(Model_ID, Model_Type, Train_Date, Accuracy, Parent_Model_ID, Dataset_ID) VALUES
('m1000', 'Decision Tree', '2024-01-01', 95.6, NULL, 'd1'),
('m1001', 'Linear Regression', '2024-01-05', 60.4, NULL, 'd2'),
('m1002', 'Random Forest', '2024-01-07', 95.3, NULL, 'd3'),
('m1003', 'Decision Tree', '2024-01-08', 53.2, NULL, 'd4'),
('m1004', 'Linear Regression', '2024-01-11', 52.9, NULL, 'd2'),
('m1005', 'Linear Regression', '2024-01-15', 91.7, 'm1001', 'd5'),
('m1006', 'Random Forest', '2024-01-17', 85.7, NULL, 'd3'),
('m1007', 'k-Nearest Neighbour', '2024-01-22', 85.7, NULL, 'd5'),
('m1008', 'Support Vector Machine', '2024-01-23', 50.6, NULL, 'd3'),
('m1009', 'k-Nearest Neighbour', '2024-01-24', 51.9, 'm1007', 'd2'),
('m1010', 'Decision Tree', '2024-01-27', 93.7, 'm1003', 'd2'),
('m1011', 'Support Vector Machine', '2024-01-30', 83.1, NULL, 'd4'),
('m1012', 'Support Vector Machine', '2024-02-06', 97.6, 'm1011', 'd2'),
('m1013', 'k-Nearest Neighbour', '2024-02-07', 90.3, 'm1009', 'd2'),
('m1014', 'k-Nearest Neighbour', '2024-02-08', 59.3, NULL, 'd2'),
('m1015', 'Random Forest', '2024-02-12', 59.4, 'm1006', 'd6'),
('m1016', 'Naive Bayes', '2024-03-04', 70.6, NULL, 'd3'),
('m1017', 'Neural Network', '2024-03-06', 95.5, NULL, 'd6'),
('m1018', 'Logistic Regression', '2024-03-12', 54.1, NULL, 'd2'),
('m1019', 'Neural Network', '2024-03-15', 96.8, NULL, 'd6'),
('m1020', 'Neural Network', '2024-03-17', 85.5, 'm1019', 'd4'),
('m1021', 'Logistic Regression', '2024-03-21', 60.2, NULL, 'd5'),
('m1022', 'Random Forest', '2024-03-22', 67.1, NULL, 'd4'),
('m1023', 'Neural Network', '2024-03-27', 90.5, 'm1020', 'd6'),
('m1024', 'Random Forest', '2024-03-28', 85.9, 'm1015', 'd3');

INSERT INTO customer_order(Order_ID, Accuracy, Order_Date, Completion_Date, Customer_ID, Model_Type) VALUES
('o080214', 70.0, '2024-04-21', '2024-04-22', 'c5231', 'Decision Tree'),
('o241134', 99.9, '2024-05-01', '2024-07-01', 'c7231', Null),
('o214132', 50.0, '2024-04-08', '2024-05-01', 'c7231', Null),
('o174143', 70.0, '2024-04-14', '2024-04-18', 'c7231', Null),
('o22031', 50.0, '2024-04-05', '2024-04-27', 'c2231', Null),
('o31421', 1.0, '2024-04-11', '2025-01-01', 'c6231', Null),
('o00001', 60.0, '2024-05-02', '2024-05-31', 'c1231', 'Support Vector Machine, Random Forest'),
('o11213', 80.0, '2024-04-03', '2024-04-11', 'c1231', 'Support Vector Machine'),
('o12345', 77.0, '2024-04-05', '2024-06-30', 'c3231', Null),
('o12346', 56.0, '2024-04-05', '2024-04-30', 'c3231', Null);

-- Bella Tan
INSERT INTO solution (Model_ID, Order_ID, Employee_ID, Date_Assigned) VALUES
('m1018', 'o080214', 's2222', '2024-04-22'),
('m1003', 'o080214', 's3333', '2024-04-22'),
('m1010', 'o080214', 's4444', '2024-04-22');

-- Bowen Han
INSERT INTO solution (Model_ID, Order_ID, Employee_ID, Date_Assigned) VALUES
('m1021', 'o214132', 's5555', '2024-04-09'),
('m1008', 'o174143', 's4444', '2024-04-14');

-- June Gu
INSERT INTO solution (Model_ID, Order_ID, Employee_ID, Date_Assigned) VALUES
('m1013', 'o22031', 's1111', '2024-04-11'),
('m1013', 'o22031', 's3333', '2024-04-12'),
('m1013', 'o22031', 's2222', '2024-04-15'),
('m1013', 'o22031', 's4444', '2024-04-07'),
('m1013', 'o22031', 's6666', '2024-04-27'),
('m1013', 'o22031', 's5555', '2024-04-28'),
('m1022', 'o22031', 's1111', '2024-04-19');

-- Kiara Sakura
INSERT INTO solution (Model_ID, Order_ID, Employee_ID, Date_Assigned) VALUES
('m1001', 'o31421', 's2222', '2024-04-15'),
('m1002', 'o31421', 's2222', '2024-04-15');

-- Macie Chew
INSERT INTO solution (Model_ID, Order_ID, Employee_ID, Date_Assigned) VALUES
('m1012', 'o00001', 's1111', '2024-05-02'),
('m1022', 'o00001', 's6666', '2024-05-02'),
('m1013', 'o00001', 's5555', '2024-05-02'),
('m1003', 'o11213', 's3333', '2024-04-10'),
('m1011', 'o11213', 's3333', '2024-04-08'),
('m1012', 'o11213', 's3333', '2024-04-09'),
('m1012', 'o11213', 's4444', '2024-04-04');

-- Miller Wu
INSERT INTO solution (Model_ID, Order_ID, Employee_ID, Date_Assigned) VALUES
('m1018', 'o12345', 's1111', '2024-05-31'),
('m1019', 'o12345', 's3333', '2024-05-31'),
('m1015', 'o12346', 's2222', '2024-05-31'),
('m1023', 'o12346', 's4444', '2024-05-31'),
('m1021', 'o12346', 's6666', '2024-05-31');
