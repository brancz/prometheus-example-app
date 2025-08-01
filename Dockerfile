FROM golang:1.23-bookworm AS build

WORKDIR /go/src/app
RUN --mount=target=. make build

FROM quay.io/prometheus/busybox:latest

COPY --from=build /tmp/prometheus-example-app /bin/prometheus-example-app

ENTRYPOINT ["/bin/prometheus-example-app"]
