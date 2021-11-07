#!/bin/sh -e

OWNER="${OWNER:-jmp}"
IMAGE_NAME="${IMAGE_NAME:-python-pipeline-app}"
COMMIT_HASH="$(git rev-parse --verify HEAD)"

if [ -n "$CI" ]; then
  echo "$CR_PAT" | docker login ghcr.io -u "$OWNER" --password-stdin
fi

docker build -t "ghcr.io/$OWNER/$IMAGE_NAME:$COMMIT_HASH" .
docker push "ghcr.io/$OWNER/$IMAGE_NAME:$COMMIT_HASH"
