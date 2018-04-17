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


#RUN apt-get update && apt-get install sudo -y && apt-get install curl -y

#RUN sudo apt-get update \
 #   && sudo apt-get install build-essential libssl-dev -y \
  #  && curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o install_nvm.sh \
 #   && sudo bash install_nvm.sh

#RUN /bin/bash -c source ~/.profile
#RUN nvm install 8.9.4 && nvm use 8.9.4

COPY package*.json ./
COPY . .
RUN npm install --production
EXPOSE ${PORT}

# Run the command on container startup
CMD npm start
