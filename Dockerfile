FROM alpine:edge

WORKDIR /app
VOLUME /app
COPY startup.sh /startup.sh

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing ssmtp getmail && rm -f /var/cache/apk/*

# el fichero de fetchmail es un volumen
VOLUME [ "/root/.getmail/","/etc/ssmtp/" ]

CMD ["/startup.sh"]