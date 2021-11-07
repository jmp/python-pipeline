#!/bin/sh -e

if [ -n "$COVERAGE" ]; then
  poetry run pytest --cov=. --cov-report=xml
else
  poetry run pytest
fi
