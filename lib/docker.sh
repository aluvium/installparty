#!/bin/bash
docker() {
	echo ""
	echo "[*] Updating system.."
	apt-get update -y
	echo  [*] Checking if docker exist..
	[[ docker --version ]] 2> /dev/null && echo "Docker already installed." && exit 1 
	echo "[*] Adding docker public-key and updating source list.."
	wget -O- https://download.docker.com/linux/debian/gpg | apt-key add -
	sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu/ $(lsb_release -cs) stable" >> /etc/apt/sources.list'
}
