#!/bin/bash

container_name = 'goals-frontend';
docker run --name $container_name --rm -it -v "$(pwd)":/app/src --network fullstack-network1 -p 3000:3000 goals-react:latest;