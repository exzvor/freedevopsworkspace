## Autorun a program using ```systemd```
You need to write a script that checks the system memory state every 5 mins. The script should be run automatically when you start the OS.

### Objectives:
1) Create a `.sh` script that will output the info about system in the format `Date Total Memory: 3.8Gi, Used Memory: 247Mi, Free Memory: 3.2Gi, Cached Memory: 3.4Gi` and redirect the output to the logfile.
2) Create a service file (extension `.service`) and add a description to it.
3) Reboot `systemd`, enable and start the service.

### Restrictions
- Do not create log file manually, the file should be created automatically.

### What to learn
- What is [`systemd`](https://systemd.io/) / [`systemctl`](https://www.redhat.com/sysadmin/linux-systemctl-manage-services)
- Text processing utilities ([`awk`, `sed`, `grep`, `cut`](https://www.baeldung.com/linux/grep-sed-awk-differences))
- Redirections ([`input`, `output`, `error`](https://www.geeksforgeeks.org/input-output-redirection-in-linux/amp/))
- Permissions ([`read`, `write`, `execute`](https://www.geeksforgeeks.org/permissions-in-linux/amp/))
