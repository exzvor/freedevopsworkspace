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

### Data types in Postgres
| Category                    | Data Types                                 |
|-----------------------------|--------------------------------------------|
| INTEGRAL NUMBERS            | smallint, integer, bigint                  |
| REAL NUMBERS                | decimal/numeric, real/float4, float8/float |
| AUTO-INCREMENTING INTEGERS  | smallserial, serial, bigserial             |
| CHARACTERS                  | char, varchar, text                        |
| LOGICAL                     | bool                                       |
| TEMPORAL                    | date, time, timestamp                      |
| SPECIAL                     | arrays, json, xml, null                    |

### Relationships

**One-to-One Relationship** </br>
Suppose you have a database with two tables: Authors and AuthorDetails. 
Each author has a single corresponding record in the AuthorDetails table 
that contains additional information about the author, such as their biography. </br>

Authors Table

| AuthorID  | AuthorName    |
|-----------|---------------|
| 1         | J.K. Rowling  |
| 2         | George Orwell |
| 3         | Jane Austen   |

AuthorDetails Table

| AuthorID | Biography                                             |
|----------|-------------------------------------------------------|
| 1        | British author best known for the Harry Potter series |
| 2        | English novelist and essayist, known for 1984         |
| 3        | English novelist known for Pride and Prejudice        |

**One-to-Many Relationship** </br>
Consider a scenario where each author can write multiple books, 
but each book is written by only one author. </br>

Authors Table

| AuthorID   | AuthorName    |
|------------|---------------|
| 1          | J.K. Rowling  |
| 2          | George Orwell |
| 3          | Jane Austen   |

Books Table

| BookID  | Title               | AuthorID |
|---------|---------------------|----------|
| 101     | Harry Potter        | 1        |
| 102     | 1984                | 2        |
| 103     | Pride and Prejudice | 3        |

**Many-to-Many Relationship** </br>
In a scenario where authors can collaborate on multiple books, 
and a book can have multiple authors. </br>

Authors Table

| AuthorID  | AuthorName     |
|-----------|----------------|
| 1         | J.K. Rowling   |
| 2         | George Orwell  |
| 3         | Jane Austen    |

Books Table

| BookID | Title               |
|--------|---------------------|
| 101    | Harry Potter        |
| 102    | 1984                |
| 103    | Pride and Prejudice |

AuthorBooks Table (Intermediate Table)

| AuthorID | BookID  |
|----------|---------|
| 1        | 101     |
| 1        | 102     |
| 2        | 102     |
| 3        | 103     |

### PostgreSQL Commands Cheat Sheet

- SELECT DISTINCT (unique values):
```sql
SELECT DISTINCT country FROM table;
```
- COUNT:
```sql
SELECT COUNT(*) FROM table;
```
- WHERE:
```sql
SELECT price FROM table WHERE weight >= 20 AND weight <= 40;
```
- AND, OR:
```sql
SELECT product FROM table WHERE country = 'Mexico' OR country = 'Germany';
```
- BETWEEN:
```sql
SELECT price FROM table WHERE weight BETWEEN 20 AND 40;
```
- IN / NOT IN:
```sql
SELECT product FROM table WHERE country IN ('Mexico', 'Germany');
```
- = (Equal):
```sql
SELECT product FROM table WHERE country = 'Mexico';
```
- ORDER BY (ASC, DESC):
```sql
SELECT column FROM table ORDER BY column DESC;
```
- MIN / MAX / AVG:
```sql
SELECT MIN(order_date) FROM table;
```
- SUM:
```sql
SELECT SUM(column) FROM table;
```
- LIKE / NOT LIKE:
```sql
SELECT last_name, first_name FROM employees WHERE last_name LIKE 'B%';
```
- LIMIT:
```sql
SELECT * FROM table LIMIT 10;
```
- IS NULL:
```sql
SELECT column FROM table WHERE column IS NULL;
```
- IS NOT NULL:
```sql
SELECT column FROM table WHERE column IS NOT NULL;
```
- GROUP BY:
```sql
SELECT column, COUNT(*), AVG(column) FROM table GROUP BY column;
```
- HAVING (postfilter):
```sql
SELECT column, COUNT(*) FROM table GROUP BY column HAVING COUNT(*) > 1;
```
- UNION (ALL):
```sql
SELECT column FROM table1 UNION ALL SELECT column FROM table2;
```
- INTERSECT:
```sql
SELECT column FROM table1 INTERSECT SELECT column FROM table2;
```
- EXCEPT (ALL):
```sql
SELECT column FROM table1 EXCEPT ALL SELECT column FROM table2;
```
- INNER/LEFT/RIGHT JOIN:
```sql
SELECT * FROM table1 INNER JOIN table2 ON table1.id = table2.id;
```
- USING Clause in JOIN:
```sql
SELECT * FROM table1 JOIN table2 USING (common_column);
```
- Extended JOIN Example:
```sql
SELECT contact_name, company_name, phone, first_name, last_name, title,
order_date, product_name, ship_country, products.unit_price, quantity, discount
FROM orders
JOIN order_details USING(order_id)
JOIN products USING (product_id)
JOIN customers USING (customer_id)
JOIN employees USING (employee_id)
WHERE ship_country = 'USA';
```
- Complex JOIN with GROUP BY and HAVING:
```sql
SELECT category_name, SUM(unit_price * units_in_stock)
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
WHERE discontinued <> 1
GROUP BY category_name
HAVING SUM(unit_price * units_in_stock) > 5000
ORDER BY SUM(unit_price * units_in_stock) DESC;
```

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
31. Find the customers whose orders Robert King has managed at least three times.
32. Find the suppliers of every product. The list should have two columns: Supplier name and Product name. The list should also be in ascending order by supplier name.
33. Find names and ages of employees. Calculate the age approximately by substracting year of birth and current year. Name the employee age columns to age.