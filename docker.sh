#!/bin/bash

# this will not work in powershell (as far as I can tell)

echo "starting"

# make sure you have one called armbuilder!
docker buildx use armbuilder

if [ "$1" = "main" ]; then
    docker buildx build --platform linux/arm64 --push -f main/Dockerfile -t thomasmcnamara7/custom-mysql .
elif [ "$1" = "backup" ]; then
    docker buildx build --platform linux/arm64 --push -f backup/Dockerfile -t thomasmcnamara7/custom-mysql-backup .
else
    echo "image not recognized"
    exit 1
fi