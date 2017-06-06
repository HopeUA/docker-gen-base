FROM hope/alpine:3.6

ENV \
    DOCKERGEN_VERSION=0.7.3 \
    DOCKER_HOST=unix:///tmp/docker.sock

RUN \
    apk add --no-cache --virtual=build-dependencies wget ca-certificates && \
    cd /tmp && \

    # Install
    wget https://github.com/jwilder/docker-gen/releases/download/${DOCKERGEN_VERSION}/docker-gen-alpine-linux-amd64-${DOCKERGEN_VERSION}.tar.gz && \
    tar -xzf docker-gen-alpine-linux-amd64-${DOCKERGEN_VERSION}.tar.gz && \
    mv docker-gen /usr/local/bin/ && \

    # Cleanup
    apk del build-dependencies && \
    rm -rf /tmp/*

ENTRYPOINT ["docker-gen"]
