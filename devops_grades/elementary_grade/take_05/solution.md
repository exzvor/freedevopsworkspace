## Set up email alerts

1. Set up smtp server from google. [Youtube link](https://www.youtube.com/watch?v=yuOK6D7deTo&list=PLN6IqoJoKq7JryRoZWDvSbgexU-P86clV&index=2)
2. Install smtp server on your system:
    - `sudo apt install ssmtp`
3. Go to the server config `sudo nano /etc/ssmtp/ssmtp.conf` and set it. [Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_05/ssmtp.conf)
4. Go to [site](https://www.gmass.co/smtp-test), test your server.
5. Write a script on `py` to receive notifications to the mail. [Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_05/script.py)
6. Go into cron `crontab -e` and configure the scheduler to check disk space every minute:
   - `* * * * * python3 /home/user/script.py`