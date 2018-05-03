FROM ubuntu:16.04
ARG WORKING_PATH
ARG DAEMON_NAME
ARG CONF_FILE_NAME
ARG WALLET_USER
ARG WALLET_PASSWORD
ARG WALLET_PORT
ARG WALLET_NODE_1
ARG WALLET_NODE_2

WORKDIR $WORKING_PATH
# Replace shell with bash so we can source files

#RUN echo $WORKING_PATH

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list
# and install dependencies
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get -y autoclean

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4.2.6

# install nvm
# https://github.com/creationix/nvm#install-script
RUN apt-get update && apt-get install nodejs-legacy -y \
    && apt-get install npm -y

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v

# Begin coin dependencies installation..
RUN apt-get update \
    && apt-get install software-properties-common pwgen nano git unzip -y \
    && apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils -y \   
    && apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev -y \   
    && add-apt-repository ppa:bitcoin/bitcoin -y \   
    && apt-get update \   
    && apt-get install libdb4.8-dev libdb4.8++-dev -y

# Begin build coin    
RUN apt-get install ufw -y && apt-get install sudo -y && apt-get install wget -y

# Configure Ports
  
# Install Coin  
RUN apt-get install libzmq3-dev libminiupnpc-dev -y \
    && wget https://github.com/shekeltechnologies/JewNew/releases/download/1.3.0.0/shekel-Ubuntu16.04-1.3.0.zip \
    && unzip shekel-Ubuntu16.04-1.3.0.zip \
    && rm shekel-Ubuntu16.04-1.3.0.zip \
    && chmod +x shekel-cli shekeld \
    && mv shekel-cli shekeld /usr/local/bin/

# Create .conf file
RUN USERNAME=$(pwgen -s 16 1) \
    && PASSWORD=$(pwgen -s 64 1) \
    && mkdir ~/tmpp \
    && touch ~/tmpp/${CONF_FILE_NAME} \
    && echo "server=1" >> ~/tmpp/${CONF_FILE_NAME} \
    && echo "rpcuser=${WALLET_USER}" >> ~/tmpp/${CONF_FILE_NAME} \
    && echo "rpcpassword=${WALLET_PASSWORD}" >> ~/tmpp/${CONF_FILE_NAME} \
    && echo "rpcallowip=127.0.0.1" >> ~/tmpp/${CONF_FILE_NAME} \
    && echo "rpcport=${WALLET_PORT}" >> ~/tmpp/${CONF_FILE_NAME} \
    && echo "addressindex=1" >> ~/tmpp/${CONF_FILE_NAME} \
    && echo "spentindex=1" >> ~/tmpp/${CONF_FILE_NAME} \
    && echo "txindex=1" >> ~/tmpp/${CONF_FILE_NAME} \
    && echo "addnode=${WALLET_NODE_1}" >> ~/tmpp/${CONF_FILE_NAME} \
    && echo "addnode=${WALLET_NODE_2}" >> ~/tmpp/${CONF_FILE_NAME}


# Extra packages required for kerboeroes
RUN apt-get update && apt-get install python2.7 -y \
    && apt-get install libkrb5-dev -y


COPY package*.json ./
COPY bash/buildSettings.sh /buildSettings.sh
COPY . .

RUN npm install forever -g
RUN npm install --production

RUN chmod +x /buildSettings.sh


EXPOSE ${PORT}

# Run the command on container startup
CMD /buildSettings.sh && mv ~/tmpp/${CONF_FILE_NAME} ~/.${DAEMON_NAME}/ && ${DAEMON_NAME}d -daemon -reindex -txindex \
    && sleep infinity
