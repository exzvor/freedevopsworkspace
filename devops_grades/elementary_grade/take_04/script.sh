#!/bin/bash
for user in $(cat /home/user/wolves.txt); do
        usermod -a -G wolves $user;
done
exit