FROM node:22

ARG TIME_ZONE=Asia/Shanghai

# Set environment variables for APT
ENV TZ=$TIME_ZONE
ENV LANG=C.UTF-8

WORKDIR /app

COPY package.json .

# Install NPM packages
RUN npm install

# Need to ping mongoDB container
RUN apt-get update && apt -y upgrade

# Install ping command
RUN apt-get install inetutils-ping -y

# Install vim
RUN apt-get install vim -y

# Install lsof
RUN apt-get install lsof -y

# Install netcat
RUN apt-get install netcat-openbsd -y

# Clear APT caches
RUN rm -rf /var/lib/apt/lists/*

COPY . .

ARG PORT=3000
EXPOSE $PORT

COPY mongodb.sh /app/mongodb.sh
RUN chmod +x /app/mongodb.sh

CMD [ "node", "app.js" ]

#CMD ["sh", "-c", "/app/mongodb.sh && npm start"]