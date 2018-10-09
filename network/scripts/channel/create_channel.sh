#!/bin/bash
GLOBAL_ENV_LOCATION=$PWD/scripts/.env
source $GLOBAL_ENV_LOCATION

set -ev

# ==============================
# CREATING THE CHANNEL mychannel
# ==============================
docker exec "$CLI_NAME" peer channel create -o "$ORDERER_NAME":7050 -c "$CHANNEL_NAME" -f "$CHANNEL_TX_LOCATION" --tls --cafile $ORDERER_CA

# ====================================================
# JOIN peer0.org1.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA

# ====================================================
# JOIN peer1.org1.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org1MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" -e "CORE_PEER_ADDRESS=peer1.org1.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA

# ====================================================
# JOIN peer0.org2.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org2.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org2.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA

# ====================================================
# JOIN peer1.org2.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" -e "CORE_PEER_ADDRESS=peer1.org2.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA

# ====================================================
# JOIN peer0.org3.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org3MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org3.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA

# ====================================================
# JOIN peer1.org3.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org3MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer1.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer1.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer1.org3.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp" -e "CORE_PEER_ADDRESS=peer1.org3.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA


# ====================================================
# JOIN peer0.org4.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org4MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org4.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA

# ====================================================
# JOIN peer1.org4.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org4MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer1.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer1.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer1.org4.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp" -e "CORE_PEER_ADDRESS=peer1.org4.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA


# ====================================================
# JOIN peer0.org5.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org5MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org5.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA

# ====================================================
# JOIN peer1.org5.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org5MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer1.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer1.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer1.org5.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp" -e "CORE_PEER_ADDRESS=peer1.org5.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA

# ====================================================
# JOIN peer0.org6.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org6MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/peers/peer0.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/peers/peer0.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/peers/peer0.org6.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/users/Admin@org6.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org6.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA

# ====================================================
# JOIN peer1.org6.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org6MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/peers/peer1.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/peers/peer1.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/peers/peer1.org6.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/users/Admin@org6.example.com/msp" -e "CORE_PEER_ADDRESS=peer1.org6.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA

# ====================================================
# JOIN peer0.org7.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org7MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/peers/peer0.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/peers/peer0.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/peers/peer0.org7.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/users/Admin@org7.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org7.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA

# ====================================================
# JOIN peer1.org7.example.com TO THE CHANNEL mychannel.
# ====================================================
docker exec -e "CORE_PEER_LOCALMSPID=Org7MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/peers/peer1.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/peers/peer1.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/peers/peer1.org7.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/users/Admin@org7.example.com/msp" -e "CORE_PEER_ADDRESS=peer1.org7.example.com:7051" "$CLI_NAME" peer channel join -b "$CHANNEL_NAME".block --tls --cafile $ORDERER_CA


# ===============================
# UPDAING THE ANCHOR PEER OF ORG1
# ===============================
docker exec "$CLI_NAME" peer channel update  -o "$ORDERER_NAME":7050 -c "$CHANNEL_NAME" -f "$ORG1_ANCHOR_TX" --tls --cafile $ORDERER_CA

# ===============================
# UPDAING THE ANCHOR PEER OF ORG2
# ===============================
docker exec -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org2.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org2.example.com:7051" "$CLI_NAME" peer channel update  -o "$ORDERER_NAME":7050 -c "$CHANNEL_NAME" -f "$ORG2_ANCHOR_TX" --tls --cafile $ORDERER_CA

# ===============================
# UPDAING THE ANCHOR PEER OF ORG3
# ===============================
docker exec -e "CORE_PEER_LOCALMSPID=Org3MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org3.example.com:7051" "$CLI_NAME" peer channel update  -o "$ORDERER_NAME":7050 -c "$CHANNEL_NAME" -f "$ORG3_ANCHOR_TX" --tls --cafile $ORDERER_CA

# ===============================
# UPDAING THE ANCHOR PEER OF ORG4
# ===============================
docker exec -e "CORE_PEER_LOCALMSPID=Org4MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org4.example.com:7051" "$CLI_NAME" peer channel update  -o "$ORDERER_NAME":7050 -c "$CHANNEL_NAME" -f "$ORG4_ANCHOR_TX" --tls --cafile $ORDERER_CA

# ===============================
# UPDAING THE ANCHOR PEER OF ORG5
# ===============================
docker exec -e "CORE_PEER_LOCALMSPID=Org5MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org5.example.com:7051" "$CLI_NAME" peer channel update  -o "$ORDERER_NAME":7050 -c "$CHANNEL_NAME" -f "$ORG5_ANCHOR_TX" --tls --cafile $ORDERER_CA

# ===============================
# UPDAING THE ANCHOR PEER OF ORG6
# ===============================
docker exec -e "CORE_PEER_LOCALMSPID=Org6MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/peers/peer0.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/peers/peer0.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/peers/peer0.org6.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org6.example.com/users/Admin@org6.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org6.example.com:7051" "$CLI_NAME" peer channel update  -o "$ORDERER_NAME":7050 -c "$CHANNEL_NAME" -f "$ORG6_ANCHOR_TX" --tls --cafile $ORDERER_CA

# ===============================
# UPDAING THE ANCHOR PEER OF ORG7
# ===============================
docker exec -e "CORE_PEER_LOCALMSPID=Org7MSP" -e "CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/peers/peer0.org1.example.com/tls/server.crt" -e "CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/peers/peer0.org1.example.com/tls/server.key" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/peers/peer0.org7.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org7.example.com/users/Admin@org7.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org7.example.com:7051" "$CLI_NAME" peer channel update  -o "$ORDERER_NAME":7050 -c "$CHANNEL_NAME" -f "$ORG7_ANCHOR_TX" --tls --cafile $ORDERER_CA