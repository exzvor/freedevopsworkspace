## Convert your `JSON` to `CSV`

1. Download `generated.json` from your pc to server. To do it just copy file with `scp` command:
   - `scp C:\Users\Desktop\generated.json user@192.168.1.41:/home/user/generated.json`
2. Rename the file on the server to `data.json`:
   - `mv generated.json data.json`
3. Install python:
   - `sudo apt update`
   - `sudo apt install python3`
4. Install python packet manager:
   - `sudo apt install python3-pip`
5. Write converter. [Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_03/converter.py)
6. Run your script with `python3 converter.py` and check your data.csv file.
7. Install Postgres with:
   - `sudo apt update`
   - `sudo apt install postgresql`
   Enable service with:
   - `sudo systemctl start postgresql`
   - `sudo systemctl enable postgresql`
   Then verify your installation with:
   - `sudo -i -u postgres`
   - `psql`
8. Create table in your database (for the beginning it might be `postgres` db) and insert customers there. [Here is example](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_03/customers.sql).
9. Here is a query to sort your data: `SELECT last_name FROM customer_data ORDER BY spent_amount;`.
10. To dump you db edit the `/etc/postgresql/14/main/pg_hba.conf`. Namely, change the authentication method for the "postgres" user to "trust" or "md5". After that, reload Postgres with `sudo systemctl restart postgresql`.
11. Create `backups` directory in `/tmp` and dump db there:
   - `sudo pg_dump -U postgres -d postgres > /tmp/backups/customers_dump.sql`
12. Cat `customers_dump.sql` to verify your task is ok. Done!