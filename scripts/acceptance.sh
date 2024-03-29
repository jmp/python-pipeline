#!/bin/sh

DEFAULT_ENVIRONMENT_URL="http://localhost:8080"
ENVIRONMENT_URL="${ENVIRONMENT_URL:-$DEFAULT_ENVIRONMENT_URL}"

if [ -n "$GITHUB_SHA" ]; then
  export IMAGE_TAG="$GITHUB_SHA"
fi

if [ "$ENVIRONMENT_URL" = "$DEFAULT_ENVIRONMENT_URL" ] && ! docker compose ps --filter 'status=running' --services | grep -q app; then
  echo "Starting containers..."
  if [ -n "$CI" ]; then
    docker compose -f docker-compose.yml up -d
  else
    docker compose up -d
  fi
  _stop_container=1
fi

echo "Running acceptance tests against $ENVIRONMENT_URL..."
poetry run pytest -m acceptance
_status=$?

if [ -n "$_stop_container" ] || test $_status -ne 0; then
  echo "Stopping containers..."
  if [ -n "$CI" ]; then
    docker compose -f docker-compose.yml down
  else
    docker compose down
  fi
fi

exit $_status
