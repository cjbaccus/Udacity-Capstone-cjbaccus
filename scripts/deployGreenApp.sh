#!/bin/sh

. ./config.txt
kubectl create deployment crypto-${CURRENT} --image=docker.io/${DOCKER_PATH}:${CURRENT} --port=8080
kubectl rollout status deployment/crypto-${CURRENT} # Health check