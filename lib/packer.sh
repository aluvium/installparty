#!/bin/bash
var="packer"
packer() {
	echo ""
	echo "[*] Updating system.."
	echo ""
	apt-get update -y
	echo "[*] Checking if $var exist.."
	echo ""
	if [ -f /usr/bin/$var ] ; then echo "$var already installed." && exit 0 
	fi
	echo "[*] Adding $var public-key and updating source list.."
	echo ""
	curl -L https://apt.releases.hashicorp.com/gpg | apt-key add -
	
	sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/packer.list'
        echo "[*] Installing $var.. " 
	echo ""
	apt-get update -y
	apt-get install $var
	echo "[*] Instalation completed."
	echo ""
}
