FROM alpine:latest

RUN apk --update --no-cache add curl unzip && \
    curl -SsL https://github.com/stackrox/kube-linter/releases/download/0.5.0/kube-linter-linux.tar.gz --output /tmp/kube-linter-linux.tar.gz && \
    tar -zxvf /tmp/kube-linter-linux.tar.gz -d /usr/bin/ && \
    chmod +x /usr/bin/kube-linter && \
    rm  /tmp/kube-linter-linux.tar.gz

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
