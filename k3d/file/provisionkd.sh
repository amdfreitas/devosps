#!/bin/bash
sudo yum update -y
sudo yum install yum-utils zsh vim curl wget git  java-11-openjdk -y

echo "Install key docker"
sudo yum-config-manager  --add-repo  https://download.docker.com/linux/centos/docker-ce.repo
sudo yum update -y
sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo usermod -aG docker vagrant
sudo systemctl daemon-reload
sudo systemctl enable docker
sudo systemctl restart docker

echo "Intall kubectl"
curl -LO https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

chsh -s /usr/bin/zsh vagrant
#k3d cluster create  mycluster --api-port 6443 --servers 1 --agents 4 --port "30300-31200:30200-31200@server:0"
#andersonm@Menezes223lele
#kubectl apply -n portainer -f https://downloads.portainer.io/ce2-16/portainer.yaml