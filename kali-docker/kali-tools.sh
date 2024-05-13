#!/bin/bash
# Ensure script runner = ROOT
rootID='0';
if [[ ${UID} -eq ${rootID} ]];
then 
    # Checking internet access
    checkInternet=$(ping -c 2 1.1.1.1);
    if [[ ${checkInternet} -eq 0 ]];
    then
        echo "Confirm internet connectivity :D";
        echo "Proceeding!!!!";
    else
        echo "Cannot confirm internet connectivity :(";
        echo "Will attempt to install tools, but likely to fail...";
    fi
    # Create /home/root
    user=$(whoami);
    mkdir /home/${user};
    if [[ ${?} -eq 0 ]];
    then
        echo "Succeeded in creating /home/${user}";
    else
        echo "Failed to create /home/${user}";
    fi
    # Create /home/root/Desktop
    mkdir /home/${user}/Desktop;
    if [[ ${?} -eq 0 ]];
    then
        echo "Succeeded in creating /home/${user}/Desktop";
    else
        echo "Failed to create /home/${user}/Desktop";
    fi
    # Create /home/root/Downloads
    mkdir /home/${user}/Downloads;
    if [[ ${?} -eq 0 ]];
    then
        echo "Succeeded in creating /home/${user}/Downloads";
    else
        echo "Failed to create /home/${user}/Downloads";
    fi
    echo "Changing Kernel settings to disable Restart pop-ip in /etc/needrestart/needrestart.conf";
    echo "To avoid Daemons Restart pop-up during Open-source attack tools installation";
    restartConf='/etc/needrestart/needrestart.conf';
    existingRestart=$(grep '$nrconf{restart}' ${restartConf});
    targetRestart="\$nrconf{restart} = 'a'";
    sed -i "s/$existingRestart/$targetRestart/g" $restartConf;
    if [[ ${?} -eq 0 ]];
    then
        echo "==============================";
        echo "Succeeded in disabling Daemon pop-up before Tools installation";
        echo "==============================";
    else
        echo "Failed to disable Daemon pop-up";
        echo "";
        echo "Daemon alert may come up during Tools installation";
        echo "";
        echo "You may need to manually TAB => OK during installation...";
        echo "";
    fi
    echo "Continuing to Install Open-source hacking tools :D!";
    echo "";
    echo "======================================";
    echo "======================================";
    echo "";
    # APT update
    apt-get update;
    # Start installing tones of customized hacking tools
    ## ifconfig must be added to sys variables
    # net-tools (ifconfig)
    ##
    # VIM Editor
    # mac-robber
    # SNAP
    # Git
    # Ettercap-graphical
    # Hydra
    # Cassandra
    # Beef-XSS (Beef project)
    # Metasploit dependencies
    ## 'tee' 'curl' 'ca-certificates' 'openssl' 'apt-transport-https' 'software-properties-common' 'lsb-release' 'postgresql'
    #
    ## Import Metasploit APT Repository on Debian
    # curl -fsSL https://apt.metasploit.com/metasploit-framework.gpg.key | sudo gpg --dearmor | sudo tee /usr/share/keyrings/metasploit.gpg > /dev/null
    ## Add Metasploit Repository
    # echo "deb [signed-by=/usr/share/keyrings/metasploit.gpg] https://apt.metasploit.com/ buster main" | sudo tee /etc/apt/sources.list.d/metasploit.list
    ## Apt install Metasploit
    # apt install metasploit-framework
    ## First-time setup
    # msfconsole
    tools=('net-tools'
            'netcat-traditional'
            'inetutils-tools'
            'inetutils-ping'
            'tcpdump'
            'vim'
            'build-essential'
            'python3'
            'aircrack-ng'
            'gawk'
            'iproute2'
            'iw'
            'pciutils'
            'procps'
            'tmux'
            'xterm'
            'perl'
            'apktool'
            'python3-selenium'
            'python3-scapy'
            'python3-jedi'
            'python3-bluez'
            'python3-bs4'
            'python3-ctypescrypto'
            'python3-fleep'
            'python3-libarchive-c'
            'python3-netifaces'
            'python3-pil'
            'python3-prettytable'
            'python3-pycryptodome'
            'python3-requests'
            'python3-dicttoxml'
            'arping'
            'adduser'
            'gawk'
            'nmap'
            'arp-scan'
            'curl'
            'lsof'
            'wget'
            'unicorn-magic'
            'hping3'
            'httprobe'
            'httpx-toolkit'
            'hydra'
            'smbclient'
            'zsh'
            'sudo'
            'ca-certificates'
            'python3-pip'
            'snapd'
            'git'
            'unzip'
            'veil'
            'whatmask'
            'whatweb'
            'whois'
            'screen'
            'wifi-honey'
            'cowpatty'
            'iptables'
            'netmask'
            'netsed'
            'debconf'
            'openvpn'
            'ettercap-graphical'
            'forensic-artifacts'
            'python3-artifacts'
            'rtpflood'
            'dmeventd'
            'rainbowcrack'
            'iproute2'
            'vlan'
            'traceroute'
            'ncat'
            'commix'
            'bruteforce-luks'
            'bruteforce-salted-openssl'
            'bruteshark'
            'brutespray'
            'btscanner'
            'bulk-extractor'
            'bytecode-viewer'
            'cabextract'
            'cadaver'
            'caldera'
            'calico'
            'capstone'
            'ccrypt'
            'certgraph'
            'certipy-ad'
            'cewl'
            'changeme'
            'chaosreader'
            'cherrytree'
            'chirp'
            'chisel'
            'chkrootkit'
            'chntpw'
            'chromium'
            'cifs-utils'
            'cillium-cli'
            'cisco-audting-tool'
            'cisco-ocs'
            'cisco-torch'
            'cisco7crack'
            'clamav'
            'cloud-enum'
            'cloudbrute'
            'cmospwd'
            'cmseek'
            'cntlm'
            'code-oss'
            'colly'
            'command-not-found'
            'commix'
            'copy-router-config'
            'cosign'
            'covenant-kbx'
            'cowpatty'
            'make'
            'postgresql'
            'crack-common'
            'libc6'
            'libcrypt1'
            'libavcodec60'
            'libavformat60'
            'mac-robber' 
            'snapd' 
            'docker.io'
            'cassandra' 
            'tee' 
    );
    # Iterate through $tools[@] && Install each tool
    for tool in ${tools[@]};
    do
        echo "Installing tool: ${tool}";
        installTools=$(apt install ${tool} -y);
        if [[ ${?} -eq 0 ]];
        then
            echo "======================================";
            echo "";
            echo "";
            echo "Succeeded in installing ${tool}";
            echo "======================================";
            echo "======================================";
            echo "";
        else
            echo "======================================";
            echo "";
            echo "";
            echo "Failed to install ${tool}";
            echo "======================================";
            echo "======================================";
            echo "";
            echo "";
        fi
    done
    if [[ ${?} -eq 0 ]];
    then
        echo "Succeeded in installing all tools";
        echo "Exiting...";
        exit 0;
    else   
        echo "Failed to install all tools...";
        echo "Exiting with 1...";
        exit 1;
    fi
else
    echo "You aren't ROOT :(";
    echo "Exiting with 1...";
    exit 1;
fi

