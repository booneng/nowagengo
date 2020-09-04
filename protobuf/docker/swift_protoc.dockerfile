FROM swift:5.2 AS builder

ENV PROTOC_VERSION "3.11.4"
ENV PROTOC_GEN_SWIFT_VERSION "1.0.0-alpha.18"

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
  make plugins

FROM swift:slim

COPY --from=builder /root/protoc/include/google /usr/local/include/google
COPY --from=builder /root/protoc/bin/protoc /usr/local/bin/protoc
COPY --from=builder /root/grpc-swift/protoc-gen-swift /usr/local/bin/protoc-gen-swift
COPY --from=builder /root/grpc-swift/protoc-gen-grpc-swift /usr/local/bin/protoc-gen-grpc-swift

ENTRYPOINT ["/usr/local/bin/protoc"]
