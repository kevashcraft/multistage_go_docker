FROM golang:1.7.3 as Builder
WORKDIR /go/src/multistage_go_docker
COPY multistage_go_docker.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest
WORKDIR /app
COPY --from=Builder /go/src/multistage_go_docker/app .
CMD ["./app"]

