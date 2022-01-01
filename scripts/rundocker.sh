#!/usr/bin/sh

. ./config.txt
## Complete the following steps to get Docker running locally
# docker login
# Step 1:
# Build image and add a descriptive tag
docker build . -t ${DOCKER_PATH}:${CURRENT} -f Dockerfile

# docker build . --tag ${DOCKER_PATH}:${CURRENT}

# Step 2: 
# List docker images
# docker login
docker image ls
