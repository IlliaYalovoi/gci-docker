#!/bin/bash -e

PLATFORMS="linux/amd64,linux/arm64"
EXTRA_BUILDX_ARGS=$@

docker buildx build \
    --platform "${PLATFORMS}" \
    --build-arg gci_version="$GCI_VERSION" \
    -t IlliaYalovoi/gci \
    "$EXTRA_BUILDX_ARGS" \
    .
