FROM alpine
RUN apk add --update --no-cache make gcc g++
RUN wget -O- https://github.com/facebook/zstd/releases/download/v1.4.0/zstd-1.4.0.tar.gz | tar xz --strip 1 && \
make CFLAGS="-O3 -ffunction-sections -fdata-sections" LDFLAGS="-static -Wl,--gc-sections" -j4
