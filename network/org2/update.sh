#!/bin/bash

rv="v$(shuf -i 200-10000 -n 1)"

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

docker exec -it "$CLI_NAME" peer chaincode install -n "$CC_NAME" -p "$CC_SRC" -v "$rv"

docker exec -it "$CLI_NAME" peer chaincode upgrade -o "$ORDERER_NAME":7050 -C "$CHANNEL_NAME" -n "$CC_NAME" "$CC_SRC" -v "$rv" -c '{"Args": ["a", "100"]}'