## IPTABLES rules
Configure `iptables` rules to ensure network security and functionality between three servers. You have three servers: Server1, Server2 and Server3. Server1 is the web server, Server2 is the database, and Server3 is the gateway.

### Objectives:
1) Deny incoming connections to all servers by default.
2) Server1 must accept incoming `HTTP` (`port 80`) and `HTTPS` (`port 443`) requests.
3) Server2 must accept incoming database connections (port `5432` for `Postgres`).
4) Server3 must accept `SSH` (`port 22`) connections and receive data from Server1 and Server2.
5) Disallow all outbound connections by default, except those required by the applications on each server.
6) Configure logging of rejected packets.

### Restrictions:
- Use cloud servers for this task.

### What to learn:
- [Managing the Iptables Firewall](https://fideloper.com/iptables-tutorial)