#!/usr/bin/env bash

## Complete the following steps to get Docker running locally
docker login -u $DOCKER_USER -p $DOCKER_PASSWORD
# Step 1:
# Build image and add a descriptive tag
docker build --tag=cjbaccus-capstone .

# Step 2: 
# List docker images

docker image ls

# Step 3: 
# Run flask app
# docker run -p 80:80 mycryptoflask
docker run -p 80:80 $DOCKER_USER/cjbaccus-capstone