#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

arch=$(dpkg --print-architecture)

set -ex

# Install dependencies

mkdir -p build

GO111MODULE=on go mod vendor
CGO_ENABLED=0 go build -o build/postgres-operator -v -ldflags "$OPERATOR_LDFLAGS" cmd/main.go
