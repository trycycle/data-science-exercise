CREATE TABLE 	"aisles" (
		"aisle_id" int primary key,
		"aisle" varchar(255)
);

CREATE TABLE 	"departments" (
		"department_id" int primary key,
		"department" varchar(255)
);

CREATE TABLE 	"products" (
		"product_id" int primary key,
		"product_name" varchar(255),
		"aisle_id" int,
		"department_id" int,
		foreign key (aisle_id) references aisles(aisle_id),
		foreign key (department_id) references departments(department_id)
);

CREATE TABLE 	"orders" (
		"order_id" int primary key,
		"user_id" int  NOT NULL,
		"eval_set" varchar(255),
		"order_number" int,
		"order_dow" int,
		"order_hour_of_day" int,
		"days_since_prior" int
);

CREATE TABLE 	"order_products" (
		"order_id" int  NOT NULL,
		"product_id" int  NOT NULL,
		"add_to_cart_order" int,
		"reordered" int,
		foreign key (order_id) references orders(order_id),
		foreign key (product_id) references products(product_id)
);


CREATE INDEX products_aisle_id_idx ON products(aisle_id);
CREATE INDEX products_department_id_idx ON products(department_id);
CREATE INDEX orders_user_id_idx ON orders(user_id);
CREATE INDEX order_products_order_id_idx ON order_products(order_id);
CREATE INDEX order_products_product_id_idx ON order_products(product_id);


.mode csv
.import csv/aisles.csv aisles
.import csv/departments.csv departments
.import csv/products.csv products
.import csv/orders.csv orders
.import csv/order_products__prior.csv order_products
.import csv/order_products__train.csv order_products
