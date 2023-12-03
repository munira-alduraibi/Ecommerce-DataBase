# Database Design for a Coffee Store 💳

## Overview
This project involves the design and implementation of a database for an store specializing in coffee beans and equipment. The project's focus is on creating a functional and efficient database structure, starting from business rule formulation to entity-relationship (ER) modeling and SQL scripting.

### Business Rules
- The store offers a range of coffee products, each with unique identifiers and attributes like price, production date, expiry date, and quantity.
- Customer records are maintained for marketing purposes. Each customer is identified by a unique customer_id and has associated attributes like name and address.
- Customers can place one or multiple orders. Each order has an order_id, order_time, and order status and can contain one or more products.
- Orders are processed by employees, each identified by an employee_id, with specific roles and contact information.
- Invoices are generated for orders, each with a unique invoice_number, invoice_date, and total amount. Invoices are linked to specific customers.
- The store is organized into sections, each containing specific products.

### ER and UML Models
- **Chen's Notation:** 
  ![Chen’s Notation of the database](https://user-images.githubusercontent.com/80950031/207366314-4836db09-1f0a-4aca-aa2c-eb74eec5a9dd.png)
- **UML Notation:**
  ![UML Notation of the database](https://user-images.githubusercontent.com/80950031/207366686-98e95476-719e-4922-b720-f078f1501e28.png)

### Database Schema
- A schema diagram illustrates the database structure.
  ![Database Schema](https://user-images.githubusercontent.com/80950031/207591779-00795fec-703c-4912-9161-b4a806ed8ae0.png)

## Purpose
The project was conducted for a "Database I" class, with the main objectives being:
- Designing and modeling a database for a chosen organization.
- Implementing the database using SQL for data definition, manipulation, and control.

## Project Timeline
**Duration:** Sep 2021 - Dec 2021

## Contributor
**Author:**
* Munira Alduraibi

## Key Learnings
Through this project, I gained expertise in several key areas:
- Formulating logical and coherent business rules and scenarios.
- Developing ER models and converting them into Chen’s and UML notations.
- Accurately translating ER diagrams into a relational database model.
- Applying normalization principles to the relational schema.
- Establishing and managing a MySQL database connection.
- Writing comprehensive SQL commands for data definition, manipulation, and control.
