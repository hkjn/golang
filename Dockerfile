FROM hkjn/alpine

MAINTAINER Henrik Jonsson <me@hkjn.me>

RUN apk add --no-cache bash go git gcc ca-certificates && \
    adduser -D go -s /bin/bash && \
		chown -R go:go /usr/lib/go/
ENV GOPATH /home/go

USER go


