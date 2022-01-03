#!/bin/bash

eksctl create cluster \
--name crypto-2 \
--region us-east-1 \
--with-oidc \
--ssh-access \
--ssh-public-key netbox \
--managed