#!/bin/bash

export IMAGE_TAG=jammy

IMAGE_NAME=casparcg-ffmpeg-${IMAGE_TAG}

docker build -t $IMAGE_NAME \
  --build-arg PROC_COUNT \
  --build-arg IMAGE_TAG \
  $PWD

tempContainer=$(docker create $IMAGE_NAME)
docker cp $tempContainer:/dist/ ./
docker rm -v $tempContainer

docker rmi $IMAGE_NAME
