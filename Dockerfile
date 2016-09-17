FROM hkjn/alpine

MAINTAINER Henrik Jonsson <me@hkjn.me>

RUN apk add --no-cache go git ca-certificates && \
    adduser -D go -s /bin/sh
ENV GOPATH /home/go

USER go


