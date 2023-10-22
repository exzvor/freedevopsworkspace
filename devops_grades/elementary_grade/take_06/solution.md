## Backup your data

1. Install and set `potgres`. Create database.
2. Write a script that will make backup. [Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_06/script.sh)
3. Create a `.pgpass` script so that the cron doesn't ask for a password:
    - `localhost:5432:*:postgres:1234`
4. Add the task to `crontab` with the command `sudo crontab -e`:
    - `* * * * * /bin/bash /home/user/script.sh > /dev/null 2>&1` // if you need to eliminate the error message in the Cron logs, you can redirect the script output to `/dev/null`
5. Wait for a minute to check if the backup has been performed.