#!/usr/bin/env bash

ROOT="$(cd "$(dirname "$0")/.." &>/dev/null; pwd -P)"

PROTOC_GO_CONTAINER_IMAGE="booneng/protoc-go"

git clone https://github.com/booneng/nowaproto

mkdir nowaservice

docker build -t "${PROTOC_GO_CONTAINER_IMAGE}" .

docker run \
    --interactive \
    --rm \
    --volume "${ROOT}:${ROOT}" \
    --workdir "${ROOT}" \
    "${PROTOC_GO_CONTAINER_IMAGE}" \
        --proto_path=${ROOT}/nowaproto/nowaservice \
        --go_out=plugins=grpc,paths=source_relative:./nowaservice \
        ${ROOT}/nowaproto/nowaservice/*.proto

rm -rf nowaproto

echo "Protos regenerated (OK)"
