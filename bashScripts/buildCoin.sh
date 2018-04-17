#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install wget nano unrar unzip libboost-all-dev libevent-dev software-properties-common -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y

sudo fallocate -l 1500M /mnt/1500MB.swap
sudo dd if=/dev/zero of=/mnt/1500MB.swap bs=1024 count=1572864
sudo mkswap /mnt/1500MB.swap
sudo swapon /mnt/1500MB.swap
sudo chmod 600 /mnt/1500MB.swap
sudo echo '/mnt/1500MB.swap  none  swap  sw 0  0' >> /etc/fstab

sudo apt-get install ufw

sudo ufw allow 22/tcp
sudo ufw limit 22/tcp
sudo ufw allow 5500/tcp
sudo ufw logging on
sudo ufw --force enable

sudo apt-get install libzmq3-dev libminiupnpc-dev -y
wget https://github.com/shekeltechnologies/JewNew/releases/download/1.3.0.0/shekel-Ubuntu16.04-1.3.0.zip
unzip shekel-Ubuntu16.04-1.3.0.zip
rm shekel-Ubuntu16.04-1.3.0.zip
sudo chmod +x shekel-cli shekeld
mv shekel-cli shekeld /usr/local/bin/
cd ..
shekeld