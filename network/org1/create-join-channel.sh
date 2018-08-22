#!/bin/bash

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

# # # Create the channel
docker exec -e "CORE_PEER_LOCALMSPID=CHMSP" -e "CORE_PEER_MSPCONFIGPATH=/var/hyperledger/users/Admin@ch.example.com/msp" "$PEER_NAME" peer channel create -o "$ORDERER_NAME":7050 -c "$CHANNEL_NAME" -f /var/hyperledger/config/chchannel.tx
# # # Join peer0.ch.example.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=CHMSP" -e "CORE_PEER_MSPCONFIGPATH=/var/hyperledger/users/Admin@ch.example.com/msp" "$PEER_NAME" peer channel join -b "$CHANNEL_NAME".block
