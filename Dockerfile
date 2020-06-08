FROM ubuntu:devel

RUN apt-get update \
    && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
