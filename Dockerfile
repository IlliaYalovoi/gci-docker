FROM golang:1.21 AS builder

ENV GCI_VERSION=$gci_version

RUN go install github.com/daixiang0/gci@${GCI_VERSION}

FROM alpine:3.19
LABEL maintainer="Illia Yalovoi"

COPY --from=builder /go/bin/gci /usr/local/bin/gci

WORKDIR /code

CMD ["gci"]