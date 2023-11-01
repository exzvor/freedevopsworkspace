#!/bin/bash

# Clearing current rules
iptables -F
iptables -X

# Deny all incoming connections by default
iptables -P INPUT DROP

# Allow incoming requests
iptables -A INPUT -p tcp --dport 5432 -j ACCEPT

# Allow outgoing connections
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Enable logging of rejected packets
iptables -A INPUT -j LOG --log-prefix "Denied: "
