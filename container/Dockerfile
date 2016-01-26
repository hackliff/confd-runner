FROM alpine:3.3
MAINTAINER Xavier Bruhiere

ENV CONFD_VERSION 0.11.0

RUN apk update && \
  apk add openssl
RUN wget \
  -O /usr/local/bin/confd \
  https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-${CONFD_VERSION}-linux-amd64 && \
  chmod +x /usr/local/bin/confd
RUN mkdir -p /etc/confd/{conf.d,templates}

ENTRYPOINT ["confd"]
# meant to be overwriten
CMD ["--help"]
