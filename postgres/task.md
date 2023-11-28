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