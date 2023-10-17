#!/usr/bin/env bash

# Docker personal credentials and initialized version
DOCKER_HUB_ID="luthevy2001"
DOCKER_REPOSITORY="capstone_project"
VERSION="1.0"

# Create dockerpath
dockerpath=${DOCKER_HUB_ID}/${DOCKER_REPOSITORY}
echo "Docker ID with Image name: $dockerpath"

# Login to Docker hub
docker login -u ${DOCKER_HUB_ID} -p ${DOCKER_PASSWORD}

# Create a tag for the image and its version
docker tag ${DOCKER_REPOSITORY}:${VERSION} ${dockerpath}:${VERSION}

# Push Image to Docker hub
docker push ${dockerpath}:${VERSION}
