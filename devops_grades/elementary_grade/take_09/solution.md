## Simple Ansible

1. In the sshd_config file (`/etc/ssh/sshd_config`) on the remote `server`, ensure that `PasswordAuthentication` is set to yes
2. After making changes, restart the SSH service:
   - `sudo systemctl restart sshd`
3. Switch to `test` machine and generate `ssh` public key:
   - `ssh-keygen`
4. Copy public key to server with:
   - `ssh-copy-id <user>@<server_ip_addr>`
5. Install `Ansible` on the `test`:
   - `sudo yum update`
   - `sudo yum install epel-release` (Ansible is available in the EPEL repository, so you'll need to enable it if it's not already enabled)
   - `sudo yum install ansible`
6. Create ansible hosts, user and port in the `inventory.ini` file:
     ```ini
     [servers]
     server ansible_host=<server_ip_addr> ansible_user=<user> ansible_port=22
     ```
7. Check the connection to the server via `Ansible` with the command:
   - `ansible servers -m ping -i inventory.ini`
8. Create a playbook with a script. [Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_09/playbook.yaml)
9. Run playbook with:
   - `ansible-playbook -i inventory.ini playbook.yaml --ask-become-pass`
10. To check your take just go to your `server` and enter `sudo firewall-cmd --list-all`, you should see open `tcp` ports. Or enter your <server_ip_addr> on web browser.
