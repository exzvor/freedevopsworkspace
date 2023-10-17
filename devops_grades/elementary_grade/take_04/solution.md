## Create new users in your system, add them to a group and assign access rights.

1. Create new users with `sudo adduser <user_name>`, for example:
   - `sudo adduser lead`
   Repeat this for others.
2. To check all added users in the system:
   - `getent passwd`
3. Create new groups with `sudo groupadd <group_name>`, for example:
   - `sudo groupadd tigers`
   Repeat this for others.
4. To check all added groups in the system:
   - `getent group`
5. Add users `ceo` & `lead` to the `tigers` group:
   - `sudo usermod -aG tigers ceo`
   - `sudo usermod -aG tigers lead`
6. Add users `developer` & `devops` to the `wolves` group using bash script:
   - create `.txt` file with this users
   - write script which checks `.txt` file and add new added users from there. [Here is an example](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_04/script.sh)
   - set `sudo chmod +x script.sh`
   - run script `./script.sh`
7. Repeat steps for other groups and check users there with:
   - `getent group <group_name>`
8. Create new directory and file:
   - `mkdir confidential_files`
   - `nano repeat.sh`
   Add `echo "This is confidential file"` to your file.
9. To switch between groups and set permissions on them, you can use:
   - `sudo chgrp tigers confidential_docs`
   - `sudo chmod g+rwx confidential_docs`
   But in this task we use ACL (access control list)
10. Install ACL with:
   - `sudo apt install acl`
11. Set rights to report.sh:
   - `sudo setfacl -m g:tigers:rwx report.sh`
   - `sudo setfacl -m g:wolves:rw- report.sh`
   - `sudo setfacl -m g:cats:r-- report.sh`
12. To check group rights for file use:
   - `getfacl report.sh`
13. Then try to switch user and manipulate the file, for example:
   - `su lead`
   - `cat report.sh`
   - `./report.sh`
14. In the same way try to set rights on directory `confidential_files` to verify your task is ok. Done!