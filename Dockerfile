FROM kalilinux/kali-rolling

# Set environment variables for APT
ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=interactive
ENV TZ=Asia/Shanghai

# Set the working directory to container's /tools
WORKDIR /tools

# Metadata params
ARG BUILD_DATE
ARG VERSION
ARG PROJECT_URL
ARG VCS_REF
ARG TARBALL
ARG RELEASE_DESCRIPTION

# https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.source="$PROJECT_URL" \
      org.opencontainers.image.revision="$VCS_REF" \
      org.opencontainers.image.vendor="OffSec" \
      org.opencontainers.image.version="$VERSION" \
      org.opencontainers.image.title="Kali Linux ($RELEASE_DESCRIPTION branch)" \
      org.opencontainers.image.description="Official Kali Linux container image for $RELEASE_DESCRIPTION" \
      org.opencontainers.image.url="https://www.kali.org/" \
      org.opencontainers.image.authors="Kali Developers <devel@kali.org>"

# Copy archive-key.asc file from this host to container /etc/apt/trusted.gpg.d/
COPY archive-key.asc /etc/apt/trusted.gpg.d/

# Copy host directory files into container /tools
COPY . /tools/

# Ensure the commands runs as root
USER root

# Switch to the correct Kali repository
RUN echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list

# update && upgrade
RUN apt-get update && apt -y upgrade

# Update Kali Repository
#RUN apt-get update --fix-missing

# Install Tools
#RUN apt-get update && apt-cache search net-tools && \
RUN apt-get install -y inetutils-tools
RUN apt-get install -y net-tools
RUN apt-get install -y tcpdump
RUN apt-get install -y nmap
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y lsof
RUN apt-get install -y adduser
RUN apt-get install -y arping
RUN apt-get install -y hydra
RUN apt-get install -y sudo
RUN apt-get install -y git
RUN apt-get install -y tcpdump
RUN apt-get install -y vim
RUN apt-get install -y tmux
RUN apt-get install -y hping3
RUN apt-get install -y apktool
RUN apt-get install -y unzip
RUN apt-get install -y ettercap-graphical
RUN apt-get install -y make
RUN apt-get install -y snapd
RUN apt-get install -y tee
RUN apt-get install -y cassandra
RUN apt-get install -y postgresql

# Clean up APT when done
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/*

EXPOSE 8080

#CMD ["bash"]