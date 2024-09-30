#!/bin/bash

docker rmi goals-react:latest;
docker build -t goals-react:latest -f ./Dockerfile .