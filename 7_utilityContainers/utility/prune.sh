#!/bin/bash

# Stopping all running docker containers
docker stop $(docker ps -q)
echo "Currently running containers: ";
docker ps -a;

# Force stop all docker containers
docker kill $(docker ps -q)
echo "Currently running containers: ";
docker ps -a;

# Pruning all existing docker image to avoid conflicts
docker image prune -a;
echo "Current docker images: ";
docker image ls;

# Pruning all abandoned docker containers to avoid conflicts
docker container prune;
echo "Currently running containers: ";
docker ps -a;

# Remove all docker volumes spawn by docker-compose
docker-compose down -v;

# Force remove all docker volumes
docker volume rm $(docker volume ls -q);
echo "Current docker volumes: ";
docker volume ls;