FROM ubuntu:16.04
WORKDIR /usr/src/app
COPY package*.json ./
RUN /scripts/buildDependencies.sh
RUN npm install --production
COPY . .
EXPOSE ${PORT}

# Run the command on container startup
CMD npm start
