#!/usr/bin/sh

. ./config.txt
## Complete the following steps to get Docker running locally
# docker login
# Step 1:
# Build image and add a descriptive tag
docker build .

# docker build . --tag ${DOCKER_PATH}:${CURRENT}

# Step 2: 
# List docker images
# docker login
# docker image ls

# Step 3: 
# Run flask app
# docker run -p 80:80 mycryptoflask
# docker run -p 80:80 $DOCKER_USER/cjbaccus-capstone:latest
# docker image push cjbaccus/cjbaccus-capstone:latest
# docker push ${DOCKER_PATH}:${LAST}