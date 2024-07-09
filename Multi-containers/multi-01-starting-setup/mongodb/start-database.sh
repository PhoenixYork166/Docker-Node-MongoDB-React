#!/bin/bash

docker run --name mongodb -v data:/data/db --rm -d --network fullstack-network1 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=rootPassword mongo:latest;