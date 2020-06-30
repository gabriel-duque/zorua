# zorua [![GitHub license](https://img.shields.io/github/license/zuh0/zorua.svg)](https://github.com/zuh0/zorua/blob/master/LICENSE.md) [![Docker image size](https://img.shields.io/docker/image-size/zuh0/zorua/latest)](https://hub.docker.com/r/zuh0/zorua) [![Docker pulls](https://img.shields.io/docker/pulls/zuh0/zorua)](https://hub.docker.com/r/zuh0/zorua/)

a simple Go client to update dynamic DNS synthetic records for Google Domains

## Building

In order to build `zorua` you can just:

```
    $ cd cmd/zorua 
    $ go build
```

This will produce an executable file called `zorua` which you can run directly.

## Docker

In order to ease the installation of `zorua` in cloud native environments, you
can use the provided Docker image.

```
    $ docker run -v /path/to/zorua-config.json:/etc/zorua/config.json:ro zuh0/zorua
```
