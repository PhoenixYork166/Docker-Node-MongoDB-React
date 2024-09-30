#!/bin/bash

docker run --name goals-backend -v "$(pwd)":/app -v logs:/app/logs -v /app/node_modules --rm -d -p 3001:3001 --network fullstack-network1 goals-node:latest;