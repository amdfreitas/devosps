#!/bin/bash
sudo apt-get update
sudo apt-get install zsh vim curl wget git  nfs-common net-tools -y

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
token='SWMTKN-1-31xvclyb207p3720shsenliin3syvc7xokr70glqdz61nxkmmz-90v2kno7x9wf8zyp2pfpxmelk'
echo `docker swarm join --token $token 192.168.56.12:2377`
