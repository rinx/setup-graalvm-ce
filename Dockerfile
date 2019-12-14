FROM alpine

RUN apk update \
    && apk upgrade \
    && apk --update-cache add --no-cache \
    ca-certificates \
    curl \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
