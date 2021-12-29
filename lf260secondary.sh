#!/bin/bash
sudo swapoff -a
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y docker.io
sudo sh -c "echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' >> /etc/apt/sources.list.d/kubernetes.list"
sudo sh -c "curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -"
sudo apt-get update
sudo apt-get install -y kubeadm=1.21.1-00 kubelet=1.21.1-00 kubectl=1.21.1-00
sudo apt-mark hold kubelet kubeadm kubectl

