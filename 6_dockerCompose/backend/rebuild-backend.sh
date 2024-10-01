#!/bin/bash

docker rmi goals-node:latest;
docker build -t goals-node:latest -f ./nodejs.Dockerfile .