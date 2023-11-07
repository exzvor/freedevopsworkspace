## Nginx balancer

1. Set secure shell authentication between machines. Configure Ansible playbook and install Nginx on machines. [Here is an example in the take 9](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_09)
2. Example of Ansible playbook for this take:
   - ```ini
   [servers]
   127.0.0.1 ansible_connection=local
   server1 ansible_host=10.129.0.31 ansible_user=victor ansible_port=22
   server2 ansible_host=10.129.0.20 ansible_user=victor ansible_port=22  
   ```
3. Edit Nginx Configuration:
   - `sudo vim /etc/nginx/conf.d/load_balancer.conf` _(for example)_
   [Here is an example for configuration file](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_10/load_balancer.conf)
4. To test the balancer, run logs on the servers with the command:
   - `sudo tail -f /var/log/nginx/access.log`
5. Make a request to balancer and monitor logs, requests should be submitted round-robin to each server. By default, round-robin is used.