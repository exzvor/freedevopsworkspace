#!/bin/bash

logs_file="/home/victor/logs.dat"

while true; do
    dd if=/dev/urandom bs=1M count=1 >> "$logs_file"

    sleep 30
done