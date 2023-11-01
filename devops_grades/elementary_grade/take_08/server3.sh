#!/bin/bash

# Clearing current rules
iptables -F
iptables -X

# Allow outgoing connections
iptables -P OUTPUT ACCEPT

# Allow new connections to be established on SSH port (default is 22)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow receiving data from Server1 via HTTP/HTTPS
iptables -A INPUT -p tcp -s <ip_server1> --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -s <ip_server1> --dport 443 -j ACCEPT

# Allow connection to server Server2 by postgres (default is 5432)
iptables -A INPUT -p tcp -s <ip_server2> --dport 5432 -j ACCEPT

# Allow communication with servers
iptables -A INPUT -p tcp -s <ip_server1> -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -s <ip_server2> -m state --state ESTABLISHED,RELATED -j ACCEPT

# Deny all other incoming connections
iptables -P INPUT DROP

# Enable logging of rejected packets
iptables -A INPUT -j LOG --log-prefix "Denied: "