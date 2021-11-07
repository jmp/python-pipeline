#!/bin/sh -e

poetry run black --check .
poetry run isort --check .
poetry run flake8 .
