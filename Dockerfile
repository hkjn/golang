# TODO(hkjn): Start from alpine, if they have an ARM image.
FROM hkjn/armv7l-arch

MAINTAINER Henrik Jonsson <me@hkjn.me>

RUN pacman -Syyu && \
    pacman -S --noconfirm go git

ENV GOPATH /home/go

RUN useradd -m go && \
    chmod -R 755 /usr/local/src
USER go


