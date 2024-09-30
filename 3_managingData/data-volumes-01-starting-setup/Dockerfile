FROM node:22

ARG TIME_ZONE=Asia/Shanghai
ENV TZ=$TIME_ZONE

ARG DEFAULT_PORT=8080

WORKDIR /app

# COPY host package.json to image /app
COPY package.json /app

RUN npm install

COPY . .

ENV PORT $DEFAULT_PORT

USER root

# See server.js app.listen(8080);
EXPOSE $PORT

# VOLUME = array[] of strings
# without specifying host directory => Docker decides for us
#VOLUME [ "/app/feedback" ]
#VOLUME [ "/app/temp" ]

CMD [ "npm", "start" ]
