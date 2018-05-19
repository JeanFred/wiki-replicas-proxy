FROM alpine

RUN apk add --no-cache openssh-client bash

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]