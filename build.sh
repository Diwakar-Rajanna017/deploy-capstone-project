#!/bin/bash

TAG=${1:-"latest"}

if [ -z "$1" ]; then
    echo "No version number provided. Using 'latest' as the default tag."
fi

IMAGE_NAME="my-capstone-app"

echo "Building Docker image ${IMAGE_NAME}:${TAG}"

docker build -t "${IMAGE_NAME}:${TAG}" /home/ec2-user/reactjs-demo

if [ "$?" -eq 0 ]; then
    echo "Docker image ${IMAGE_NAME}:${TAG} built successfully."
else
    echo "Error: Docker image build failed."
    exit 1
fi

echo "List of Docker images:"
docker images

