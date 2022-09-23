FROM alpine as builder

ARG VERSION
ENV VERSION=${VERSION}

RUN apk add --no-cache wget unzip &&\
    wget https://spacedock.info/content/godarklight_151/DarkMultiPlayer_Server/DarkMultiPlayer_Server-${VERSION}.zip && unzip DarkMultiPlayer_Server-${VERSION}.zip

FROM mono

COPY --from=builder ./DMPServer /opt/DMPServer

ENTRYPOINT [ "mono", "/opt/DMPServer/DMPServer.exe" ]