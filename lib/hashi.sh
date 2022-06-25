#!/bin/bash
terraform() {
        var1="terraform"
	apt-get update -y
	if [ -f /usr/bin/$var1 ] ; then echo "$var1 already installed." && exit 0 ; fi
	curl -L https://apt.releases.hashicorp.com/gpg | apt-key add -
	
	if [ -f /etc/apt/sources.list.d/hashicorp.list  ] ; then sudo rm '/etc/apt/sources.list.d/hashicorp.list'; fi
	sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list'
	apt-get update -y
        apt-get install $var1
	echo "[*] Instalation completed."
	echo ""
}
