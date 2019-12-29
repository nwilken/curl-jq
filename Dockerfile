FROM alpine:latest
LABEL maintainer="Nate Wilken <wilken@asu.edu>"

RUN set -x && \
    apk update && \
    apk add --no-cache bash curl jq

CMD ["tail", "-F", "-n0", "/etc/hosts" ]
