#!/bin/bash

echo "\nStarting... If error, try to run: sed -i -e 's/\r$//' ignition_key.sh\n"

# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
	echo -e "\n${RED}${1}${NC}"
}
function GREEN(){
	echo -e "\n${GREEN}${1}${NC}"
}
function YELLOW(){
	echo -e "\n${YELLOW}${1}${NC}"
}
function BLUE(){
	echo -e "\n${BLUE}${1}${NC}"
}

# Testing if root...
if [ $UID -ne 0 ]
then
	RED "You must run this script as root!" && echo
	exit
fi



BLUE "Updating repositories..."
sudo apt update

BLUE "Installing git..."
sudo apt install -y git

BLUE "Installing Sublime Text..." # according to https://www.sublimetext.com/docs/3/linux_repositories.html-
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

BLUE "Installing terminator..."
sudo apt install -y terminator

BLUE "Setting terminator as the default terminal emulator..."
sed -i s/Exec=gnome-terminal/Exec=terminator/g /usr/share/applications/gnome-terminal.desktop

BLUE "Forcing a color prompt in ~/.bashrc..."
grep "export PS1" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> ~/.bashrc
fi

BLUE "Installing task..."
sudo apt-get install -y taskwarrior

BLUE "Installing pip..."
sudo apt-get install -y python-pip

BLUE "Removing boilerplate home directories..."
rmdir ~/Documents ~/Music ~/Public ~/Templates ~/Videos

# BLUE "Installing guake..."
# sudo apt-get install -y guake

BLUE "Installing openvpn..."
sudo apt-get install -y openvpn

BLUE "Installing nmap..."
sudo apt-get install -y nmap

BLUE "Installing docker..."
sudo apt-get install -y docker.io
sudo groupadd docker
sudo usermod -aG docker `logname`

BLUE "Installing curl..."
sudo apt-get install -y curl

BLUE "Installing exiftool..."
sudo apt-get install -y exiftool

BLUE "Installing Python PIL..."
sudo apt-get install -y python-pil

# BLUE "Installing sqlitebrowser..."
# sudo apt-get install -y sqlitebrowser

# BLUE "Installing Wireshark..."
# sudo apt-get install -y wireshark

BLUE "Installing python-requests..."
pip install requests

BLUE "Installing idle..."
sudo apt install -y idle

# BLUE "Installing xclip..."
# sudo apt install -y xclip
# grep "alias xclip" ~/.bashrc
# if [ $? -eq 1 ]
# then
# 	echo "alias xclip='xclip -selection clipboard'" >> ~/.bashrc
# fi

BLUE "Installing Python flask..."
sudo pip install flask

BLUE "Installing Python flask-login..."
sudo pip install flask-login

BLUE "Installing Python colorama..."
sudo pip install colorama

BLUE "Installing Python passlib..."
sudo pip install passlib

BLUE "Installing hexedit..."
sudo apt install -y hexedit	

BLUE "Installing Python pwntools..."
sudo pip install pwntools

BLUE "Installing Go..."
sudo apt install -y golang-go
BLUE "Adding GOPATH and GOBIN to .bashrc, so future installs are easy.."
grep "export GOPATH" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "export GOPATH=\$HOME/.go/" >> ~/.bashrc
fi
grep "export GOBIN" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "export GOBIN=\$HOME/.go/bin" >> ~/.bashrc
	echo "export PATH=\$PATH:\$GOBIN" >> ~/.bashrc
fi

BLUE "Installing sqlite..."
sudo apt install -y sqlite	

BLUE "Installing nikto..."
sudo apt install -y nikto

BLUE "Installing Oracle Java 8..."
echo "" | sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer

# BLUE "Installing fcrackzip..."
# sudo apt install -y fcrackzip

BLUE "Installing unrar..."
sudo apt install -y unrar

BLUE "Installing Python library iptools..."
sudo pip install iptools

BLUE "Installing Python library OpenSSL..."
sudo pip install pyopenssl

# BLUE "Installing Python library pydispatch..."
# sudo pip install pydispatch

BLUE "Installing sshpass..."
sudo apt install -y sshpass

BLUE "Installing tcpflow..."
sudo apt install -y tcpflow

# devme4f added
BLUE "Installing proton-vpn"
sudo apt -y install protonvpn

BLUE "Installing gobuster"
sudo apt install -y gobuster

BLUE "Installing python3"
sudo apt install python3

BLUE "Installing python2"
sudo apt install python2

BLUE "Installing php"
sudo apt install php
