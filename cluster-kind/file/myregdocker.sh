#!/bin/sh

# create registry container unless it already exists
reg_name='kind-registry'
reg_port='5001'
reg_host='0.0.0.0'

docker network create registri

docker run \
    -d --restart=always -p "0.0.0.0:${reg_port}:5000" --name "${reg_name}"  --network registri \
    registry:2

docker run \
  -d \
  -e ENV_DOCKER_REGISTRY_HOST=$reg_name \
  -e ENV_DOCKER_REGISTRY_PORT=5000 \
  -p 8099:80  --network registri\
  konradkleine/docker-registry-frontend:v2

kind create cluster --config /file/mycluster.yaml

docker network connect "kind" "${reg_name}"
