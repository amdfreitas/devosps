#!/bin/bash
sudo yum update -y
sudo yum install yum-utils zsh vim curl wget git  java-11-openjdk -y

echo "Install key"
sudo yum-config-manager  --add-repo  https://download.docker.com/linux/centos/docker-ce.repo
sudo yum update -y
sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo usermod -aG docker vagrant
sudo systemctl daemon-reload
sudo systemctl enable docker
sudo systemctl restart docker

echo "Intall Kind"
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

echo "Intall kubectl"
curl -LO https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

chsh -s /usr/bin/zsh vagrant