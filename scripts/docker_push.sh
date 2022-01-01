#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub
. ./config.txt

# Assumes that an image is built via `run_docker.sh`
docker login
# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=${DOCKER_PATH}:${CURRENT}

# Step 2:  
# Authenticate & tag
# echo "Docker ID and Image: $dockerpath"
# docker login &&\
#     docker image tag mycryptoflask $dockerpath

# Step 3:
# Push image to a docker repository
docker image push $dockerpath