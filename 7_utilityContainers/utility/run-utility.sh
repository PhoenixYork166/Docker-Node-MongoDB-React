#!/bin/bash

#container_name='node-util';
read -p "Enter docker containerName [e.g. node-util]: " container_name
read -p "Enter entrypoint npm command [e.g. install]: " npm_command
docker run -it -v $(pwd):/app $container_name $npm_command;