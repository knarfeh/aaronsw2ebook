FROM golang:1.8.3 as builder
WORKDIR /go/src/github.com/ee-book/aaronsweebook/
COPY . /go/src/github.com/ee-book/aaronsweebook/
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o aaronsweebook .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /go/src/github.com/ee-book/aaronsweebook/aaronsweebook /bin/
CMD ["aaronsweebook", "fetch"]