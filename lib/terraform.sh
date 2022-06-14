#!/bin/bash
var1="terraform"
terraform() {
	apt-get update -y
	echo "[*] Checking if $var1 exist.."
	echo ""
	if [ -f /usr/bin/$var1 ] ; then echo "$var1 already installed." && exit 0 
	fi
	echo "[*] Adding $var1 public-key and updating source list.."
	echo ""
	curl -L https://apt.releases.hashicorp.com/gpg | apt-key add -
	
	if ! [ -f /etc/apt/sources.list.d/hashicorp.list  ] ; then 
	  sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list'
        fi	
	echo "[*] Installing $var1.. " 
	echo ""
	apt-get update -y
        apt-get install $var1
	echo "[*] Instalation completed."
	echo ""
}
