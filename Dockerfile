FROM alpine:latest

RUN apk --update --no-cache add curl unzip && \
    curl -SsL https://github.com/stackrox/kube-linter/releases/latest/download/kube-linter-linux.zip --output /tmp/kube-linter-linux.zip && \
    unzip /tmp/kube-linter-linux.zip -d /usr/bin/ && \
    chmod +x /usr/bin/kube-linter && \
    rm /tmp/kube-linter-linux.zip

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
