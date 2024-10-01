#!/bin/bash

# $(pwd) = projectFolder/backend
docker build -t goals-react:latest -f ./react.Dockerfile .