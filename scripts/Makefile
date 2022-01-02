## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	mkdir ~/.devops
	python3 -m venv ~/.devops
	# source ~/.devops/bin/activate
	pip install pylint
	
install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install --no-cache-dir -r requirements.txt
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
		chmod +x ./hadolint

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	./hadolint Dockerfile
	# pylint --disable=R,C,W1203 app.py


dockerflask:
	./rundocker.sh

dockerpush:
	./docker_push.sh

kubernetesdeploy:
	bash kubernetesDeploy.sh

aws-iam:
	# Install aws-iam-authenticator
	curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
	chmod +x ./aws-iam-authenticator
	mv ./aws-iam-authenticator /usr/local/bin

eksctlinstall:
	eksctl version


kubectlinstall:
	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

eks_initial:
	ls -la
	#sh buildeks.sh	

k8_config:
	sh k8s_config.sh

all: setup install lint dockerflask kubernetesdeploy