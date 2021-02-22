FROM alpine:3.7 as Download
ARG Version=6.9.0
RUN wget https://github.com/xmrig/xmrig/releases/download/v${Version}/xmrig-${Version}-linux-static-x64.tar.gz
RUN tar -xzvf xmrig-*.tar.gz && rm xmrig-*.tar.gz
RUN mv xmrig-* xmrig

FROM alpine:3.7
COPY --from=Download xmrig/ xmrig
WORKDIR /xmrig
ENTRYPOINT [ "./xmrig" ]
