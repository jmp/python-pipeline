FROM python:3.10-slim as build
RUN pip install poetry
COPY ../pyproject.toml poetry.lock ./
RUN poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi

FROM python:3.10-slim
ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1
COPY --from=build /usr/local/lib/python3.10/site-packages/ /usr/local/lib/python3.10/site-packages/
COPY --from=build /usr/local/bin/ /usr/local/bin/
COPY app app
CMD ["uvicorn", "app.app:app", "--host", "0.0.0.0", "--port", "8080"]
