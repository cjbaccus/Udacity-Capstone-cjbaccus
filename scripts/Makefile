## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	# mkdir ~/.devops
	# python3 -m venv ~/.devops
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
	./hadolint DockerFile
	# pylint --disable=R,C,W1203 cryptotest.py

dockerflask:
	bash rundocker.sh

kubernetesdeploy:
	bash kubernetesDeploy.sh

all: setup install lint dockerflask kubernetesdeploy