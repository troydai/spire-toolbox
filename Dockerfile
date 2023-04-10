FROM --platform=$BUILDPLATFORM ghcr.io/spiffe/spire-agent:1.6.1 AS spire-agent

FROM --platform=$BUILDPLATFORM alpine:3.17

RUN mkdir -p /opt/spire/bin
COPY --from=spire-agent /opt/spire/bin/spire-agent /opt/spire/bin

CMD ["tail", "-f", "/dev/null"]
