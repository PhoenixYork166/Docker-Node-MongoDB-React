# FROM node:version
FROM node:22

WORKDIR /app

# copy package.json before npm install
COPY package.json /app

RUN npm install

COPY . /app

# Adding a comment to test Docker caching
EXPOSE 8080

CMD ["node", "server.js"]