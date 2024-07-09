#!/bin/bash

# Remove node_modules
rm -rf ./node_modules;

# Remove package-lock.json
rm -rf ./package-lock.json;

# Reinstalling @pmmmwh/react-refresh-webpack-plugin
#npm uninstall @pmmmwh/react-refresh-webpack-plugin && npm install @pmmmwh/react-refresh-webpack-plugin;

# Reinstall all npm packages
npm install;

docker rmi goals-react:latest;
docker build -t goals-react:latest -f ./Dockerfile .