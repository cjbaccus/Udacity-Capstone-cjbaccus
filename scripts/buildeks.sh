#!/bin/bash

eksctl create cluster \
--name capstone-cjbaccus \
--region us-east-2 \
--with-oidc \
--ssh-access \
--ssh-public-key netbox \
--managed