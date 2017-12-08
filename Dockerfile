FROM quay.io/prometheus/busybox:latest

ADD prometheus-example-app /bin/prometheus-example-app

ENTRYPOINT ["/bin/prometheus-example-app"]
