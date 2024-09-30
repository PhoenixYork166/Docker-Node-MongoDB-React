#!/bin/bash

docker run --name goals-frontend --rm -it -v "$(pwd)":/app/src --network fullstack-network1 -p 3000:3000 goals-react:latest;