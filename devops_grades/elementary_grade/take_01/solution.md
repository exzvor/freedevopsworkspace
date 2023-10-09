## Create your own utility `ls`

1. Write a utility that is analogous to the `ls` command in UNIX-like OS. [Here](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_01/main.go) is `go` written utility.
2. Connect via `ssh` to the server. Paste your code there in file `myls.go`. You can use `vim` or `nano`.
3. On the server, install Go (or another language if not already installed):
    - `sudo apt update`
    - `sudo apt install golang`
4. Build your file with `go build myls.go`.
5. Check your utility typing `./myls <your_directory>`. The utility should output the contents of the directory in the output order you specified.
6. In order for your utility to work properly, i.e. so that just type `myls <directory_name>`, the utility must be added to the environment variables.
7. For that move `myls` to the `/usr/local/bin` environment variable using the command `sudo mv myls /usr/local/bin/`.

Then check the utility operation (try it without arguments, with one or more arguments, with misprints) to verify your task is ok. Done!