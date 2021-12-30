#!/bin/bash
sudo swapoff -a
sudo apt-get update && sudo apt-get upgrade -y
echo "Install Docker"
sudo apt-get install -y docker.io apt-transport-https curl
sudo sh -c "echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' >> /etc/apt/sources.list.d/kubernetes.list"
sudo sh -c "curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -"
sudo apt-get update
sudo apt-get install -y kubeadm=1.21.1-00 kubelet=1.21.1-00 kubectl=1.21.1-00
sudo apt-mark hold kubelet kubeadm kubectl
sudo kubeadm init --kubernetes-version 1.21.1 --pod-network-cidr 192.168.0.0/16 | tee /tmp/kubeadm_init.out
sudo mkdir -p /home/${USER}/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/${USER}/.kube/config
sudo chown -R ${USER}:${USER} /home/${USER}/.kube
sudo curl https://docs.projectcalico.org/manifests/calico.yaml -o /tmp/calico.yaml
su - ${USER} -c "kubectl apply -f /tmp/calico.yaml"
su - ${USER} -c "kubectl get node"
sleep 10
su - ${USER} -c "kubectl taint nodes --all node-role.kubernetes.io/master-"
