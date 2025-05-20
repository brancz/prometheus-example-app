VERSION:=$(shell cat VERSION)

LDFLAGS="-X main.appVersion=$(VERSION)"

build:
	CGO_ENABLED=0 go build -ldflags=$(LDFLAGS) -o /tmp/prometheus-example-app --installsuffix cgo main.go

all: build
	docker build -t quay.io/brancz/prometheus-example-app:$(VERSION) .

multi: build
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 -t quay.io/brancz/prometheus-example-app:$(VERSION) .
