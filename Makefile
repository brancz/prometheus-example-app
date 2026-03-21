VERSION:=$(shell cat VERSION)

LDFLAGS="-X main.appVersion=$(VERSION)"

build:
	CGO_ENABLED=0 GOOS=linux go build -ldflags=$(LDFLAGS) -o prometheus-example-app --installsuffix cgo main.go

container:
	docker build -t quay.io/brancz/prometheus-example-app:$(VERSION) .

container-multi:
	docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t quay.io/brancz/prometheus-example-app:$(VERSION) .
