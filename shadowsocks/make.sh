#!/bin/bash
docker build -t=suconghou/shadowsocks:libev -t=suconghou/shadowsocks:3.1.1 . -f Dockerfile-libev && \
docker build -t=suconghou/shadowsocks:server . -f Dockerfile-server && \
docker build -t=suconghou/shadowsocks:local . -f Dockerfile-local
