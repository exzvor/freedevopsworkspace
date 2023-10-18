## Create new users in your system, add them to a group and assign access rights.
You need to create multiple users, add them to groups, and separate access rights for the confidential directory and fileYou need to create multiple users, add them to groups, and separate access rights for the confidential directory and fileYou need to create multiple users, add them to groups, and separate access rights for the confidential directory and file.

### Objectives:
1) Create the next users: `ceo`, `lead`, `developer`, `devops`, `client`, `noname`.
2) Add them to the next groups: `tigers` -> `ceo`, `lead`; `wolves` -> `developer`, `devops`; `cats` -> `client`.
3) Create directory `confidential_files` and file `report.sh` there. File should just print "This is confidential file" for example.
4) Separate access rights for directory and file with the next rights: `tigers` -> `rwx`, `wolves` -> `rw`, `cats` -> `r`. Other users must not have any access rights.
5) Check users, groups and their rights.

### Restrictions:
- For users in the `tigers` group, try adding users manually.
- For users in the `wolves` group, try adding users automatically with bash script.
- Use `ACL` as access rights instrument.

### What to learn:
- [Linux file permissions explained](https://www.redhat.com/sysadmin/linux-file-permissions-explained)
- [`groupadd` command in Linux with examples](https://www.geeksforgeeks.org/groupadd-command-in-linux-with-examples/)
- [An introduction to Linux Access Control Lists (ACLs)](https://www.redhat.com/sysadmin/linux-access-control-lists)