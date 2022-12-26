#!/bin/bash
sudo apt-get update
sudo apt-get install zsh vim curl wget git nfs-kernel-server  net-tools -y

echo "Install Docker"
sudo apt-get install  \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
sudo mkdir -p /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo systemctl daemon-reload

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo systemctl enable docker
sudo systemctl restart docker
sudo usermod -aG docker vagrant

chsh -s /usr/bin/zsh vagrant
docker swarm init --advertise-addr 192.168.56.12

echo "Deretorio DATABASE"
mkdir -p /lojasystem/database
echo "/lojasystem/database    client_ip(rw,sync,no_subtree_check)" >> /etc/exports
chmod -R 777 /lojasystem/database
exportfs -ar
ufw allow from 196.168.56.0/24 2049
ufw enable

sudo systemctl restart nfs-kernel-server

echo "token='`docker swarm join-token --quiet manager`'" >> /file/works.sh

echo "echo \`docker swarm join --token \$token 192.168.56.12:2377\`" >> /file/works.sh