# Database for Ecommerce store 💳

## What?
This project is meant for designing a database for an Ecommerce store that sells coffee beans and Equipments.

### Business Rules 

The online store sells different PRODUCTs of coffee beans and tools each product has a name, and a unique product_serial_number, each product has the following additional attributes: a product_price. and the product production_date, and expiry_date, and
 product_quantity which used with the product_serial_number to distinguish which products is ordered and which is in the inventory. 

The online store keeps records of all previous customers, for marketing reasons, therefore each customer may or may not submit an order and may or may not issue an invoice, The identifier for CUSTOMER is customer_id and other attributes are name and address, each customer has one address, each CUSTOMER can place one or many ORDERS, 

The identifier for an order is order_id ,and other attributes are order_time and order status, each ORDER contain one or more PRODUCTs, 
many ORDERs is made by one EMPLOYEE .

The identifier for INVOICE is the invoice_number, and other attributes are invoice_date, and the total,  each INVOICE include one ORDER, and one or more INVOICE is issued for one CUSTOMER 

The online coffee store has several EMPLOYEEs the identifier for an employee is employee_id , other attributes include a specific position, phone number.

The identifier for SECTIONs is a section_name, and every SECTION consists of products. 

### Chen’s Notation
<img width="591" hight="591" alt="Chen’s Notation of the database"  src="https://user-images.githubusercontent.com/80950031/207366314-4836db09-1f0a-4aca-aa2c-eb74eec5a9dd.png">

### UML Notation
<img width="592" hight="591" alt="UML Notation of the database" src="https://user-images.githubusercontent.com/80950031/207366686-98e95476-719e-4922-b720-f078f1501e28.png">


## Why?
This small project is meant for my Database course and it main objectives is to design, model, and use SQL statements to create and manipulate database for an organisation of our choice.

## When? 
13/9/2021 until 8/12/2021

## Who?
**Authors**
* Munira Alduraibi (me)

# What I learned?
* How to choose the right data structure depending on the problem. 
* To deal with and manipulate data using data structures.
* How to use recursion.
