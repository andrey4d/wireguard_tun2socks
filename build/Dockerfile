FROM golang:1.21-alpine as builder

RUN mkdir -p /opt/xray
WORKDIR /opt/xray

RUN go install github.com/xjasonlyu/tun2socks/v2@latest
RUN cp /go/bin/tun2socks /opt/xray 

FROM alpine:latest
LABEL org.opencontainers.image.source="https://github.com/xjasonlyu/tun2socks"
LABEL maintainer="andrey4d.dev@gmial.com"

RUN apk add --update --no-cache iptables iproute2 tzdata curl bind-tools

COPY --from=builder /opt/xray/tun2socks  /usr/bin/
COPY /rootfs /

ENV TZ=Asia/Shanghai

ENTRYPOINT [ "/entrypoint.sh" ]