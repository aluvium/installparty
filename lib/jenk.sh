#!/bin/bash

jenkins() {
    apt-get update -y
    apt-get install openjdk-11-jdk -y
    apt-get install net-tools -y
    mkdir /usr/jenkins
    cd /usr/jenkins
    wget https://get.jenkins.io/war-stable/2.332.3/jenkins.war
    java -jar jenkins.war --httpPort=8082 &
    chck
  }

chck() {
    P=$(netstat -nutap | awk ' { if($4 == ":::8082") print $4 }') 
    if [ "$P" = ":::8082" ] ; then
        echo "[*] Jenkins is running."
    else
	echo "[*] Jenkins not active"
    fi
}
