# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential

## Add source code to the build stage.
ADD . /limfm
WORKDIR /limfm

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
ENV CC gcc
ENV CXX g++
RUN make

# Package Stage
FROM --platform=linux/amd64 ubuntu:20.04

## TODO: Change <Path in Builder Stage>
COPY --from=builder /limfm/bin/* /