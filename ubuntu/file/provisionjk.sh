#!/bin/bash
sudo apt-get update
sudo apt-get install zsh -y
sudo apt-get install vim  -y
sudo apt-get install openjdk-11-jre -y 
sudo apt-get install curl wget git -y
echo "Install key"
sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null  

sudo apt-get update
sudo apt-get install sysvinit-utils -y
echo "Install jenkins"
sudo apt-get install jenkins -y
sudo systemctl enable jenkins
sudo systemctl daemon-reload
sudo systemctl restart jenkins

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

echo "Permissao de Usuario"
sudo usermod -aG docker jenkins
sudo usermod -aG docker vagrant

chsh -s /usr/bin/zsh vagrant

echo "fim"