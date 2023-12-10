_This section contains brief information about general engineering competencies. 
I decided to put here the basic information that I have ever used in my work and interviews.
If you're interested in these basics, dig deeper on your own._

# Linux
<details>
<summary>Linux Abstraction Levels</summary><br>
From lowest to highest level:

1. Hardware Abstraction Layer
2. Kernel Space
3. System Libraries
4. System Calls
5. Libraries and APIs
6. Utilities and Commands
7. Graphical User Interface (GUI)
8. Applications
</details>

<details>
<summary>Kernel mode and User mode</summary><br>

1. **Kernel mode**
   - Also known as privileged mode or supervisor mode.
   - In kernel mode, the CPU has unrestricted access to all resources and can execute any instruction.
   - The kernel, which is the core part of the operating system, runs in kernel mode. It has the highest level of privilege and can execute privileged instructions.
   - Kernel mode is reserved for tasks that require direct access to hardware or sensitive system resources. These tasks include device driver operations, memory management, and interrupt handling.
2. **User mode**
   - In user mode, the CPU has restricted access to resources, and certain instructions or operations that could potentially harm the system are not allowed.
   - User mode is where user applications and processes run. These applications do not have direct access to hardware and must request the kernel to perform privileged operations on their behalf through system calls.
   - Most of the software you interact with, such as text editors, web browsers, and games, run in user mode.
</details>

<details>
<summary>Processes vs Threads</summary><br>

1. **Processes**
    - Independent programs in execution.
    - Each process has its own memory space and resources.
    - A failure in one process does not directly affect others.
    - Isolation is strong, and communication between processes typically requires inter-process communication (IPC).
2. **Threads**
    - Smallest unit of execution within a process.
    - Threads within a process share the same memory space and resources.
    - Communication between threads is easier due to shared memory space.
    - Changes made by one thread to the program code or data are visible to all threads within the same process.

In summary, processes offer strong isolation at the cost of higher resource overhead, while threads within a process share resources and 
can communicate more easily, providing greater efficiency for concurrent execution. The choice between processes and threads depends on 
the specific requirements of the application, balancing the need for isolation with the benefits of resource sharing.
</details>

<details>
<summary>Kernel mode and User mode</summary><br>

1. **Kernel mode**
    - Also known as privileged mode or supervisor mode.
    - In kernel mode, the CPU has unrestricted access to all resources and can execute any instruction.
    - The kernel, which is the core part of the operating system, runs in kernel mode. It has the highest level of privilege and can execute privileged instructions.
    - Kernel mode is reserved for tasks that require direct access to hardware or sensitive system resources. These tasks include device driver operations, memory management, and interrupt handling.
2. **User mode**
    - In user mode, the CPU has restricted access to resources, and certain instructions or operations that could potentially harm the system are not allowed.
    - User mode is where user applications and processes run. These applications do not have direct access to hardware and must request the kernel to perform privileged operations on their behalf through system calls.
    - Most of the software you interact with, such as text editors, web browsers, and games, run in user mode.
</details>

<details>
<summary>The states of processes in htop command</summary><br>

1. **S - Sleeping**. The process is currently sleeping. It is not using the CPU and is in a waiting state. This could be due to waiting for an event, I/O operation, or a specific condition to be met.
2. **R - Running**. The process is currently running on the CPU. It is actively executing instructions.
3. **D - Disk Sleep** (Uninterruptible Sleep). The process is in an uninterruptible sleep state, typically waiting for a disk I/O operation to complete. Processes in this state cannot be interrupted by signals and must wait for the I/O operation to finish.
4. **Z - Zombie**. The process has terminated, but its entry is still in the process table. This can occur when a parent process has not yet collected the exit status of its terminated child. Zombie processes don't consume system resources, but their presence indicates an issue with process management.
</details>

<details>
<summary>Examples of System Calls</summary><br>

1. **File Operations**: `open()`, `read()`, `write()`, `close()`
2. **Process Control**: `fork()`, `exec()`, `wait()`, `exit()`
3. **Memory Management**: `brk()`, `mmap()`, `munmap()`
4. **Communication**: `socket()`, `send()`, `recv()`
5. **Device Control**: `ioctl()`
</details>

<details>
<summary>Common signals in Linux</summary><br>

1. **SIGTERM (15)**: Termination signal. This signal asks a process to terminate gracefully. Processes can catch this signal to perform cleanup operations before exiting.
2. **SIGKILL (9)**: Kill signal. This signal immediately terminates a process. It cannot be caught or ignored by the process, and it forcefully terminates the process.
3. **SIGINT (2)**: Interrupt signal. This signal is generated when the user presses Ctrl+C in the terminal. It's commonly used to interrupt or stop a running process.
4. **SIGHUP (1)**: Hangup signal. Historically used to notify processes of a terminal hangup. Nowadays, it's often used to reload configuration files for daemons.
5. **SIGTERM (16)**: Terminal stop signal. This signal is generated when the user presses Ctrl+Z in the terminal to suspend a process.

These are just a few examples, and there are more signals available. You can use the `kill` command to send signals to processes manually.
</details>

<details>
<summary>File modes</summary><br>

In Unix-like operating systems, file modes are represented using a three-digit octal (base-8) notation. 
Each digit corresponds to the permission bits for the owner, group, and others, respectively. The three basic permission types 
are read (r) - 4, write (w) - 2, and execute (x) - 1. Example: `chmod 644 filename`
</details>

<details>
<summary>Linux file system hierarchy</summary><br>

The Linux file system hierarchy is organized into a hierarchical structure with the root directory `/` at the top. 
Key directories include `/bin` for essential binaries, `/boot` for bootloader files, `/etc` for system-wide configurations, 
`/home` for user home directories, `/lib` for shared libraries, and `/usr` for user binaries and libraries. Additional directories 
like `/dev` house device files, `/proc` a virtual file system that provides information about running processes and system resources as files, 
and `/var` stores variable data such as logs. 
The `/tmp` directory holds temporary files, while `/sbin` contains system binaries, and `/opt` may store optional software packages. 
Mount points are created in `/mnt`, and special directories like `/root` serve specific purposes.
</details>

<details>
<summary>Device files</summary><br>

Device files in Unix-like operating systems, found in the `/dev` directory, act as interfaces for communication 
between user-level processes and devices. There are two main types: character devices (e.g., terminals) for 
character-by-character data transfer. The 'c' character in the file permissions (crw-rw-rw-) indicates a character device.
and block devices (e.g., hard drives) for fixed-size block data transfer. The 'b' character in the file permissions (brw-rw-rw-) signifies a block device.
Examples include `/dev/tty` for terminals, `/dev/sda` for hard disks, and `/dev/null` for a null device that discards data.

Commonly used commands to list and view information about devices: `lsblk`, `fdisk -l`, `df -h`, `ls /dev`, `blkid`
</details>

<details>
<summary>File System Table</summary><br>

`fstab` is a configuration file in Unix-like operating systems, including Linux, located at `/etc/fstab`. 
It defines how disk drives and partitions are mounted into the file system hierarchy, specifying mount points, file system 
types, and mount options. Entries in `fstab` ensure automatic mounting of specified file systems during system boot, and it 
supports the use of UUIDs or labels for unique identification. The file system table also allows configuration of network 
file systems like NFS shares. Each line in `fstab` represents a distinct file system entry, including information about the 
device or partition, mount point, file system type, mount options, and other parameters.
</details>

<details>
<summary>Logical Volume Manager</summary><br>

Logical Volume Manager (LVM) is a powerful and flexible storage management tool used in Unix-like operating systems. 
LVM abstracts the physical storage devices into logical volumes, providing a layer of indirection that 
allows dynamic management of storage resources. It enables tasks such as creating logical volumes that span multiple 
physical disks, resizing volumes on the fly, and creating snapshots for backup purposes. LVM consists of physical volumes (PVs), 
volume groups (VGs), and logical volumes (LVs). Physical volumes are individual storage devices or partitions, which are combined 
into volume groups. Logical volumes are then created within volume groups and act as flexible containers for file systems or 
other use cases. LVM enhances the flexibility and efficiency of storage management, allowing administrators to adapt and scale 
storage resources dynamically without disrupting existing data or services.
</details>

<details>
<summary>Linux boot process</summary><br>

1. **BIOS/UEFI** is the first component involved in the boot process. It initializes hardware components, performs a Power-On Self-Test (POST), and locates the boot device.
2. **Boot Loader** commonly GRUB in many Linux distributions, is loaded by the BIOS/UEFI. GRUB is responsible for locating the Linux kernel and initializing the initial ramdisk (initramfs).
3. **Initramfs** (initial RAM filesystem) is a temporary root file system that contains essential drivers and modules needed to mount the actual root file system. It ensures that the minimal set of tools and drivers required for the system to boot are available.
4. **Kernel Initialization** is loaded into memory by the bootloader. The kernel initializes the system hardware, sets up memory management, identifies and mounts the root file system, and begins the process of loading necessary kernel modules.
5. **Init Process** or its modern replacements like systemd. The init process is the first user-space process and serves as the ancestor of all other processes.
6. **User-Space Initialization** involves starting system services, daemons, and user processes. The init or systemd process coordinates this initialization and ensures that essential services are started in the correct order.
7. **Login Prompt or Graphical Interface** The system reaches a state where it presents a login prompt on the console or initiates a graphical user interface (GUI) if the system is configured to run in a graphical mode.
8. **User Session** Upon successful login, the user is granted a session where they can interact with the system through the command-line interface or a graphical desktop environment.
</details>

<details>
<summary>systemd</summary><br>

`systemd` is a system and service manager used in modern Linux distributions to initialize and manage the system's components. 
Serving as a replacement for the traditional `init` system, `systemd` handles the boot process, managing system processes, 
and providing advanced features such as parallel service initialization, on-demand starting of services, and dependency tracking.
`systemd` introduces the concept of units, which can be services, devices, mounts, and more, allowing for fine-grained control 
over system resources. It includes journaling for centralized and structured logging, enabling administrators to access detailed 
information about system events. While systemd has been criticized for its departure from traditional Unix design principles, 
it has become a standard component in many Linux distributions, offering enhanced system management and robustness.
</details>

<details>
<summary>Linux principles are violated by systemd</summary><br>

1. **Single Process Philosophy**. Traditional Unix systems follow the "do one thing and do it well" philosophy, encouraging the development of small, specialized tools that can work together. Some argue that systemd, by encompassing a broad range of functions in a single project, deviates from this principle.
2. **Text-Based Configuration Files**. Unix systems historically favor plain text configuration files that are human-readable and editable with simple text editors. Systemd, in contrast, uses binary configuration files in a more complex format, which some find less intuitive and harder to manage.
3. **Interoperability**. Critics argue that systemd can introduce challenges for interoperability with non-systemd systems. Some see it as less compatible with alternative init systems, limiting the ability to easily switch between different init systems.
4. **User Space and Kernel Space Separation**. Traditional Unix systems maintain a clear separation between user space and kernel space. Some critics argue that systemd takes on more responsibilities traditionally handled by user space tools, potentially blurring this separation.
5. **Limited Modularity**. The design of systemd emphasizes integration and a unified approach to system management. Critics suggest that this can limit the modularity and flexibility traditionally associated with Unix systems.
6. **Centralization of Features**. Systemd incorporates various functionalities beyond process initialization, such as logging, device management, and network configuration. Critics argue that this centralization can lead to a monolithic approach, contrary to the Unix philosophy of decentralized tools working together.
</details>

<details>
<summary>Staged Module Loading in Linux Boot Process with initramfs</summary><br>


During the Linux boot process with an initial ramdisk `initramfs`, the kernel loads a minimal set of essential 
modules from the `initramfs`, allowing it to access and mount the real root file system. This initial set of modules 
typically includes storage drivers and basic hardware support. Once the real root is mounted, the kernel can dynamically 
load additional modules as needed for specific hardware or filesystems from the now-accessible root file system. 
This staged approach ensures that the kernel has the required components to reach a fully functional state, 
transitioning from the temporary `initramfs` environment to the real root file system, where the full set of system 
resources and modules become available for the continued boot process.
</details>