# Online Grocery Store Database

## Overview
A normalised relational database system designed to manage an online grocery store's operations — including warehouse management, courier logistics, and local delivery — with a focus on affordability, scalability, and data security.

---

## Requirements
- Customer browsing and ordering
- Real-time inventory tracking
- Sales and revenue reporting (including by city)
- Customer profile and order history storage
- Local warehouse, courier, and delivery management
- Horizontal and vertical scaling support for growing data volumes and concurrent sessions
- Security and data privacy compliance

---

## Methods

### Schema Design
Designed a normalised relational schema in **Third Normal Form (3NF)**, encompassing the following entities:

`customer` · `product` · `review` · `cart` · `discount` · `product_category` · `product_detail` · `order` · `return` · `payment` · `delivery` · `warehouse` · `vendor` · `city` · `inventory` · `report` · `sales` · `courier` · `employee` · `admin` · `non_admin` · `audit_log`

### Implementation
- Defined primary keys, foreign keys, relationships, and constraints via **phpMyAdmin**, hosted on a local **XAMPP v3.3.0** server
- Used **SQL** as the primary interface for both schema definition (DDL) and data manipulation (DML)
- Populated the database with representative sample data for testing and validation

### Analytics Queries
Developed SQL queries to support the following reporting needs:
- Total sales by product category
- Top popular products
- Customer order history
- Current inventory levels per product
- Revenue by city (last 12 months)

### Cloud Deployment
Deployed to production via the **Railway** platform:
- Provisioned a dedicated **MySQL** instance on Railway's cloud infrastructure, providing physical and logical isolation from the development environment
- Security measures include built-in **DDoS protection**, firewall configurations, and an encrypted connection established through **MySQL Workbench**
- Access credentials use a unique hostname, root user, and complex password to mitigate brute-force and man-in-the-middle (MITM) attack vectors

---

## Tech Stack
| Layer | Technology |
|---|---|
| Database | MySQL (RDBMS) |
| Local Server | XAMPP v3.3.0 |
| DB Management | phpMyAdmin, MySQL Workbench |
| Schema Design | Draw.io (ERD) |
| Query Language | SQL |
| Cloud Platform | Railway |

---

## Results
- Delivered a fully normalised (3NF) relational database supporting multi-location grocery operations
- Reduced data redundancy and improved integrity through disciplined schema design
- Enabled scalable cloud deployment with security controls aligned to production standards
- Produced actionable analytics queries for sales, inventory, and revenue reporting
