#!/bin/bash
GLOBAL_ENV_LOCATION=$PWD/scripts/.env
source $GLOBAL_ENV_LOCATION

set -ev

# ============================
# INSTALLING CHAINCODE IN ORG1
# ============================
docker exec "$CLI_NAME" peer chaincode install -n "$CC_NAME" -p "$CC_SRC" -v v0

# ============================
# INSTALLING CHAINCODE IN ORG2
# ============================
docker exec -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ch.example.com/peers/peer0.org2.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org2.example.com:7051" "$CLI_NAME" peer chaincode install -n "$CC_NAME" -p "$CC_SRC" -v v0

# ============================
# INSTALLING CHAINCODE IN ORG3
# ============================
docker exec -e "CORE_PEER_LOCALMSPID=Org3MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ch.example.com/peers/peer0.org3.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org3.example.com:7051" "$CLI_NAME" peer chaincode install -n "$CC_NAME" -p "$CC_SRC" -v v0

# ============================
# INSTALLING CHAINCODE IN ORG4
# ============================
docker exec -e "CORE_PEER_LOCALMSPID=Org4MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ch.example.com/peers/peer0.org4.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org4.example.com:7051" "$CLI_NAME" peer chaincode install -n "$CC_NAME" -p "$CC_SRC" -v v0

# ============================
# INSTALLING CHAINCODE IN ORG5
# ============================
docker exec -e "CORE_PEER_LOCALMSPID=Org5MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ch.example.com/peers/peer0.org5.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org5.example.com:7051" "$CLI_NAME" peer chaincode install -n "$CC_NAME" -p "$CC_SRC" -v v0
# ============================
# INSTALLING CHAINCODE IN ORG6
# ============================
docker exec -e "CORE_PEER_LOCALMSPID=Org6MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ch.example.com/peers/peer0.org6.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/peers/peer0.org6.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/peers/peer0.org6.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/users/Admin@org6.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org6.example.com:7051" "$CLI_NAME" peer chaincode install -n "$CC_NAME" -p "$CC_SRC" -v v0
# ============================
# INSTALLING CHAINCODE IN ORG7
# ============================
docker exec -e "CORE_PEER_LOCALMSPID=Org7MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ch.example.com/peers/peer0.org7.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/peers/peer0.org7.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/peers/peer0.org7.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/users/Admin@org7.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org7.example.com:7051" "$CLI_NAME" peer chaincode install -n "$CC_NAME" -p "$CC_SRC" -v v0


# ===========================
# INSTANTIATING THE CHAINCODE
# ===========================
docker exec "$CLI_NAME" peer chaincode instantiate -o "$ORDERER_NAME":7050 -C "$CHANNEL_NAME" -n "$CC_NAME" "$CC_SRC" -v v0  -c '{"Args":[]}' -P "OR('Org1MSP.member', 'Org2MSP.member', 'Org3MSP.member' )" --tls --cafile $ORDERER_CA

sleep 3

# ================================
# LISTING THE CHAINCODES INSTALLED
# ================================
docker exec "$CLI_NAME" peer chaincode list --instantiated -C "$CHANNEL_NAME" --tls --cafile $ORDERER_CA

sleep 10

# ================================
# INVOKING INITLEDGER IN CHAINCODE
# ================================
docker exec "$CLI_NAME" peer chaincode invoke -o "$ORDERER_NAME":7050 --tls --cafile $ORDERER_CA -C $CHANNEL_NAME -n $CC_NAME -c '{"Args":["initLedger"]}'
