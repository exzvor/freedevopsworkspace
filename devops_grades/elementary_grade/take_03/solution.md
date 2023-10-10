## Convert your `JSON` to `CSV`

1. Download `generated.json` from your pc to server. To do it just copy file with `scp` command:
    - `scp C:\Users\Desktop\generated.json user@192.168.1.41:/home/user/generated.json`
2. Rename the file on the server to `data.json`:
    - `mv generated.json data.json`
3. Install python:
    - `sudo apt update`
    - `sudo apt install python3`
4. Install python packet manager:
    - `sudo apt install python3-pip`
5. Write converter. [Here is an example.](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/elementary_grade/take_03/converter.py)
6. Run your script to verify your task is ok. Done!