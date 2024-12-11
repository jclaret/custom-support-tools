#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
IMAGE_NAME="custom-support-tools"
QUAY_USERNAME="jclaret"
QUAY_REPO="quay.io/$QUAY_USERNAME/$IMAGE_NAME"
TAG="latest"

# Build the image
echo "Building the image '$IMAGE_NAME'..."
podman build -t $IMAGE_NAME .

# Tag the image
echo "Tagging the image as '$QUAY_REPO:$TAG'..."
podman tag $IMAGE_NAME $QUAY_REPO:$TAG

# Push the image
echo "Pushing the image to '$QUAY_REPO:$TAG'..."
podman push $QUAY_REPO:$TAG

# Success message
echo "Image '$QUAY_REPO:$TAG' has been successfully built and pushed to Quay.io!"

