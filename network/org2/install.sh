#!/bin/bash

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

docker exec -it "$CLI_NAME" peer chaincode install -n "$CC_NAME" -p "$CC_SRC" -v v0

docker exec -e "CORE_PEER_LOCALMSPID=Entity1MSP" -e "CORE_PEER_MSPCONFIGPATH=/var/hyperledger/users/Admin@entity1.example.com/msp" "$PEER_NAME" peer chaincode instantiate -o "$ORDERER_NAME":7050 -C "$CHANNEL_NAME" -n "$CC_NAME" "$CC_SRC" -v v0 -c '{"Args": ["a", "100"]}'

