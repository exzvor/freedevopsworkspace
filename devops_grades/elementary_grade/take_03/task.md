## Convert your `JSON` to `CSV`. Create data with `postgres`.
You have received `json` data to send to the server, but you are curious, what if convert it to `csv` and send it to the server in this form? Then create data in postgres. Write a query to sort the data and then dump it to local storage.

### Objectives:
1) Get a `.json` file on your server.
2) Write a converter on Python that will translate `.json` into `.csv`.
3) Run your script and check the result.
4) Create table in `postgres` and insert data there. The table named `customer_data` should contain `last_name`, `registration_date`, `spent_amount` fields.
5) Write a query to sort the data from the table. You have to sort `last_name` in ascending order of amount `spent_amount`. 
6) Dump the database in `/tmp` directory.

### Restrictions:
- Use Python with this take.

### What to learn:
- [More about `scp`](https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files/)
- [Postgres tutorial](https://www.postgresqltutorial.com/)
- [Sort data in SQL](https://www.w3schools.com/sql/sql_orderby.asp)