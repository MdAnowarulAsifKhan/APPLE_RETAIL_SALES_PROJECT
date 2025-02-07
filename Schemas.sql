-- Apple Retails Millions Rows Sales Schemas



/*

1. Import first to Category TABLE
2. Import to Product Table
3. Import to Stores Table
4. Import to Sales TABLE
5. Import to Warranty Table

*/

-- DROP TABLE command
DROP TABLE IF EXISTS warranty;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS stores;

-- CREATE TABLE commands

CREATE TABLE stores(
store_id VARCHAR(5) PRIMARY KEY,
store_name	VARCHAR(30),
city	VARCHAR(25),
country VARCHAR(25)
);

DROP TABLE IF EXISTS category;
CREATE TABLE category
(category_id VARCHAR(10) PRIMARY KEY,
category_name VARCHAR(20)
);

CREATE TABLE products
(
product_id	VARCHAR(10) PRIMARY KEY,
product_name	VARCHAR(35),
category_id	VARCHAR(10),
launch_date	date,
price FLOAT,
CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE sales
(
sale_id	VARCHAR(15) PRIMARY KEY,
sale_date	DATE,
store_id	VARCHAR(10), -- this fk
product_id	VARCHAR(10), -- this fk
quantity INT,
CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES stores(store_id),
CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE warranty
(
claim_id VARCHAR(10) PRIMARY KEY,	
claim_date	date,
sale_id	VARCHAR(15),
repair_status VARCHAR(15),
CONSTRAINT fk_orders FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);

-- Success Message
SELECT 'Schema created successful' as Success_Message;

 


