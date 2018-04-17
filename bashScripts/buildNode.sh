#!/bin/sh

#sudo apt-get update
#sudo apt-get install build-essential libssl-dev
#curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o install_nvm.sh
#sudo bash install_nvm.sh
source ~/.profile

nvm install 8.9.4
nvm use 8.9.4

sudo apt-get install npm -y
