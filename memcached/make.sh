#!/bin/bash
docker build -t=suconghou/memcached -t=suconghou/memcached:1.5.13 -t=suconghou/memcached:alpine . && \
docker build -t=suconghou/memcached:busybox . -f Dockerfile-busybox
