FROM alpine AS build
RUN apk update && apk upgrade && apk add gcc g++ make wget perl pcre-dev openssl-dev zlib-dev
RUN OPENRESTY_VERSION=openresty-1.13.6.2 && wget https://openresty.org/download/${OPENRESTY_VERSION}.tar.gz && tar xzf ${OPENRESTY_VERSION}.tar.gz && cd ${OPENRESTY_VERSION} && \
./configure --with-pcre --with-pcre-jit --with-http_v2_module --with-http_slice_module --with-stream_ssl_preread_module -j2 --with-ld-opt="-static" && make -j2 && make install && strip -s /usr/local/openresty/nginx/sbin/nginx


FROM alpine
LABEL maintainer="suconghou@gmail.com"
COPY --from=build /usr/local/openresty/nginx/sbin/nginx /usr/local/sbin/nginx
COPY --from=build /usr/local/openresty/nginx/conf/nginx.conf usr/local/openresty/nginx/conf/fastcgi.conf /usr/local/openresty/nginx/conf/mime.types /usr/local/openresty/nginx/conf/scgi_params /usr/local/openresty/nginx/conf/
COPY --from=build /usr/local/openresty/nginx/logs/ /usr/local/openresty/nginx/logs/
RUN ln -sf /dev/stdout /usr/local/openresty/nginx/logs/access.log && \
ln -sf /dev/stderr /usr/local/openresty/nginx/logs/error.log
