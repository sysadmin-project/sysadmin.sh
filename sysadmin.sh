#! /bin/bash

clear

if [ "$EUID"  -ne 0 ]; then
echo
echo "run this script with SUDO..."
echo
exit
fi

install_tools() {
    echo "checking and installing dependencies...${RESET}"
    if [ "$OS" == "debian" ]; then
    apt update -y
    apt install -y nmap fping netcat hydra tcpdump glances inxi rkhunter nikto macchanger fail2ban lolcat
    elif [ "$OS" == "arch" ]; then
    pacman -Syu --noconfirm
    pacman -S  nmap fping glances inxi netcat hydra tcpdump rkhunter nikto macchanger fail2ban lolcat
    elif [ "$OS" == "fedora" ]; then
    dnf update -y
    dnf install -y nmap fping netcat hydra tcpdump  glances inxi rkhunter nikto macchanger fail2ban lolcat
    else
    echo "unsupported OS selected!"
    echo "$exiting...${RESET}"
    exit 1
    fi 
}


echo "
                                  _       _              
                                 | |     (_)             
         ___ _   _  ___  ____  _ | |____  _ ____         
        /___) | | |/___)/ _  |/ || |    \| |  _ \        
       |___ | |_| |___ ( ( | ( (_| | | | | | | | |       
       (___/ \__  (___/ \_||_|\____|_|_|_|_|_| |_|       
            (____/                                 "



echo 

networking_tools() {
    echo 
    echo "$networking tools${RESET}"
    echo
    echo "1. network scan (nmap)"
    echo "2. ping sweep (fping)"
    echo "3. open port scan (netcat)"
    echo "4. sniff network traffic (tcpdump)"
    echo "5. view network interfaces (ifconfig)"
    echo -n "choose (1-5) : " 
    read choice
    case $choice in
    1) echo -n "enter target IP address : "
    read target
    nmap -sP "$target"
    ;;
    2) echo -n "enter subnet (*192.168.1.) : "
    read subnet
    fping -a -g "${subnet}1" "${subnet}254"
    ;;
    3) echo -n "enter target IP address : "
    read target
    echo -n "enter port number : "
    read port
    netcat -zv "$target" "$port"
    ;;
    4) echo "enter the name of the network interface (*eno1) : " 
    read interface
    echo
    echo "starting tcpdump on interface $interface"
    echo 
    tcpdump -v -i $interface
    ;;
    5) echo "viewing network interfaces"
    ifconfig
    ;;
    *) echo "$invalid option${RESET}"
    ;;
    esac
}

system_tools() {
    echo 
    echo "$system tools${RESET}"
    echo
    echo "1. system information (inxi)"
    echo "2. system monitor (glances)"
    echo "3. list running services"
    echo "4. check for rootkits"
    echo "5. audit system with lynis"
    echo -n "choose (1-5) : "
    read choice
    case $choice in 
    1) echo "viewing system information"
    inxi -Fz
    ;;
    2) echo "glances system monitor"
    glances
    ;;
    3) echo "listing running services"
    systemctl list-units
    ;;
    4) echo "checking for rootkits"
    rkhunter --sk --check
    ;;
    5) echo "auditing system with lynis"
    lynis audit system --verbose
    ;;
    *) echo "$invalid option${RESET}"
    ;;
    esac
}

security_tools() {
    echo
    echo "$security tools${RESET}"
    echo
    echo "1. password brute-force attack (hydra)"
    echo "2. target scan with nikto"
    echo "3. enable and start TOR"
    echo "4. change interface mac-adress"
    echo "5. setup and configure fail2ban"
    read choice
    case $choice in 
    1) echo "password brute-force attack with hydra"
    echo -n "enter the target IP address : "
    read target
    echo -n "enter the username : "
    read username
    echo -n "enter the service (*ssh) : "
    read service
    echo -n "enter the path to the password list : "
    read passlist
    hydra -l "$username" -P "$passlist" "$target" "$service"
    ;;
    2) echo "target scan with nikto"
    echo -n "enter the website target : "
    read target
    nikto -h "$target"
    ;;
    3) "enabling and starting the TOR network"
    systemctl enable tor
    systemctl start tor
    echo "the TOR service is now running"
    echo
    echo "you can verify the status with: sudo systemctl status tor"
    ;;
    4) echo "enter the name of the interface (*eno1) : " 
    read interface
    echo
    echo "changing mac-address for $interface"
    echo
    macchanger -r "$interface"
    ;;
    5) echo "setup & configure fail2ban"
    if [ "$OS" == "debian" ] || [ "$OS" == "arch" ] || [ "$OS" == "fedora" ]; then 
    systemctl enable fail2ban
    systemctl start fail2ban
    echo 
    echo "fail2ban is running"
    echo
    else 
    echo
    echo "fail2ban may not be supported on this OS${RESET}"
    echo
    fi
    echo 
    fail2ban-client status
    echo
    ;;
    *) echo "$invalid option${RESET}"
    ;;
    esac
}

main_menu() {
    while true; do
    echo 
    echo "$sysadmin sysadmin > main menu${RESET}"
    echo
    echo "1. networking tools"
    echo "2. system tools"
    echo "3. security tools"
    echo "4. exit"
    echo -n "make your selection (1-4) : "
    read main_choice
    case $main_choice in
    1) networking_tools ;;
    2) system_tools ;;
    3) security_tools ;;
    4) echo "$exiting ...{RESET}"
    exit 0 ;;
    *) echo "$invalid option${RESET}" ;;
    esac
    echo
    done
}

echo
echo "$select select your operating system : ${RESET}"
echo 
echo "1. debian / ubuntu" 
echo "2. arch linux"
echo "3. fedora"
echo
echo -n "choose your OS (1-3) : "
echo 
read os_choice

case $os_choice in
1) OS="debian" ;;
2) OS="arch" ;;
3) OS="fedora" ;;
*)
echo "$invalid exiting${RESET}"
exit 1
;;
esac

install_tools

main_menu

