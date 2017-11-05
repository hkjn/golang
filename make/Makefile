USERNAME=hkjn
NAME=$(shell basename $(PWD))
IMAGE=$(USERNAME)/$(NAME)
DOCKER_ARCH=$(shell bash $(PWD)/get_docker_arch)
VERSION=undefined
SHELL=/bin/bash

.PHONY: pre-build docker-build post-build build	push do-push post-push
.DEFAULT_GOAL := all
all: build push
build: pre-build docker-build post-build

pre-build:

post-build:
	@echo "Squashing image $(IMAGE):$(VERSION)-$(DOCKER_ARCH).."
	docker run --rm \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   hkjn/docker-squash \
		     -t $(IMAGE):$(VERSION)-$(DOCKER_ARCH) \
		        $(IMAGE):$(VERSION)-$(DOCKER_ARCH)

post-push:
	@echo "Pushing multi-arch image manifests.."
	docker run -v $(HOME)/.docker:/root/.docker:ro --rm \
	       hkjn/manifest-tool \
		   push from-args --platforms linux/amd64,linux/arm \
	                          --template $(IMAGE):ARCH \
				  --target $(IMAGE)

docker-build:
	@echo "Building image $(IMAGE):$(VERSION)-$(DOCKER_ARCH).."
	docker build -t $(IMAGE):$(VERSION)-$(DOCKER_ARCH) .

push: do-push post-push

do-push:
	@echo "Pushing image.."
	docker push $(IMAGE):$(VERSION)
