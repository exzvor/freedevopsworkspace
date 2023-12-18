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

<details>
<summary>cgroups in Linux</summary><br>

Control Groups (`cgroups`) in Linux are a kernel feature designed to manage and allocate system resources, 
such as CPU, memory, and I/O, among different processes. They serve a crucial role in scenarios where 
resource control, prioritization, and isolation are essential, such as in multi-tenant environments. 
By organizing processes into `cgroups`, administrators can ensure fair resource distribution and prevent 
one set of processes from negatively impacting others. To inspect `cgroups`, you can navigate the `cgroups` 
filesystem, usually mounted at `/sys/fs/cgroup`, using commands like ls. The `systemd-cgls` command provides 
a hierarchical view of `cgroups` managed by `systemd`, while information about a specific process's `cgroup` 
association can be found in the `/proc` directory. Overall, `cgroups` are integral for optimizing system 
performance and resource utilization in diverse computing environments.
</details>

<details>
<summary>namespaces in Linux</summary><br>

Namespaces in Linux provide a mechanism for isolating and virtualizing system resources, allowing processes 
to operate in independent environments. They are crucial for creating lightweight and secure containers. 
Linux supports various namespaces, including PID (Process ID), IPC (Inter-Process Communication), network, 
mount, and user namespaces. PID namespaces isolate processes, IPC namespaces provide separate inter-process 
communication channels, network namespaces enable network isolation, mount namespaces manage filesystem mount 
points independently, and user namespaces isolate user and group IDs. This isolation is essential for 
containerization technologies like `Docker` and `Kubernetes`. To examine namespaces, tools like `ip netns` and `lsns` 
can be used to list network namespaces and display information about other namespaces. In summary, namespaces 
in Linux facilitate the creation of isolated environments for processes, contributing to the efficiency and 
security of containerized applications in diverse computing environments.
</details>

# Networks

<details>
<summary>TCP/IP layers</summary><br>


The TCP/IP model consists of four layers: **the Application Layer**, dealing with high-level protocols 
like HTTP and FTP; **the Transport Layer**, managing end-to-end communication through protocols such as 
TCP and UDP; **the Internet Layer**, handling logical addressing and routing with IP; **and the Link Layer**, 
overseeing physical data transmission through technologies like Ethernet. Together, these layers form 
a hierarchical framework that enables efficient communication and data exchange across networks, from 
user applications down to the underlying hardware.
</details>

<details>
<summary>Main components of TCP/IP</summary><br>

1. **IP (Internet Protocol)**: Responsible for addressing and routing data packets so that they can travel across networks and arrive at the correct destination.
2. **TCP (Transmission Control Protocol)**: Provides reliable, connection-oriented communication between devices. It ensures that data is delivered in the correct order and without errors.
</details>

<details>
<summary>How does TCP/IP work</summary><br>

TCP/IP works by breaking down data into packets and then using IP to address and route these packets to their destination. 
TCP ensures that the packets are received in the correct order and without errors, providing reliable communication.
</details>

<details>
<summary>Key characteristics of TCP</summary><br>

- **Connection-oriented**: TCP establishes a connection before data is exchanged and ensures that data is delivered reliably.
- **Error-checking**: TCP includes error-checking mechanisms to ensure the integrity of the data being transmitted.
- **Flow control**: TCP manages the flow of data between sender and receiver to prevent congestion (the demand for network resources surpasses available capacity).
</details>

<details>
<summary>TCP vs UDP</summary><br>

The choice between TCP and UDP hinges on the specific requirements of the application. TCP, being connection-oriented, 
ensures reliable and ordered data delivery, making it suitable for applications prioritizing accuracy and completeness 
like file transfer and web browsing. On the other hand, UDP, a connectionless protocol, offers speed and lower 
latency, making it ideal for real-time applications such as online gaming and live streaming where occasional 
packet loss is acceptable. The decision involves a trade-off between the reliability and overhead of TCP and the 
speed and efficiency of UDP, with many applications leveraging both protocols based on their distinct strengths 
to optimize overall performance.
</details>

<details>
<summary>Most common protocols for TCP and UDP</summary><br>

1) TCP protocols:
   - `HTTP (80)` - Hypertext Transfer Protocol for web servers
   - `HTTPS (443)` - Secure Hypertext Transfer Protocol for secure web connections
   - `FTP (20, 21)` - File Transfer Protocol for exchanging files between computers on a network
2) UDP protocols:
   - `DNS (53)` - Domain Name System for translating names into IP addresses
   - `DHCP (67, 68)` - Dynamic Host Configuration Protocol for automatic network configuration
   - `SNMP (161, 162)` - Simple Network Management Protocol for monitoring and managing network devices
</details>

<details>
<summary>The purpose of DNS in TCP/IP</summary><br>

DNS (Domain Name System) is used in TCP/IP to translate human-readable domain names into IP addresses. 
This allows users to access websites and other resources using easy-to-remember names instead of numeric 
IP addresses.
</details>

<details>
<summary>How does DHCP work in the TCP/IP context</summary><br>

DHCP (Dynamic Host Configuration Protocol) is used to automatically assign IP addresses to devices on a network. 
It simplifies the process of network configuration by dynamically allocating IP addresses to devices when they join the network.
</details>

<details>
<summary>Subnetting in networking</summary><br>

Subnetting is used to improve network performance, enhance security, and efficiently utilize IP addresses 
by dividing a large network into smaller, more manageable segments.
</details>

<details>
<summary>What is a subnet mask?</summary><br>

A subnet mask is a 32-bit numeric address that divides an IP address into network and host portions. 
It is used to identify the network and host portions of an IP address.
</details>

<details>
<summary>Calculation for the IP addresses with a subnet</summary><br>

`Example: 192.168.1.29/24`. The "/24" in the subnet mask indicates that the first 24 bits are allocated for the network portion, 
leaving 32 - 24 = 8 bits for host addresses within each subnet. Since it's a /24 subnet, there are 2^8
= 256 possible host addresses, but 2 addresses are reserved for the network address and the broadcast address. 
Therefore, there are 256 - 2 = 254 usable host addresses. The usable range of host addresses falls between the network address and the broadcast address.

`Network Address: 192.168.1.0`
`Usable Range:    192.168.1.1 to 192.168.1.254`
`Broadcast Addr:  192.168.1.255`

So, in this case, the IP address 192.168.1.29 is part of the subnet 192.168.1.0/24, and it is one of the usable host addresses within that subnet.

_Other example_
In case of , since it's a /16 subnet, there is only one subnet, and each subnet can have 2^16= 65,536 possible hosts.
Therefore, there are 65,536 - 2 = 65,534 usable host addresses.
The IP address 192.168.1.0 is the network address of the subnet 192.168.0.0/16, and the usable range of host
addresses within this subnet is from 192.168.0.1 to 192.168.255.254.

`Original Network: 192.168.1.0/16`

`Subnet 1: 192.168.1.0/24`
`Subnet 2: 192.168.2.0/24`
`Subnet 3: 192.168.3.0/24`
`Subnet etc.:`
</details>

<details>
<summary>The process when a user types "google.com" into a web browser</summary><br>

1. **Local Hosts File:** </br>
_Protocol Used: N/A (File System)>_
- Before making a DNS query, the operating system checks the local `.host` file for an entry related to "google.com."
- If an entry is found in the host file, the associated IP address is used directly, bypassing the DNS resolution process.
2. **Local DNS Cache:** </br>
_Protocol Used: DNS (Domain Name System)_
- Before initiating a DNS resolution request to external DNS servers, the operating system checks its local DNS cache.
- If the domain name and its corresponding IP address are found in the local DNS cache (due to recent queries or cached entries), the DNS resolution process can be bypassed. The cached IP address is used directly.
3. **DNS Resolution:** </br>
_Protocol Used: DNS (Domain Name System)_
- If the domain name is not found in the local DNS cache or if the cached entry has expired (based on the Time to Live or TTL value), the operating system proceeds with a DNS resolution request.
- The local DNS resolver sends a query to external DNS servers, such as recursive DNS servers provided by the Internet Service Provider (ISP) or public DNS servers like Google's 8.8.8.8.
- The external DNS servers may, in turn, consult authoritative DNS servers to obtain the IP address associated with the requested domain.
4. **TCP/IP Stack and ARP:** </br>
_Protocols Used: ARP (Address Resolution Protocol), IP (Internet Protocol)_
- Once the IP address is obtained, the browser initiates a connection to the Google server using the TCP/IP stack.
- ARP is used to resolve the IP address to the MAC (Media Access Control) address on the local network.
5. **TCP Handshake:** </br>
_Protocol Used: TCP (Transmission Control Protocol)_
- A three-way handshake is performed between the user's device and the Google server to establish a reliable connection.
- The TCP handshake involves the exchange of SYN (synchronize), SYN-ACK (synchronize-acknowledge), and ACK (acknowledge) packets.
6. **HTTP/HTTPS Request:** </br>
_Protocol Used: HTTP (Hypertext Transfer Protocol) or HTTPS (HTTP Secure)_
- After the TCP connection is established, the browser sends an HTTP or HTTPS request to the Google server.
- If HTTPS is used, the communication is encrypted using SSL/TLS (Secure Sockets Layer/Transport Layer Security).
7. **Web Server Response:** </br>
_Protocol Used: HTTP/HTTPS_
- The Google web server processes the request and sends back an HTTP or HTTPS response.
- The response includes the requested web page content, status codes, and additional information.
8. **Rendering the Web Page:** </br>
_Used: HTML, JS, CSS_
- The browser receives the response and renders the web page, displaying text, images, and other content.
</details>