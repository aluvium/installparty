#!/bin/bash
var2="docker"
docker() {
	echo ""
	echo "[*] Updating system.."
	echo ""
	apt-get update -y
	echo "[*] Checking if $var2 exist.."
	echo ""
	if [ -f /usr/bin/$var2 ] ; then echo "$var2 already installed." && exit 0
	fi	
	echo "[*] Adding $var2 public-key and updating source list.."
	echo ""
	wget -O- https://download.docker.com/linux/debian/gpg | apt-key add -
	
	sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu/ $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list'
        echo "[*] Installing $var2.. " 
	echo ""
	apt-get update -y
	apt-get install docker-ce -y
	echo "[*] Instalation completed."
	echo ""
}
