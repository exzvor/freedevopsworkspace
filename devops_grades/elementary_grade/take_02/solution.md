## Autorun a program using ```systemd```

1) Create `memory_check.sh` script. [Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_02/memory_check.sh)
2) Do not forget to make your script executable
   `sudo chmod 751 /home/user/memory_check.sh`
3) Move to `/etc/systemd/system` and create `memory_check.service` there
4) Describe your service. [Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_02/service.yaml)
5) Reload systemd
   `sudo systemctl daemon-reload`
6) Enable service
   `sudo systemctl enable memory_check.service`
7) Start service
   `sudo systemctl start memory_check.service`

Then check your service status and open logs to verify your task is ok. Done!


