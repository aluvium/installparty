#!/bin/env bash
docker() {
        var1="docker"
        echo "[*] Checking if $var1-compose exist.."
        echo ""
	if [ -f /usr/bin/$var1 ] ; then echo "$var1 already installed." && exit 0 ; fi  
	apt-get update -y
	# KEY
	echo "[*] Adding $var1 public-key and updating source list.."
	echo ""
	wget -O- https://download.docker.com/linux/debian/gpg | apt-key add -
	
        # SOURCE
        if [ -f /etc/apt/sources.list.d/docker.list  ] ; then sudo rm '/etc/apt/sources.list.d/docker.list'; fi
	sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu/ $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list'
        echo "[*] Installing $var1.. " 
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

        curl -L -o /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/v2.11.0/docker-compose-linux-x86_64
        chmod +x /usr/local/bin/docker-compose
        docker-compose --version
}
