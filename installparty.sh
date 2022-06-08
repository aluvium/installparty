#!/bin/bash
##################### - Sources - ###########################
. "./lib/terraform.sh"
. "./lib/docker.sh"
. "./lib/docker-compose.sh"
#. ./lib.dockercompose.sh
#. ./lib/*
##################### - FUNCT - #############################

#docker_compose() {
#        echo "helo word $1"
#}
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
	echo "    terraform"
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
elif [ "$1" = terraform ] ; then
	terraform
else
	echo "'$1' is a wrong argument, for help use -h"
fi
