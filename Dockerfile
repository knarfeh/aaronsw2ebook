FROM golang:1.8.3 as builder
WORKDIR /go/src/github.com/knarfeh/aaronsw2book/
COPY . /go/src/github.com/knarfeh/aaronsw2book/
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o aaronsw2book .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /go/src/github.com/knarfeh/aaronsw2book/aaronsw2book /bin/
CMD ["aaronsw2book", "fetch"]