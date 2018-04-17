#!/bin/sh

sudo apt-get update

sudo apt-get install software-properties-common pwgen nano git unzip

sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils

sudo apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev

sudo add-apt-repository ppa:bitcoin/bitcoin

sudo apt-get update

sudo apt-get install libdb4.8-dev libdb4.8++-dev