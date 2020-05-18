/*********************
Create Database
*********************/
CREATE DATABASE IF NOT EXISTS `instacart` ;
USE `instacart`;


/*********************
Create Tables
*********************/
CREATE TABLE `aisles` (
  `aisle_id` int NOT NULL,
  `aisle` varchar(255) NOT NULL,
  PRIMARY KEY (`aisle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `departments` (
  `department_id` int NOT NULL,
  `department` varchar(255) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `aisle_id` int NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `products_aisle_id_idx` (`aisle_id`),
  KEY `products_department_id_idx` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `eval_set` varchar(255) NOT NULL,
  `order_number` int NOT NULL,
  `order_dow` int NOT NULL,
  `order_hour_of_day` int NOT NULL,
  `days_since_prior` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `eval_set_idx` (`eval_set`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order_products` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `add_to_cart_order` int NOT NULL,
  `reordered` tinyint NOT NULL,
  KEY `order_products_order_id_idx` (`order_id`),
  KEY `order_products_product_id_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



/*********************
Import data from CSV files
*********************/
SET PERSIST local_infile= 1;

LOAD DATA LOCAL INFILE "csv/aisles.csv"
INTO TABLE aisles 
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"';

LOAD DATA LOCAL INFILE "csv/departments.csv"
INTO TABLE departments
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"';

LOAD DATA LOCAL INFILE "csv/products.csv"
INTO TABLE products 
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"';

LOAD DATA LOCAL INFILE "csv/orders.csv"
INTO TABLE orders 
FIELDS TERMINATED BY ',' 
(order_id, user_id, eval_set, order_number, order_dow, order_hour_of_day,@days_since_prior_raw)                                                                                                                             
SET days_since_prior = case @days_since_prior_raw WHEN '' THEN NULL ELSE @days_since_prior_raw END;

LOAD DATA LOCAL INFILE "csv/order_products__prior.csv"
INTO TABLE order_products
FIELDS TERMINATED BY ',';

LOAD DATA LOCAL INFILE "csv/order_products__train.csv"
INTO TABLE order_products
FIELDS TERMINATED BY ',';