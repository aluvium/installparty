#!/bin/bash

##################### - FUNCT - #############################
docker() {
	echo "hello word $1"
}
docker_compose() {
        echo "helo word $1"
}

help() {
	echo ""
	echo ""
	echo "[IP]"
	echo "This is Install Party. For help use '-h' flag."
	echo "For installing a tool type installparty <tool> "
	echo "eg. installparty docker"
	echo ""
	echo "[*] List of tools:"
	echo "    docker"
	echo "    docker-compose"
}

#############################################################

if [ $# -lt 1 ] ; then
	help

elif [ "$1" = -h ] ; then
	help

elif [ "$1" = docker ] ; then
	docker
elif [ "$1" = docker-compose ] ; then
	docker_compose
else
	echo "'$1' is a wrong argument, for help use -h"
fi
