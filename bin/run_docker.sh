#!/usr/bin/env bash

# Docker personal credentials
CONTAINER_NAME="luthevy2001/capstone-project"
VERSION=1.0

# Open to port 80
CONTAINER_PORT=80
HOST_PORT=80

# Run and push container to Docker hub
docker run -t --rm -p ${HOST_PORT}:${CONTAINER_PORT} ${CONTAINER_NAME}:${VERSION}
