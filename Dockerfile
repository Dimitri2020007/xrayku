FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget curl && \
    wget -qO- https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip | busybox unzip - && \
    wget -qO- https://raw.githubusercontent.com/Dimitri2020007/xrayku/master/cert.crt /etc/caddy/cert.crt - && \
    wget -qO- https://raw.githubusercontent.com/Dimitri2020007/xrayku/master/cert.key /etc/caddy/cert.key - && \
    chmod +x /xray && \
    rm -rf /var/cache/apk/*

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
