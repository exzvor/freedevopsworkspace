## Autorun a program using ```systemd```

1) Create `memory_check.sh` script
```bash
#!/bin/bash

log_file=/home/user/memory_check.log #specify absolute path otherwise permission errors may occur

if [ ! -f "$log_file" ]; then
    touch "$log_file"
fi

while true; do
timestamp=$(date +"%Y-%m-%d %T")

    memory_info=$(free -h | grep Mem)

    total_memory=$(echo $memory_info | awk '{print $2}')
    used_memory=$(echo $memory_info | awk '{print $3}')
    free_memory=$(echo $memory_info | awk '{print $4}')
    cached_memory=$(echo $memory_info | awk '{print $7}')

    echo "[$timestamp] Total Memory: $total_memory, Used Memory: $used_memory, Free Memory: $free_memory, Cashed Memory: $cached_memory" >> "$log_file"
    sleep 300 #5mins

done
```
2) Do not forget to make your script executable
   `sudo chmod 751 /home/user/memory_check.sh`
3) Move to `/etc/systemd/system` and create `memory_check.service` there
4) Describe your service
```yaml
[Unit]
Description=Memory check
After=network.target

[Service]
Type=simple
ExecStart=/home/user/memory_check.sh
User=user

[Install]
WantedBy=multi-user.target
```
5) Reload systemd
   `sudo systemctl daemon-reload`
6) Enable service
   `sudo systemctl enable memory_check.service`
7) Start service
   `sudo systemctl start memory_check.service`

Then check your service status and open logs to verify your task is ok. Done!


