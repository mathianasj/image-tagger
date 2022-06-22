#!/bin/bash

if [ $# -ne 4 ]
then
    echo "Invalid input please use tag.sh registry_address repository old_tag new_tag"
    exit 1
fi

REGISTRY_NAME="https://$1"
REPOSITORY=$2
TAG_OLD=$3
TAG_NEW=$4
CONTENT_TYPE="application/vnd.docker.distribution.manifest.v2+json"

MANIFEST=$(curl -H "Accept: ${CONTENT_TYPE}" -H "Authorization: Basic ${BASIC_AUTH}" "${REGISTRY_NAME}/v2/${REPOSITORY}/manifests/${TAG_OLD}")
TAG=$(curl -X PUT -H "Content-Type: ${CONTENT_TYPE}" -H "Authorization: Basic ${BASIC_AUTH}" -d "${MANIFEST}" "${REGISTRY_NAME}/v2/${REPOSITORY}/manifests/${TAG_NEW}")
echo "tagged ${REGISTRY_NAME}/${REPOSITORY}:${TAG_OLD} as ${REGISTRY_NAME}/${REPOSITORY}:${TAG_NEW}"

