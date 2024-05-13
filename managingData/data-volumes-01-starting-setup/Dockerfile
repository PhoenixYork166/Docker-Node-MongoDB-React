FROM node:14

WORKDIR /app

# COPY host package.json to image /app
COPY package.json /app

RUN npm install

COPY . .

# See server.js app.listen(3002);
EXPOSE 3002

CMD ["node", "server.js"]
