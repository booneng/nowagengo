#!/usr/bin/env bash

ROOT="$(cd "$(dirname "$0")/.." &>/dev/null; pwd -P)"

PROTOC_GO_CONTAINER_IMAGE="booneng/protoc-go"

docker build -t "${PROTOC_GO_CONTAINER_IMAGE}" .

docker run \
    --interactive \
    --rm \
    --volume "${ROOT}:${ROOT}" \
    --workdir "${ROOT}" \
    "${PROTOC_GO_CONTAINER_IMAGE}" \
        --proto_path=${ROOT}/protobuf/nowaservice \
        --go_out=plugins=grpc,paths=source_relative:./nowaservice \
        ${ROOT}/protobuf/nowaservice/*.proto


echo "Protos regenerated (OK)"
