#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub
. ./config.txt
# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=${DOCKER_PATH}:${CURRENT}

# Step 2
# # Run the Docker Hub container with kubernetes
# kubectl create deployment cjbaccus/capstone --image=docker.io/${dockerpath} --port=8080
# echo "sleeping for 60 seconds, while docker spins up..."
# sleep 60

# #kubectl run mlsmicrosvc\
# #    --generator=run-pod/v1\
# #    --image=$dockerpath\
# #    --port=8080 --labels app=udacitymlsmicrosvc

# # Step 3:
# # List kubernetes pods
# kubectl get pods


# # Step 4:
# # Forward the container port to a host
# kubectl port-forward cjbaccus/capstone 8080:8080


# POD_NAME=`kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'`
# kubectl port-forward $POD_NAME 8080:8080
#!/bin/sh

# . ./config.txt
kubectl create deployment crypto-${CURRENT} --image=docker.io/${DOCKER_PATH}:${CURRENT} --replicas=2 --port=80
kubectl expose deployment crypto-${CURRENT} --type=LoadBalancer --port=80 --target-port=8080 --save-config
kubectl rollout status deployment/crypto-${CURRENT} # Health check