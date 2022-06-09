#!/bin/bash
docker() {
	echo ""
	echo "[*] Updating system.."
	echo ""
	apt-get update -y
	echo "[*] Checking if docker exist.."
	echo ""
	[[ sh -c "docker --version" ]] 2> /dev/null || echo "Docker already installed." && exit 1 
	echo "[*] Adding docker public-key and updating source list.."
	echo ""
	wget -O- https://download.docker.com/linux/debian/gpg | apt-key add -
	
	sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu/ $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list'
        echo "[*] Installing Docker.. " 
	echo ""
	apt-get update -y
	apt-get install docker-ce -y
	[[ sh -c "docker --version" ]] || echo "[*] Ups.. something went wrong." && exit 2
	echo "[*] Instalation completed."
	echo ""
}
