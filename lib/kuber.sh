#!/bin/bash
k3s() {
    apt-get update
    curl -fLS https://get.k3s.io | sh -
}
arkade() {
    k3s
    curl -fLS https://get.arkade.dev | sudo sh
}
helm() {
    k3s
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash  
}  
k3s_agent(){
    echo -n "Enter K3S Token: "
    read token
    echo "Enter address of the server with port eg. https://server-url:6443"
    read server
    echo "$token"
    echo "$server"
    apt-get update
    curl -fLS https://get.k3s.io |  K3S_TOKEN=$token K3S_URL=$server sh -    
}
