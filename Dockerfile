FROM hkjn/alpine

MAINTAINER Henrik Jonsson <me@hkjn.me>

RUN apk add --no-cache bash ca-certificates gcc git go musl-dev vim && \
    adduser -D go -s /bin/bash && \
		chown -R go:go /usr/lib/go/
ENV GOPATH /home/go
WORKDIR $GOPATH
CMD ["/bin/bash"]

USER go


