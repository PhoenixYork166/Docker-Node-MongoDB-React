#!/bin/bash

container_name='node-util';
read -p "Enter npm command [e.g. npm install]: " npm_command
docker run -it -v $(pwd):/app $container_name $npm_command;