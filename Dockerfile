FROM ubuntu:16.04
WORKDIR /usr/src/app
# Replace shell with bash so we can source files

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list
# and install dependencies
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get -y autoclean

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 8.9.4

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

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
    && apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev  -y \   
    && add-apt-repository ppa:bitcoin/bitcoin -y \   
    && apt-get update \   
    && apt-get install libdb4.8-dev libdb4.8++-dev -y

# Begin build coin    
RUN apt-get install ufw

RUN fallocate -l 1500M /mnt/1500MB.swap \
    && dd if=/dev/zero of=/mnt/1500MB.swap bs=1024 count=1572864 \
    && mkswap /mnt/1500MB.swap \
    && swapon /mnt/1500MB.swap \
    && chmod 600 /mnt/1500MB.swap \
    && echo '/mnt/1500MB.swap  none  swap  sw 0  0' >> /etc/fstab

# Configure Ports
RUN ufw allow 22/tcp \
    && ufw limit 22/tcp \
    && ufw allow 5500/tcp \
    && ufw logging on \
    && ufw --force enable
  
# Install Coin  
RUN apt-get install libzmq3-dev libminiupnpc-dev -y \
    && wget https://github.com/shekeltechnologies/JewNew/releases/download/1.3.0.0/shekel-Ubuntu16.04-1.3.0.zip \
    && unzip shekel-Ubuntu16.04-1.3.0.zip \
    && rm shekel-Ubuntu16.04-1.3.0.zip \
    && chmod +x shekel-cli shekeld \
    && mv shekel-cli shekeld /usr/local/bin/ \
    && cd .. \
    && shekeld


COPY package*.json ./
COPY . .
RUN npm install --production
EXPOSE ${PORT}

# Run the command on container startup
CMD npm start
