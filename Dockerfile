FROM alpine:3.5
RUN apk add --no-cache --virtual .build-deps curl ca-certificates \
 && curl -L -o /frp.tar.gz --insecure https://github.com/fatedier/frp/releases/download/v0.29.1/frp_0.29.1_linux_amd64.tar.gz  \
 && tar -zxvf /frp.tar.gz frp_0.29.1_linux_amd64/frps \
 && mv frp_0.29.1_linux_amd64/frps /usr/bin/frps \
 && chmod +x /usr/bin/frps \
 && rm -rf /frp* frp*
CMD ["/usr/bin/frps", "--vhost_http_port=80"]
EXPOSE 80 7000
