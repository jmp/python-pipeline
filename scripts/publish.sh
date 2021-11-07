#!/bin/sh -e

OWNER="${OWNER:-jmp}"
IMAGE_NAME="${IMAGE_NAME:-python-pipeline-app}"
COMMIT_HASH="$(git rev-parse --verify HEAD)"

docker build -t "ghcr.io/$OWNER/$IMAGE_NAME:$COMMIT_HASH" .
docker push "ghcr.io/$OWNER/$IMAGE_NAME:$COMMIT_HASH"
