FROM golang:alpine as build

ADD cmd/zorua/main.go .

RUN CGO_ENABLED=0 go build \
                        -a \
                        -ldflags='-extldflags=-static -w -s' \
                        -tags netgo \
                        -o /zorua \
                        main.go

ENTRYPOINT ["/zorua"]
