#!/bin/bash
GLOBAL_ENV_LOCATION=$PWD/scripts/.env
source $GLOBAL_ENV_LOCATION

set -ev

docker exec "$CLI_NAME" peer chaincode install -n "$CC_NAME" -p "$CC_SRC" -v v3


docker exec -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ch.example.com/peers/peer0.org2.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org2.example.com:7051" "$CLI_NAME" peer chaincode install -n "$CC_NAME" -p "$CC_SRC" -v v3


docker exec -e "CORE_PEER_LOCALMSPID=Org3MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ch.example.com/peers/peer0.org3.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org3.example.com:7051" "$CLI_NAME" peer chaincode install -n "$CC_NAME" -p "$CC_SRC" -v v3


docker exec "$CLI_NAME" peer chaincode upgrade -o "$ORDERER_NAME":7050 -C "$CHANNEL_NAME" -n "$CC_NAME" "$CC_SRC" -v v3  -c '{"Args":[]}' -P "OR('Org1MSP.member', 'Org2MSP.member', 'Org3MSP.member' )" --tls --cafile $ORDERER_CA

sleep 3

docker exec "$CLI_NAME" peer chaincode list --instantiated -C "$CHANNEL_NAME" --tls --cafile $ORDERER_CA

sleep 10

# invoke command
docker exec "$CLI_NAME" peer chaincode invoke -o "$ORDERER_NAME":7050 --tls --cafile $ORDERER_CA -C $CHANNEL_NAME -n $CC_NAME -c '{"Args":["initLedger"]}'
