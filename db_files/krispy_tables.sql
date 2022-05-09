Create table Customers(
Customer_ID int primary key,
FL_name varchar(64) NOT NULL,
Customer_Address varchar(124) NOT NULL,
Email varchar(124) NOT NULL,
Customer_Password varchar(124) NOT NULL
-- Number_Of_Orders int, this can go in account details
);

-- Insert into Customers values (11234, 'Person One', '112 My address street', 'myemail@gmail.com', 'mypass123' , 3);
-- Insert into Customers values (10293, 'Person Two', '116 My address street', 'myemail2@gmail.com', 'mypass123' , 20);

CREATE TABLE Blacklist(
FL_name varchar(64),
Customer_Address varchar(124),
Email varchar(124)
);

Create table Account_Details(
Customer_ID int primary key references Customers(Customer_ID),
top_dish_1 VARCHAR(64), -- upon account creation these 3 will be most popular
top_dish_2 VARCHAR(64), -- once customer orders we update these
top_dish_3 VARCHAR(64),
vip_status BIT(1) DEFAULT 0,
Account_balance DECIMAL (8,2) DEFAULT 0.0,
Money_Spent DECIMAL(8,2) DEFAULT 0.0,
num_orders int DEFAULT 0,
num_warnings int DEFAULT 0
);


-- Insert into Account_Details values (11234, 0, 33.15, 2);
-- Insert into Account_Details values (10293, 1, 125.32, 8);

-- Select *
-- From Account_Details;

-- option 1 store all employees in a single table, we are only required to have 4 total employees
-- benefits: all employee ID are garunteed to be unique
Create table Employee(
Employee_ID int primary key,
employee_position VARCHAR(30)

);

-- option 2 keep seperate tables for each employee type
-- benefit: might make Queries simpler and less error prone
-- if we use this implementation we can also assign default salaries
Create table Chefs(
Chef_ID int primary key,
FL_name varchar(64),
Email varchar(124),
Employee_Password varchar(124),
Salary INT,
Complaints_compliments TINYINT DEFAULT 0,
Avg_rating TINYINT DEFAULT 0,
Demotions TINYINT DEFAULT 0

);

Create table Deliverer(
Deliverer_ID int primary key,
FL_name varchar(64),
Email varchar(124),
Employee_Password varchar(124),
salary INT,
complaints_compliments TINYINT DEFAULT 0,
avg_rating TINYINT DEFAULT 0,
demotions TINYINT DEFAULT 0

);

-- im not sure this table is even necessary. We dont really need to store any infromation on the manager
-- since there is only 1 manager, and all he does is make decisions given a scenario
-- we can emulate a manager just using functions
CREATE TABLE manager(
manager_ID INT PRIMARY KEY,
FL_name VARCHAR(64),
Email VARCHAR(128),
manager_password VARCHAR (128)
);

-- Insert into Employees values (01, 'Manager Person', 'Manager', 'manager@gmail.com', 'mypass123');
-- Insert into Employees values (02, 'Cook 1 Person', 'Cook', 'Cook1@gmail.com', 'mypass123');
-- Insert into Employees values (03, 'Cook 2 Person', 'Cook', 'Cook2@gmail.com', 'mypass123');
-- Insert into Employees values (04, 'Cook 3 Person', 'Cook', 'Cook3@gmail.com', 'mypass123');
-- Insert into Employees values (05, 'Delivery 1 Person', 'Delivery Person', 'DeliveryPerson1@gmail.com', 'mypass123');
-- Insert into Employees values (06, 'Delivery 2 Person', 'Delivery Person', 'DeliveryPerson2@gmail.com', 'mypass123');
-- Insert into Employees values (07, 'Delivery 3 Person', 'Delivery Person', 'DeliveryPerson3@gmail.com', 'mypass123');

-- Select *
-- From Employees;
CREATE TABLE Menu(
item_name VARCHAR(64) PRIMARY KEY,
item_type VARCHAR(20), -- (ie. appetizer, entree, side, etc)
price DECIMAL(4,2),
special_item BIT(1) DEFAULT 0, -- 1 = special item, 0 = regular item
times_ordered INT DEFAULT 0, -- to track which dishes are most popular
chef_made VARCHAR(64) -- for rating purposes
);


CREATE TABLE Orders(
order_id INT PRIMARY KEY,
order_price DECIMAL(6,2),
customer_id INT, 
order_date DATETIME,
item_name VARCHAR(64),
delivery BIT(1), -- 1 = delivery, 0 = pickup
food_rating TINYINT 
);

-- THIS IS WHERE I STOPPED
CREATE TABLE Deliveries(
delivery_no INT PRIMARY KEY AUTO_INCREMENT,
delivery_id INT REFERENCES Deliverer(Deliverer_ID),
delivery_rating TINYINT,
bid TINYINT
);