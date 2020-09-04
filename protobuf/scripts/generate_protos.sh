#!/usr/bin/env bash

ROOT="$(cd "$(dirname "$0")/.." &>/dev/null; pwd -P)"

PROTOC_GO_CONTAINER_IMAGE="booneng/protoc-go"

PROTOC_DART_CONTAINER_IMAGE="booneng/protoc-dart"

PROTOC_SWIFT_CONTAINER_IMAGE="booneng/protoc-swift"

docker run \
    --interactive \
    --rm \
    --volume "${ROOT}:${ROOT}" \
    --workdir "${ROOT}" \
    "${PROTOC_GO_CONTAINER_IMAGE}" \
        --proto_path=${ROOT}/protobuf \
        --go_out=plugins=grpc,paths=source_relative:./nowagengo \
        ${ROOT}/protobuf/*.proto

docker run \
    --interactive \
    --rm \
    --volume "${ROOT}:${ROOT}" \
    --workdir "${ROOT}" \
    "${PROTOC_DART_CONTAINER_IMAGE}" \
        --proto_path=${ROOT}/protobuf \
        --dart_out=grpc:./nowagendart \
        ${ROOT}/protobuf/*.proto

docker run \
    --interactive \
    --rm \
    --volume "${ROOT}:${ROOT}" \
    --workdir "${ROOT}" \
    "${PROTOC_SWIFT_CONTAINER_IMAGE}" \
        --proto_path=${ROOT}/protobuf \
        --swift_opt=Visibility=Public \
        --swift_out=./nowagenswift \
        --grpc-swift_opt=Visibility=Public \
        --grpc-swift_out=nowagenswift \
        ${ROOT}/protobuf/*.proto

echo "Protos regenerated (OK)"
