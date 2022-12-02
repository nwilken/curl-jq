FROM alpine:latest
LABEL maintainer="Nate Wilken <wilken@asu.edu>"

RUN set -x && \
    apk update && \
    apk add --no-cache bash curl jq && \
    wget $(curl -s https://api.github.com/repos/mikefarah/yq/releases/latest | jq -r '.assets[] | select(.name == "yq_linux_amd64") | .browser_download_url') -O /usr/bin/yq && \
    chmod +x /usr/bin/yq

CMD ["tail", "-F", "-n0", "/etc/hosts" ]
