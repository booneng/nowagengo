FROM swift:5.2 AS builder

ENV PROTOC_VERSION "3.11.4"
ENV PROTOC_GEN_SWIFT_VERSION "0.11.0"

WORKDIR /root

RUN apt-get update -yqq && \
  apt-get install -yqq curl git unzip

# Install protoc
RUN curl -sfLo protoc.zip "https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip" && \
  mkdir protoc && \
  unzip -q -d protoc protoc.zip

# Install gen-swift
RUN git clone -q https://github.com/grpc/grpc-swift && \
  cd grpc-swift && \
  git checkout -q tags/${PROTOC_GEN_SWIFT_VERSION} && \
  make plugin