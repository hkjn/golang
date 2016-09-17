FROM hkjn/alpine

MAINTAINER Henrik Jonsson <me@hkjn.me>

RUN apk add --no-cache go git ca-certificates && \
    adduser -D go -s /bin/sh && \
		chown -R go:go /usr/lib/go/
ENV GOPATH /home/go

USER go


