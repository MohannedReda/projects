create database pizaa;
create table pizza 
(
pizza_id int primary key ,
order_id int not null , 
pizza_name_id varchar(255),
quantity int,
order_date date,
order_time time , 
unit_price decimal(5,2),
total_price decimal(5,2),
pizza_size varchar(25),
pizza_category varchar(25),
pizza_ingredients varchar(255),
pizza_name varchar(255)
);


LOAD DATA LOCAL INFILE 'D:\ãÔÇÑíÚ\6-excel\Pizza Sales Analysis Dashboard\pizza_sales.csv'
INTO TABLE pizza
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
