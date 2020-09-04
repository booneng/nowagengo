#!/usr/bin/env bash

ROOT="$(cd "$(dirname "$0")/.." &>/dev/null; pwd -P)"

PROTOC_GO_CONTAINER_IMAGE="booneng/protoc-go"
PROTOC_DART_CONTAINER_IMAGE="booneng/protoc-dart"
PROTOC_SWIFT_CONTAINER_IMAGE="booneng/protoc-swift"


docker build -t "${PROTOC_GO_CONTAINER_IMAGE}" -f docker/go_protoc.dockerfile .

docker build -t "${PROTOC_DART_CONTAINER_IMAGE}" -f docker/dart_protoc.dockerfile .

docker build -t "${PROTOC_SWIFT_CONTAINER_IMAGE}" -f docker/swift_protoc.dockerfile .

echo "Docker images built (OK)"
