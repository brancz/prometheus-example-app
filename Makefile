VERSION:=$(shell cat VERSION)

LDFLAGS="-X main.appVersion=$(VERSION)"

all:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags=$(LDFLAGS) -o prometheus-example-app --installsuffix cgo main.go
	docker build -t quay.io/brancz/prometheus-example-app:$(VERSION) .
