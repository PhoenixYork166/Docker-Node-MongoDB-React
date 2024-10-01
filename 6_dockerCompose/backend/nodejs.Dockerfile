# Using latest Node version
FROM node:latest

ARG TIME_ZONE=Asia/Shanghai
# Set environment variables for APT
ENV TZ=$TIME_ZONE
ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=non-interactive

WORKDIR /app

COPY package.json .

# Set Container Linux env USER to ROOT
USER root

# Define build-time argument for hostname (optional)
ARG DEFAULT_HOSTNAME=node-goals

# Use the hostname in some configuration file or script
RUN echo "Hostname of this Container: ${DEFAULT_HOSTNAME}" > /app/hostname_info.txt
RUN echo ${DEFAULT_HOSTNAME}

# Install node app NPM modules
RUN npm install

# Updating Debian repository
RUN apt-get update && apt -y upgrade

# Install Tools
# To allow troubleshooting inter-containers communication
# e.g. goals-backend ping mongodb
# docker exec -it goals-backend ping -c 2 mongodb;

#RUN apt-get update && apt-cache search net-tools && \
RUN apt-get install -y inetutils-tools
RUN apt-get install -y iputils-ping
RUN apt-get install -y net-tools
RUN apt-get install -y telnet 
RUN apt-get install -y netcat-traditional
RUN apt-get install -y coreutils
# busybox cat /app/hostname.txt
RUN apt-get install -y busybox

# Clean up APT when done
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/*

# Should you need to install anything via
# docker exec -it containerName apt install -y toolName;
# Uncomment line below
# RUN apt-get update && apt -y upgrade

# Copy all remaining code from HOST to CONTAINER
COPY . .

ARG BACKEND_PORT=3001

EXPOSE $BACKEND_PORT

ENV MONGODB_USERNAME=root
ENV MONGODB_PASSWORD=rootPassword

CMD [ "npm", "start" ]