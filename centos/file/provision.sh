#!/bin/bash
useradd amdfreitas
sudo yum update
sudo yum install zsh -y
sudo yum install vim  -y
sudo yum  install  nfs-ultis  lvm2 -y
sudo systemctl enable nfs
sudo systemctl start nfs
chsh -s /usr/bin/zsh vagrant