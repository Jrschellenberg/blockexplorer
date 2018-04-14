FROM node:carbon
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --production
COPY . .
EXPOSE ${PORT}

# Run the command on container startup
CMD npm start