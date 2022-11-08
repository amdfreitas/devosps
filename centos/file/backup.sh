#!/bin/bash
sudo yum update
sudo yum install zsh -y
sudo yum install vim  -y
sudo yum  install nfs-utils -y

chsh -s /usr/bin/zsh vagrant
