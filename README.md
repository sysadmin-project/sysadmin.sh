# sysadmin.sh

This is a bash script designed to assist with basic pentesting and system administration across various Linux distributions. 
Currently the script supports **Debian/Ubuntu**, **Arch Linux**, and **Fedora**.
It includes tools for networking, system information, and security tasks, tailored based on the selected OS.

## Features

1. **OS Detection**: Select your OS at the start of the script.
2. **Dependency Installation** Automatically installs the required tools for each OS.
3. **Networking Tools**:
   - Network Scanning with nmap.
   - Ping Sweep.
   - Open Port Check.
   - Sniff Network Traffic.

4. **System Tools**:
   - System Information with inxi.
   - Glances System Monitor.
   - Check for rootkits.
   - Audit System.

5. **Security Tools**:
   - Password Brute-Force Attack with Hydra.
   - Enable TOR network.
   - Change MacAddress.
   - Target Scan with Nikto.

## Requirements

This script requires **bash** and **sudo** permissions.

## Installation

1. Clone this repository:

```git clone https://github.com/sysadmin-project/sysadmin.sh.git```

2. Make the script executable:

```chmod +x sysadmin.sh```

## Usage

1. Run the script:

```sudo ./sysadmin.sh```

2. Follow the script prompts:
   - Select your OS.
   - Install Dependencies.
   - Navigate through the Networking, System, and Security tools.

## Supported operating systems

- Debain / Ubuntu
- Arch Linux
- Fedora

## License 

This project is licensed under the MIT License, see the relevant files for more information.


