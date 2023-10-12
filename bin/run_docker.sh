#!/usr/bin/env bash

# Build image to push it to docker hub
CONTAINER_NAME="de150191/capstone_project"
VERSION=1.0
CONTAINER_PORT=80
HOST_PORT=80

# Run container locally and test it before pushing to docker hub 
docker run -t --rm -p ${HOST_PORT}:${CONTAINER_PORT} ${CONTAINER_NAME}:${VERSION}
