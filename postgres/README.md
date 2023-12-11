# PostgreSQL

Here you can find SQL practical tasks. I used postgres as object-relational database system and `northwind` database for this.
To start it on your system do the next steps:
 - install `postgres` on your system
 - download `northwind.sql` on your system
 - load the database from the dump: `sudo -u postgres psql -d northwind -f /tmp/northwind.sql`

### Tips for this take:
 - create new database: `CREATE DATABASE <db_name>`
 - look through all databases: `SELECT DATNAME FROM pg.database;`
 - switch between databases: `\c <db_name>`
 - view all relations: `\dt`
 - view all fields in a table: `\d <table_name>`

### Northwind overview
![Northwind overview](https://github.com/exzvor/freedevopsworkspace/blob/main/postgres/ERP.jpg)

### Tasks
01. List all products.
02. List product name, category and price
03. List product package sizes
04. List product package sizes, remove duplicates from the list.
05. Find the value of each product in warehouse in descended order, price * amount in store.
06. Find products that are sold in bottles.
07. Find names of those products, which we have over 100 units in warehouse.
08. Find names and unit prices of those products, which have unit price higher than 50. Order the Find in alphabetical order by product name.
09. Find first and last name of employees (as employee) working in London.
10. Find names of employees working somewhere else than London.
11. Find address information of customers living in Rio de Janeiro or in México D.F. in postal code area (05020-05030).
12. Find address information of customers living in México D.F. in some other postal code area than (05020-05030).
13. Find orders, which have not been shipped yet ie. there is no shipped date.
14. Find names of employees having superior (i.e., employees with a manager). The list should be in ascending order by employee's lastname.
15. Find orders made in 1996. Order the list by month of orderdate. Show ordernumber, customer id and month number of orderdate.
16. Find names of employees, who were hired in 1992.
17. Find names of companies in ascending order. The list should include both supplier names and customer names.
18. Find names of companies in ascending order. The list should include both supplier names and customer names. There should also be information whether this company is supplier or customer.
19. Find out how much would value of order 10288 raise, if you raise original unit price with 5 € and at the same time you raise original unit price +5 %.
20. Find the product having the highest unit price.
21. Find the product having the lowest unit price.
22. Find the average unit price and the count of products.
23. Find the number of products in every product category. The list should have two columns: category name and count of products in this category.
24. Find average, maximum and minimum of quantities in order details for every product. The list should be in descending order by average values.
25. Like previous, but only for products ordered at least in 50 orders.
26. Like previous, but only for Beverages category.
27. Find name of customer, orderid and orderdate for orders 10600 - 10620.
28. Find the number of products ordered in every order having shipcountry France. List should have two columns: orderid and quantity of products. The list should also be in decending order by quantity of products.
29. Find the orders handled by employee Robert King. List should include columns orderid and customer's name. The list should be in ascending order by names of customers.
30. How many different customers Robert King has managed by handling orders?