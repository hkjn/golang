golang
=======

Repo golang holds the `hkjn/golang` Docker images.

## Image manifests

The image manifests which allows the Docker registry 2.2+ to support multiple
CPU architectures for `hkjn/golang` currently needs to be built and pushed
using the standalone [`manifest-tool`](https://github.com/estesp/manifest-tool):

```
$ manifest-tool push from-args --platforms linux/amd64,linux/arm --template hkjn/golang:ARCH-{1.8.3,1.9} --target hkjn/golang
```
