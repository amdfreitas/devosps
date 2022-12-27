#!/bin/bash
sudo yum update
sudo yum install zsh vim curl wget git -y
sudo systemctl daemon-reload
echo "Install key"
cat <<EOT > /etc/yum.repos.d/jenkins.repo
[jenkins]
name=Jenkins-stable
baseurl=http://pkg.jenkins.io/redhat-stable
gpgcheck=1
EOT
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum update
sudo yum install  java-11-openjdk -y
echo "Install jenkins" 
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl daemon-reload
sudo systemctl restart jenkins
chsh -s /usr/bin/zsh vagrant