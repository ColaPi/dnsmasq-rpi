FROM hypriot/rpi-alpine:3.5

MAINTAINER cola <colachg@gmail.com>

RUN set -e &&\
    apk add --update --no-cache dnsmasq &&\
    rm -rf /var/cache/apk/* &&\
    mkdir /etc/dnsmasq.d/dnsmasq

WORKDIR /etc/dnsmasq.d/

ADD dnsmasq.conf .

EXPOSE 53/udp

ENTRYPOINT ["/usr/sbin/dnsmasq"]

CMD ["-C", "dnsmasq.conf"]