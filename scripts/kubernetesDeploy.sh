#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="cjbaccus/udacity_capstone"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment myCryptoFlask --image=docker.io/${dockerpath}:latest --port=80
echo "sleeping for 60 seconds, while docker spins up..."
sleep 60

#kubectl run mlsmicrosvc\
#    --generator=run-pod/v1\
#    --image=$dockerpath\
#    --port=8080 --labels app=udacitymlsmicrosvc

# Step 3:
# List kubernetes pods
kubectl get pods


# Step 4:
# Forward the container port to a host
#kubectl port-forward mymicroservicebuild 8080:8080


POD_NAME=`kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'`
kubectl port-forward $POD_NAME 8000:80