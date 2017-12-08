# Prometheus Example App

This example app serves as an example of how one can easily instrument HTTP handlers with [Prometheus](https://prometheus.io/) metrics.

Usage is simple, on any request to `/` the request will result in a `200` response code. This increments the counter for this response code. Similarly the `/err` endpoint will result in a `404` response code, therefore increments that respective counter.

A Docker image is available at: `quay.io/brancz/prometheus-example-app:v0.1.0`
