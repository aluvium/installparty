#!/bin/bash

j_install() {
    apt-get update -y
    apt-get install openjdk-11-jdk -y
    apt-get install net-tools -y
    mkdir /usr/jenkins
    cd /usr/jenkins
    wget https://get.jenkins.io/war-stable/2.332.3/jenkins.war
    java -jar /usr/jenkins/jenkins.war --httpPort=$port &
  }

jenkins() {
    read  -p "Please specify port you want Jenkins at: " port
    case $port in
        ''|*[!0-9]*)    echo "Wrong number try again" && jenkins ;;
        *)              echo "You pick $port for Jenkins server" && inst_check ;;
    esac
}

inst_check() {
    a=$(find / -type f -name jenkins.war)
    if [[ -f $a ]] ; then echo "Jenkins already exist" && just_port && exit 0 ; fi
    j_install
}

just_port() {
    java -jar $a --httpPort=$port &
}
