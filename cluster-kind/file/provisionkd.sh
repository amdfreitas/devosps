#!/bin/bash
sudo yum update
sudo yum install yum-utils zsh vim curl wget git  openjdk-11-jre -y

echo "Install key"

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo usermod -aG docker vagrant
sudo systemctl daemon-reload
sudo systemctl enable docker
sudo systemctl restart docker

echo "Intall Kind"
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

chsh -s /usr/bin/zsh vagrant

kind creater cluster mycluster --config /file/mycluster.yaml