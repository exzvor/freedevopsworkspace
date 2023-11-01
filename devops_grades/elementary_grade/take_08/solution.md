## IPTABLES rules

1. Install `Ngnix` on your Server1 and run it:
   - `sudo apt update`
   - `sudo apt install nginx`
   - `sudo systemctl start nginx`
   - `sudo systemctl enable nginx`
2. Install firewall to set `iptables` rules (repeat this for other servers):
   - `sudo apt install ufw`
3. Set `iptables` for Server1. [Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_08/server1.sh)
4. Set execute rights for your script (repeat this for other servers afterwards):
   - `sudo chmod +x server1.sh`
5. Run your script as root (repeat this for other servers afterwards):
   - `sudo su`
   - `./server1.sh`
   If you work on server1 via `ssh` right now, connection might be interrupted. To reset `iptables` rules just restart your system.
6. Install postgres on your Server2:
   - `sudo apt update`
   - `sudo apt install postgresql`
7. Create new database and table with any data
8. Edit `pg_hba.conf` to allow queries to the database:
   - `sudo nano /etc/postgresql/<version>/main/pg_hba.conf`
   Find the lines that start with `local` and `host` and change `peer` or `md5` to `password`
   - `local   all             all                                  password`
   - `host    all             all             0.0.0.0/0            password`
   By the way, change default ip address `127.0.0.1/32` to `0.0.0.0/0` to allow queries from other servers
9. Edit `postgresql.conf`:
   - `sudo nano /etc/postgresql/<version>/main/postgresql.conf`
   Find the `listen_addresses` parameter and make sure it looks like this:
   - `listen_addresses = '*'`
10. Restart postgres:
   - `sudo systemctl restart postgresql`
11. Set `iptables` for Server2. [Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_08/server2.sh)
12. Then you can check working rules from Server3. 
   To check access to Server1: `curl http://<ip_server1_address>`
   To check access to Server2: `sudo psql -h <ip_server2_address> -U <db_user> -d <db> -c "SELECT name FROM example_table WHERE id = 1;"`
   To check reject from these servers you can try: `ping -c 1 <ip_server_address>`
13. Set `iptables` for Server3. [Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_08/server3.sh)
14. Check task with Server3 rules.
15. If you want to save iptables rules after restart add `iptables-save > /etc/iptables/rules.v4` at the end of your server script.