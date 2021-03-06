#!/bin/bash
##################### - Sources - ###########################
. "./lib/hashi.sh"
. "./lib/docker.sh"
. "./lib/kuber.sh"
. "./lib/jenk.sh"
##################### - FUNCT - #############################

help() {
	echo ""
	echo ""
	echo "[IP]"
	echo "This is Install Party. For help use '-h' flag."
	echo "For installing a tool type installparty <tool> "
	echo "eg. sudo installparty docker"
	echo "You need to have superuser privilages."
	echo "This tool works only on Debian operating systems."
	echo ""
	echo "[*] List of tools:"
	cat ./vars.txt | sort
}

#############################################################

case "$1" in 
	"docker")	    docker ;;
	"docker-compose")   docker_compose ;;
	"k3s")              k3s ;;
	"k3s-agent")        k3s_agent ;;
	"arkade")           arkade ;;
	"helm")             helm ;;
	"terraform")        terraform ;;
	"packer")           packer ;;
        "jenkins")          jenkins ;;
	
	"-h")               help ;;
  	 *  )               help ;;
esac
exit 0
