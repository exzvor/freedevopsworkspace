## Unstoppable process

1. [Create script](https://github.com/exzvor/freedevopsworkspace/tree/main/devops_grades/base_grade/take_02/gen.sh) and start it.
2. Add new disk, then:
   - `sudo mkfs.ext4 /dev/vdb`
   - `sudo mkdir /mnt/vdb`
   - `sudo mount /dev/vdb /mnt/vdb`
   - `sudo touch /mnt/vdb/logs2.dat`
3. Get the file descriptor of the process that writes the logs using the lsof command
   - `lsof -c gen.sh`
4. As an example you get this:
   [victor@server ~]$ lsof -c gen.sh <br>
```
   COMMAND  PID   USER   FD   TYPE DEVICE  SIZE/OFF     NODE NAME
   gen.sh  7835 victor  cwd    DIR  253,2       133  8390845 /home/victor
   gen.sh  7835 victor  rtd    DIR  253,2       224       64 /
   gen.sh  7835 victor  txt    REG  253,2    964536 25167107 /usr/bin/bash
   gen.sh  7835 victor  mem    REG  253,2 106176928     6747 /usr/lib/locale/locale-archive
   gen.sh  7835 victor  mem    REG  253,2   2156592     6763 /usr/lib64/libc-2.17.so
   gen.sh  7835 victor  mem    REG  253,2     19248     6769 /usr/lib64/libdl-2.17.so
   gen.sh  7835 victor  mem    REG  253,2    174576    88661 /usr/lib64/libtinfo.so.5.9
   gen.sh  7835 victor  mem    REG  253,2    163312     6755 /usr/lib64/ld-2.17.so
   gen.sh  7835 victor  mem    REG  253,2     26970 25197339 /usr/lib64/gconv/gconv-modules.cache
   gen.sh  7835 victor    0u   CHR  136,1       0t0        4 /dev/pts/1
   gen.sh  7835 victor    1u   CHR  136,1       0t0        4 /dev/pts/1
   gen.sh  7835 victor    2u   CHR  136,1       0t0        4 /dev/pts/1
   gen.sh  7835 victor  255r   REG  253,2       139  8636625 /home/victor/gen.sh
```
5. Here's the command for capturing the output using strace and appending it to a file (do it as sudo user):
   - `strace -e write=1 -p 7835 -s 9999 -o /mnt/vdb/logs2.dat`
   - in this command `strace` is the command for call tracing.
     `-e write=1` specifies that we want to trace the write system calls for file descriptor 1 (stdout).
     `-p 7835` specifies the process ID (PID) of the process "gen.sh" for which we want to trace the write system calls.
     `-s 9999` specifies the maximum string size to print. This ensures that large write commands are captured.
     `-o /mnt/vdb/logs2.dat` specifies the output file where the trace will be saved.
6. Then check your `logs2.dat` file which should be appended.