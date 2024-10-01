#!/bin/bash

# $(pwd) = projectFolder/backend
docker build -t goals-node:latest -f ./nodejs.Dockerfile .