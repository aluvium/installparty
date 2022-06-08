#!/bin/bash
## DOCKER
docker() {
	echo "hello word $1"
}
help() {
	echo ""
	echo ""
	echo "[PI]"
	echo "This is Party Install. For help use -h flag."
	echo "For installing a tool type partyinstall <tool> "
	echo "eg. partyinstall docker"
	echo ""
	echo "[*] List of tools:"
	echo "    docker"
}



if [ $# -lt 1 ] ; then
	help

elif [ "$1" = -h ] ; then
	help

elif [ "$1" = docker ] ; then
	docker
else
	echo "'$1' is a wrong argument, for help use -h"
fi
