#!/bin/sh

. ./config.txt
kubectl create deployment crypto-${CURRENT} --image=docker.io/${DOCKER_PATH}:${CURRENT} --port=8080
kubectl expose deployment crypto-${CURRENT} --port=8080 --target-port=8080 --save-config
kubectl rollout status deployment/crypto-${CURRENT} # Health check