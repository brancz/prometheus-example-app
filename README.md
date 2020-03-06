# Prometheus Example App

This example app serves as an example of how one can easily instrument HTTP handlers with [Prometheus][prometheus] metrics. It uses the Prometheus [go client][client-golang] to create a new Prometheus registry.

Usage is simple, on any request to `/` the request will result in a `200` response code. This increments the counter for this response code. Similarly the `/err` endpoint will result in a `404` response code, therefore increments that respective counter. Duration metrics are also exposed for any request to `/`.

A Docker image is available at: `quay.io/brancz/prometheus-example-app:v0.2.0`

[prometheus]:https://prometheus.io/
[client-golang]:https://github.com/prometheus/client_golang
