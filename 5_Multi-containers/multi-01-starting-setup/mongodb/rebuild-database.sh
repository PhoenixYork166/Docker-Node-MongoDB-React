#!/bin/bash

docker rmi mongo:latest;
docker build -t mongo:latest -f ./Dockerfile .