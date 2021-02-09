# Prometheus Example App

This example app serves as an example of how one can easily instrument HTTP handlers with [Prometheus][prometheus] metrics. It uses the Prometheus [go client][client-golang] to create a new Prometheus registry.

Usage is simple, on any request to `/` the request will result in a `200` response code. This increments the counter for this response code. Similarly the `/err` endpoint will result in a `404` response code, therefore increments that respective counter. Duration metrics are also exposed for any request to `/`.

A Docker image is available at: `quay.io/brancz/prometheus-example-app:v0.3.0`

## Deploying in a Kubernetes cluster

First, deploy one instance of this example application, which listens and exposes metrics on port 8080 using the following [Deployment manifest](manifests/deployment.yaml).

Then, in order for Prometheus to be able to discover and scrape these metrics, in this repository we provide [Pod Monitor][prometheus-operator-crd] custom resource as an example. For that, Prometheus Operator needs to be running in the cluster. To install it, follow this guide: [quickstart][prometheus-operator-quickstart].

For this example application, [PodMonitor manifest](manifests/pod-monitor.yaml) describes how the metrics can be discovered and scrapped by Prometheus.

[prometheus]:https://prometheus.io/
[client-golang]:https://github.com/prometheus/client_golang
[prometheus-operator-quickstart]:https://github.com/coreos/prometheus-operator#quickstart
[prometheus-operator-crd]:https://github.com/coreos/prometheus-operator#customresourcedefinitions

## Exposed Prometheus metrics

This example app exposed the following data over the `/metrics` API, resulting with the `version` metric being collected and exposed in Prometheus.

```
# HELP version Version information about this binary
# TYPE version gauge
version{version="v0.1.0"} 1
```
