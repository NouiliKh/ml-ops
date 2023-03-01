FROM python:3.10-slim as base
WORKDIR /app

FROM base as builder
ENV COMPOSER_VERSION 2.2.4
# both files are explicitly required!
COPY Pipfile Pipfile.lock /app/
RUN pip install pipenv && \
  apt-get update && \
  apt-get install -y --no-install-recommends gcc python3-dev libssl-dev && \
  pipenv install --deploy --system && \
  apt-get install -y git make && \
  apt-get clean -y && rm -rf /var/lib/apt/lists/* && \
  pip install --upgrade --no-cache-dir pip && \
  apt-get remove -y gcc python3-dev libssl-dev && \
  apt-get autoremove -y && \
  pip uninstall pipenv -y
ENTRYPOINT []

ENV PYTHONPATH /app


COPY src /app/src
COPY main.py /app/main.py

CMD ["python3", "main.py"]
