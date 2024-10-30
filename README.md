# sysadmin.sh

This is a bash script designed to assist with basic pentesting and system administration across various Linux distributions. 
Currently the script supports **Debian/Ubuntu**, **Arch Linux**, and **Fedora**.
It includes tools for networking, system information, and security tasks, tailored based on the selected OS.

![2024-10-30_19-53](https://github.com/user-attachments/assets/3537fd93-c9cc-43f8-9fe7-a8d6e3933d4e)

![2024-10-30_19-58](https://github.com/user-attachments/assets/25520e68-f6b3-430e-866c-875d9c37fc45)


## Features

1. **OS Detection**: Select your OS at the start of the script.
2. **Dependency Installation** Automatically installs the required tools for each OS.
3. **Networking Tools**:
   - Network Scanning with nmap.
   - Ping Sweep.
   - Open Port Check.
   - Sniff Network Traffic.

![2024-10-30_20-00](https://github.com/user-attachments/assets/eea93342-c5da-49eb-aa54-615cc3a7e2bb)


4. **System Tools**:
   - System Information with inxi.
   - Glances System Monitor.
   - Check for rootkits.
   - Audit System.

![2024-10-30_20-02](https://github.com/user-attachments/assets/efa1f48c-f74f-4620-8bcd-cb00cf30a928)


5. **Security Tools**:
   - Password Brute-Force Attack with Hydra.
   - Enable TOR network.
   - Change MacAddress.
   - Target Scan with Nikto.

![2024-10-30_20-04](https://github.com/user-attachments/assets/54f603b4-a1c7-4993-9d87-b9df634daaf4)

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


