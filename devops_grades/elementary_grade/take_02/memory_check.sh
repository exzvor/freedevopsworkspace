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