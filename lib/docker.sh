#!/bin/bash
var2="docker"
docker() {
	apt-get update -y
	echo "[*] Checking if $var2 exist.."
	echo ""
        if [ -f /usr/bin/$var1 ] ; then echo "$var1 already installed." && exit 0 ; fi  
	
	# KEY
	echo "[*] Adding $var2 public-key and updating source list.."
	echo ""
	wget -O- https://download.docker.com/linux/debian/gpg | apt-key add -
	
        # SOURCE
        if [ -f /etc/apt/sources.list.d/docker.list  ] ; then sudo rm '/etc/apt/sources.list.d/docker.list'; fi
	sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu/ $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list'
        echo "[*] Installing $var2.. " 
	echo ""
	apt-get update -y
	apt-get install docker-ce -y
	echo "[*] Instalation completed."
	echo ""
}
docker_compose() {
       if ! [ -f /usr/bin/docker ] ; then docker ; fi
       
       sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
       sudo chmod +x /usr/local/bin/docker-compose
       docker-compose --version
}
