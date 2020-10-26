FROM alpine:3.10.1
LABEL MAINTAINER "Jeroen Slot"

ENV OVPN_CONFIG_DIR="/app/ovpn/config" \
    PROTOCOL="tcp"\
    USERNAME="" \
    PASSWORD="" \
    LOCAL_NETWORK=192.168.1.0/24

COPY app /app
EXPOSE 8118

RUN \
    echo "####### Installing packages #######" && \
    apk --update --no-cache add \
      privoxy \
      openvpn \
      runit \
      bash \
      bind-tools \
      && \
    echo "####### Changing permissions #######" && \
      find /app -name run | xargs chmod u+x && \
      find /app -name *.sh | xargs chmod u+x \
      && \
    echo "####### Removing cache #######" && \
      rm -rf /var/cache/apk/*

CMD ["runsvdir", "/app"]