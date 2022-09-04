FROM alpine:3.16

LABEL author="https://github.com/Brottus/twodns-ipsync-docker/tree/main" version="1.0"

ENV username= api_key= domains=all ip_address=auto ttl=300 activate_wildcard=false

RUN apk add --no-cache bash curl moreutils

RUN addgroup -S ipsync && adduser -S ipsync -G ipsync

COPY --chown=ipsync:ipsync ./ipsync.sh in /app

WORKDIR /app

#RUN chown -R ipsync:ipsync /app

USER ipsync

CMD ["ipsync.sh"]

HEALTHCHECK --interval=60m --timeout=3s \
  CMD if pidof -x "ipsync.sh" >/dev/null; then exit 0 else exit 1 fi
