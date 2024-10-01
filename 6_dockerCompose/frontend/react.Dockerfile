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
ARG DEFAULT_HOSTNAME=react-goals

# Use the hostname in some configuration file or script
RUN echo "Hostname of this Container: ${DEFAULT_HOSTNAME}" > /app/hostname_info.txt
RUN echo ${DEFAULT_HOSTNAME}

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
RUN apt-get install -y telnet 
RUN apt-get install -y netcat-traditional
RUN apt-get install -y coreutils
# busybox cat /app/hostname.txt
RUN apt-get install -y busybox

# Clean up APT when done
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/*

# Copy all remaining code from HOST to CONTAINER
COPY . .

ARG FRONTEND_PORT=3000

EXPOSE $FRONTEND_PORT

CMD [ "npm", "start" ]