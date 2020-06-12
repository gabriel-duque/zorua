FROM golang:alpine

ADD cmd/zorua/main.go .

RUN CGO_ENABLED=0 go build \
                        -a \
                        -ldflags='-w -s -extldflags=-static' \
                        -tags netgo \
                        -o /zorua \
                        main.go

RUN apk add --no-cache upx

RUN upx /zorua

FROM scratch

COPY --from=0 /zorua /zorua
COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENTRYPOINT ["/zorua"]
