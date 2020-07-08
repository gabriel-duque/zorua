# We just use this as a builder image

FROM golang:alpine

COPY cmd/zorua/main.go .

RUN CGO_ENABLED=0 go build -a -ldflags='-w -s' -o /zorua main.go

# This will be the final image

FROM scratch

ARG BUILD_DATE

ARG VCS_REF

ARG VERSION

LABEL maintainer="Gabriel Duque <gabriel@zuh0.com> (zuh0)"

LABEL org.label-schema.build-date="$BUILD_DATE"

LABEL org.label-schema.name="zorua"

LABEL org.label-schema.description="A dynamic DNS client for Google Domains."

LABEL org.label-schema.usage="https://github.com/zuh0/zorua/blob/master/README.md"

LABEL org.label-schema.url="https://github.com/zuh0/zorua"

LABEL org.label-schema.vcs-url="https://github.com/zuh0/zorua"

LABEL org.label-schema.vcs-ref="$VCS_REF"

LABEL org.label-schema.version="$VERSION"

LABEL org.label-schema.schema-version="1.0"

LABEL org.label-schema.docker.cmd="docker run -v config.json:/etc/zorua/config.json:ro zuh0/zorua"

LABEL org.label-schema.docker.cmd.help="docker run zuh0/zorua --help"

COPY --from=0 /zorua /zorua

COPY --from=0 /etc/ssl/certs/ca-certificates.crt \
              /etc/ssl/certs/ca-certificates.crt

USER 1000:1000

VOLUME ["/etc/zorua"]

ENTRYPOINT ["/zorua"]
