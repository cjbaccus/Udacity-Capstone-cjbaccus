#!/bin/bash

echo "[default]\ 
aws_access_key_id=$AWS_ACCESS_KEY_ID\
aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" > ~/.aws/credentials

eksctl create cluster \
--name crypto-2 \
--region us-east-1 \
--with-oidc \
--ssh-access \
--ssh-public-key netbox \
--managed