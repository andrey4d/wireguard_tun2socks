FROM golang:1.21-alpine3.18 as builder

RUN mkdir -p /opt/xray
WORKDIR /opt/xray


RUN go install github.com/xjasonlyu/tun2socks/v2@latest
RUN cp /go/bin/tun2socks /opt/xray 

FROM alpine:3.18 

LABEL maintainer="andrey4d.dev@gmial.com"

RUN apk add --update --no-cache iptables iproute2 tzdata curl bind-tools

COPY --from=builder /opt/xray/tun2socks  /usr/bin/

COPY /rootfs /


ENV TZ=Asia/Shanghai

#CMD [ "/usr/bin/tune2socks" ]
ENTRYPOINT [ "/entrypoint.sh" ]