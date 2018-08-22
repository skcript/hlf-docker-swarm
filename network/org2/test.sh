#!/bin/bash

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

docker exec -it "$CLI_NAME" peer chaincode invoke -o "$ORDERER_NAME":7050 -n "$CC_NAME" -c '{"Args":["set", "a", "20"]}' -C "$CHANNEL_NAME" --tls --cafile $ORDERER_CA
