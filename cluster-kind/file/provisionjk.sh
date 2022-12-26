#!/bin/bash

sudo yum update
sudo yum install zsh vim curl wget git  openjdk-11-jre -y
chsh -s /usr/bin/zsh vagrant

echo "Install key"
sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null 
sudo systemctl daemon-reload
echo "Install jenkins" 
sudo yum update
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl restart jenkins

