#!/bin/bash

read -p "Enter serviceName [e.g. utility]: " service_name;
read -p "Enter npm commands [e.g. init / install ]: " npm_command;
docker-compose run --rm $service_name $npm_command;