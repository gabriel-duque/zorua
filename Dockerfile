# We just use this as a builder image

FROM golang:alpine

COPY cmd/zorua/main.go .

RUN CGO_ENABLED=0 go build -a -ldflags='-w -s' -o /zorua main.go

# This will be the final image

FROM scratch

LABEL maintainer="gabriel@zuh0.com"

COPY --from=0 /zorua /zorua

COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

USER 1000:1000

VOLUME ["/etc/zorua"]

ENTRYPOINT ["/zorua"]
