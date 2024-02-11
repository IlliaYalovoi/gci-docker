#!/bin/bash -e

BASE_IMAGE="IlliaYalovoi/gci"
IMAGE_VERSION="$1"

if [ -z "$IMAGE_VERSION" ]; then
  echo "No IMAGE_VERSION var specified"
  exit 1
fi

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
TARGET="$BASE_IMAGE:$IMAGE_VERSION"
bash ./docker_buildx.sh \
    -t "$TARGET" \
    --push