#!/bin/env bash
docker() {
        echo "[*] Checking if $1-compose exist.."
        echo ""
	if [ -f /usr/bin/$1 ] ; then echo "$1 already installed." && exit 0 ; fi  
	apt-get update -y
	# KEY
	echo "[*] Adding $1 public-key and updating source list.."
	echo ""
	wget -O- https://download.docker.com/linux/debian/gpg | apt-key add -
	
        # SOURCE
        if [ -f /etc/apt/sources.list.d/docker.list  ] ; then sudo rm '/etc/apt/sources.list.d/docker.list'; fi
	sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu/ $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list'
        echo "[*] Installing $1.. " 
	echo ""
	apt-get update -y
	apt-get install docker-ce -y
	echo "[*] Instalation completed."
	echo ""
}
docker_compose() {
        var2="docker_compose"
        echo "[*] Checking if $var2 exist.."
        echo ""
        if ! [ -f /usr/bin/docker ] ; then docker ; fi
        if [ $($var2 2> /dev/null && echo $?) -eq 0 ] ; then echo "$var2 already installed" && exit 0 ; fi

        sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
        docker-compose --version
}
