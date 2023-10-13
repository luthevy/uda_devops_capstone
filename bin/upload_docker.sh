#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`
DOCKER_HUB_ID="luthevy2001"
DOCKER_REPOSITORY="capstone_project"
VERSION="1.0"

# Step 1:
# Create dockerpath
# With pattern <hub-user>/<repo-name>
dockerpath=${DOCKER_HUB_ID}/${DOCKER_REPOSITORY}

# Step 2:
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
# Login to docker hub
docker login -u ${DOCKER_HUB_ID} -p ${DOCKER_PASSWORD}
# Tag image with dockerpath and version
docker tag ${DOCKER_REPOSITORY}:${VERSION} ${dockerpath}:${VERSION}

# Step 3:
# Push image to a docker repository with dockerpath and version
docker push ${dockerpath}:${VERSION}
