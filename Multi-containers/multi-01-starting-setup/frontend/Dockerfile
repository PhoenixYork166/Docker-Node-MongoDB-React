# No specific Images of React
# Yet React also uses Node
# Use latest Node image
FROM node

# Preparing Docker Linux env
# in case we need to troubleshoot networking issues
ARG TIME_ZONE=Asia/Shanghai
# Set environment variables for APT
ENV TZ=$TIME_ZONE
ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=non-interactive

WORKDIR /app

COPY package*.json .

# Set Container Linux env USER to ROOT
USER root

RUN npm install

# Updating Debian repository
RUN apt-get update && apt -y upgrade

# Install Tools
# To allow troubleshooting inter-containers communication
# e.g. goals-frontend ping goals-backend
# docker exec -it goals-frontend ping -c 2 goals-backend;

#RUN apt-get update && apt-cache search net-tools && \
RUN apt-get install -y inetutils-tools
RUN apt-get install -y iputils-ping
RUN apt-get install -y net-tools

# Clean up APT when done
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/*

# Copy all remaining code from HOST to CONTAINER
COPY . .

ARG FRONTEND_PORT=3000

EXPOSE $FRONTEND_PORT

CMD [ "npm", "start" ]