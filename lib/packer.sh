#!/bin/bash
var="packer"
packer() 
        { 
	apt-get update -y
	if [ -f /usr/bin/$var ] ; then echo "$var already installed." ; exit 0 
	fi
	echo "[*] Adding $var public-key and updating source list.."
	echo ""
	curl -L https://apt.releases.hashicorp.com/gpg | apt-key add -
	
	if [ -f /etc/apt/sources.list.d./hashicorp.list ] ; then sudo rm '/etc/apt/sources.list.d/hashicorp.list' ; fi

	sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list'
	apt-get update -y
	apt-get install $var
	echo "[*] Instalation completed."
	echo ""
}
