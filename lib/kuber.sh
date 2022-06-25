#!/bin/env bash
k3s() {
  var1="k3s"
  if [ $($var1 2> /dev/null && echo $?) -eq 0 ] ; then echo "$var1 already installed" && exit 0 ; fi
  apt-get update
  curl -fLS https://get.k3s.io | sh -
}
arkade() {
  k3s
  var2=$1
  if [ $($var2 2> /dev/null && echo $?) -eq 0 ] ; then echo "$var2 already installed" && exit 0 ; fi
  curl -fLS https://get.arkade.dev | sudo sh
}
helm() {
  k3s
  var2=$1
  if [ $($var2 2> /dev/null && echo $?) -eq 0 ] ; then echo "$var2 already installed" && exit 0 ; fi
  curl -fLS -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  chmod 700 get_helm.sh
  ./get_helm.sh
}  
