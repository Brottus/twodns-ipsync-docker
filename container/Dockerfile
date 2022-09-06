FROM alpine:3.16

LABEL author="https://github.com/Brottus/twodns-ipsync-docker" version="1.0"

ENV username= api_key= domains=all ip_address=auto ttl=300 activate_wildcard=false sleeptimer=21600

RUN apk add --no-cache bash curl moreutils

RUN addgroup -S ipsync && adduser -S ipsync -G ipsync

COPY --chown=ipsync:ipsync ipsync.sh /app/

WORKDIR /app

RUN chmod 755 ipsync.sh

#RUN chown -R ipsync:ipsync /app

USER ipsync

CMD ["./ipsync.sh"]

HEALTHCHECK --interval=3s --timeout=3s \
  CMD if pidof -s "ipsync.sh" >/dev/null; then echo "0"; else echo "1"; fi
