FROM golang:1.26 AS build

WORKDIR /go/src/app
COPY . .
RUN make build

FROM quay.io/prometheus/busybox:latest

COPY --from=build /go/src/app/prometheus-example-app /bin/prometheus-example-app

ENTRYPOINT ["/bin/prometheus-example-app"]
