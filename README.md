# Description

This repo contains a Dockerfile used to build a docker image with a [fork of gcc/g++ 4.3.6](https://gitlab.com/dfffffff/gcc6809) used to cross-compile C/C++ to the Motorola 6809 architecture. This can be used for developing, for example, Vectrex games.

# Docker Hub

The latest image can be downloaded from Docker Hub here:
https://hub.docker.com/r/amaiorano/gcc6809

```bash
docker pull amaiorano/gcc6809
```

# Building

```bash
docker build -t amaiorano/gcc6809 .
```

# Usage

The installed toolchain is placed under ```/usr/local/```. For instance, the g++ cross-compiler can be found at ```/usr/local/bin/m6809-unknown-none-g++```.

The simplest way to use this image is to mount a local folder that contains a Makefile that invokes the cross-compiler directly, then run make on it. For e.g.:

```bash
cd myproject

docker run -v $(pwd):/root/myproject -t -i amaiorano/gcc6809 make -C myproject
```

See my [vectrex-pong game](https://github.com/amaiorano/vectrex-pong) for a project that builds with a Makefile in this docker container.
