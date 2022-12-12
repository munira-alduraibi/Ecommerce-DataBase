CREATE SCHEMA e_commerce ;

# creation of tables 
CREATE TABLE customer (
customer_id		CHAR(4) NOT NULL,
customer_name	VARCHAR(20),
addr_state 		VARCHAR(20),
addr_city 		VARCHAR(20),
addr_zipcode	INT(5),
addr_street 	VARCHAR(20),
CONSTRAINT customer_PK PRIMARY KEY (customer_id)
);

CREATE TABLE employee (
employee_id		CHAR(4) NOT NULL,
phone_number 	VARCHAR(10),
positions 		VARCHAR(20) CHECK( positions IN ('seller' , 'assistant' , 'manger','marketer')),
CONSTRAINT employee_PK PRIMARY KEY (employee_id)
);

CREATE TABLE orders (
order_id		CHAR(4) NOT NULL,
order_time 		VARCHAR(6),
order_status	VARCHAR(20),
employee_id		CHAR(4),
customer_id		CHAR(4),
CONSTRAINT order_PK PRIMARY KEY (order_id),
CONSTRAINT orders_FK1 FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT orders_FK2 FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE SET NULL ON UPDATE CASCADE
);





CREATE TABLE invoice (
invoice_number		CHAR(4) NOT NULL,
invoice_date 		VARCHAR(20),
order_id			CHAR(4),
customer_id			CHAR(4),
CONSTRAINT invoice_PK PRIMARY KEY (invoice_number),
CONSTRAINT invoice_FK1 FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT invoice_FK2 FOREIGN KEY (customer_id	) REFERENCES customer(customer_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE products (
product_serial_number CHAR(4) NOT NULL,
product_name		VARCHAR(20),
quantity			INT(4)NOT NULL,
price 				INT(5),
order_id			CHAR(4),
CONSTRAINT products_PK PRIMARY KEY (product_serial_number, quantity),
CONSTRAINT products_FK1 FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE SET NULL ON UPDATE CASCADE
);





CREATE TABLE product_date (
product_serial_number CHAR(4) NOT NULL,
production_date 	  VARCHAR(20) NOT NULL,
expiry_date 		  VARCHAR(20),
CONSTRAINT product_date_PK PRIMARY KEY (product_serial_number , production_date),
CONSTRAINT product_date_FK1 FOREIGN KEY (product_serial_number) REFERENCES products(product_serial_number) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE section (
product_serial_number CHAR(4) NOT NULL,
section_name 		  VARCHAR(20) NOT NULL,
CONSTRAINT section_PK PRIMARY KEY (product_serial_number , section_name),
CONSTRAINT section_FK1 FOREIGN KEY (product_serial_number) REFERENCES products(product_serial_number) ON DELETE CASCADE ON UPDATE CASCADE
);






# insering in tables 
INSERT INTO customer
VALUES ('2345','hind','makkah','makkah',33945, 'alessa');
INSERT INTO customer
VALUES ('6538','sarah','riyadh', 'almuzahmiyah', 68909, 'alfraa');
INSERT INTO customer
VALUES ('7832', 'saleh','makkah', 'taif',89441,'qouraish');
INSERT INTO customer
VALUES ('4732','maram','riyadh','riyadh',32456,'Othman');
INSERT INTO customer
VALUES ('7898','abdullah','damam','damam',56794,'fisaleh');
# show the whloe table
SELECT * 
FROM customer;

INSERT INTO employee
VALUES ('1111','56783746','seller');
INSERT INTO employee
VALUES ('1112','58374658','assistant');
INSERT INTO employee
VALUES ('1113','50378575','manger');
INSERT INTO employee
VALUES ('1114','55384950','seller');
INSERT INTO employee
VALUES ('1115','54384562','marketer');
# show the whloe table
SELECT * 
FROM employee;



INSERT INTO orders
VALUES ('0101','23:00','processing','1111','2345');
INSERT INTO orders
VALUES ('0102','13:16','Not started','1112','6538');
INSERT INTO orders
VALUES ('0103','20:31','done','1113','7832');
INSERT INTO orders
VALUES ('0104','01:00','Not started','1114','4732');
INSERT INTO orders
VALUES ('0105','03:00','Not started','1111','7898');
# show the whloe table
SELECT * 
FROM orders;

INSERT INTO invoice
VALUES ('1','9/11/2021','0101','2345');
INSERT INTO invoice
VALUES ('2','10/11/2021','0102','6538');
INSERT INTO invoice
VALUES ('3','11/11/2021','0103','7832');
INSERT INTO invoice
VALUES ('4','12/11/2021','0104','4732');
INSERT INTO invoice
VALUES ('5','13/11/2021','0105','7898');
# show the whloe table
SELECT * 
FROM invoice;




INSERT INTO products
VALUES ('1234','Coffee beans A','1','58','0101');
INSERT INTO products
VALUES ('1235','grinder','3','200','0102');
INSERT INTO products
VALUES ('1234','Coffee beans A','8','58', NULL);
INSERT INTO products
VALUES ('1237','Water heater','4','300', NULL);
INSERT INTO products
VALUES ('1238','Coffee beans b','1','40','0105');
INSERT INTO products
VALUES ('1239','Coffee beans c','4','32',NULL);
# show the whloe table
SELECT * 
FROM products;

INSERT INTO product_date
VALUES ('1234','12-oct-2021','1-nov-2022');
INSERT INTO product_date
VALUES ('1235','9-aug-2021','9-aug-2026');
INSERT INTO product_date
VALUES ('1234','1-sep-2021','1-oct-2022');
INSERT INTO product_date
VALUES ('1237','5-april-2020','5-april-2021');
INSERT INTO product_date
VALUES ('1238','3-dec-2021','3-dec-2022');
INSERT INTO product_date
VALUES ('1239','1-jan-2021','1-jan-2022');
# show the whloe table
SELECT * 
FROM product_date;

INSERT INTO section
VALUES ('1234','beans');
INSERT INTO section
VALUES ('1235','tools');
INSERT INTO section
VALUES ('1237','tools');
INSERT INTO section
VALUES ('1238','beans');
INSERT INTO section
VALUES ('1239','beans');
# show the whloe table
SELECT * 
FROM section;




# update order number 0101 statues from processing to done
UPDATE orders
SET order_status ='done'
WHERE order_status ='processing' 
AND order_id = '0101';

SELECT * 
FROM orders;



# delete product number 1239 becuase it has been expired 
DELETE FROM products
WHERE product_serial_number = '1238';

SELECT * 
FROM products;


# 1. show invotery "not ordered"
SELECT product_serial_number, product_name, quantity
FROM products 
WHERE order_id IS NULL;


# 2. show all info about the employee's who has a positions as seller 
SELECT employee_id , phone_number
FROM employee 
WHERE positions ='seller';


# 3. list the invoice's as latest added in descending order 
SELECT invoice_number,order_id
FROM invoice
ORDER BY invoice_number DESC;


# 4. show all the customers info in asceding order depdenig on their names 
SELECT *
FROM customer
ORDER BY customer_name;


# 5. show all orders that are not started 
SELECT *
FROM orders 
WHERE order_status ='Not started';


# 6. show products serial number in the tools section
SELECT product_serial_number
FROM section 
WHERE section_name ='tools';


# 7. show all products in the invotery "not ordered" and thier price should be less than 200
SELECT product_name, SUM(quantity) as all_quantity
FROM products
WHERE order_id IS NULL
GROUP BY product_name 
HAVING  SUM(price)<200;


# 8. show employee that has repated positions "more than 1"
SELECT positions,COUNT(employee_id)AS count
FROM  employee
GROUP BY  positions
HAVING COUNT(employee_id)>1;



# 9. show the empolyee info that worked on order number 0102
SELECT *
FROM employee
WHERE employee_id = ( SELECT employee_id
					  FROM orders 
					  WHERE order_id='0102' );



# 10. show custmers id and names and all info about thier orders 
SELECT  c.customer_id , customer_name , order_id , order_time , order_status , employee_id , o.customer_id
FROM customer c , orders o
WHERE c.customer_id = o.customer_id
ORDER BY order_time;
