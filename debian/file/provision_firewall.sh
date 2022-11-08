groupadd squid
sudo apt-get update
sudo apt-get install zsh tar  squid -y
sudo cat <<EOT >> /etc/resolv.conf
nameserver 192.168.56.8
nameserver 192.168.56.9
nameserver 192.168.56.11
EOT

#sudo wget http://www.squid-cache.org/Versions/v4/squid-4.17.tar.gz
#sudo tar -xvzf  squid-4.17.tar.gz /opt
#sudo mv  /opt/squid-4.17 /opt/squid
#sudo useradd -g vagrant  -s /opt/squid squid