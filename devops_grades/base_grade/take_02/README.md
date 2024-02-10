## Unstoppable process
Write a solution for the following problem:
A random script writes logs to a Linux server. 
Eventually the free space on this server runs out, but 
logs must be written continuously. So the process
that writes the logs cannot be stopped, terminated or 
restarted. What can you do so that the logs continue 
to be written to another disk without interrupting the 
writing process?

### Objectives:
1. Write a script that forks a process that writes random data to a file continuously.
2. Add new disk to your system.
3. Redirect your process data to new file on new disk.

### Restrictions:
- Here's a hint, the issue needs to be solved using file descriptors.
- Strace might also help you

### What to learn:
- [What are file descriptors, explained in simple terms?](https://stackoverflow.com/questions/5256599/what-are-file-descriptors-explained-in-simple-terms)