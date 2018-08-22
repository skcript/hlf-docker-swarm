#!/bin/bash

set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

# ARCH=$(uname -s | grep Darwin)
# if [ "$ARCH" == "Darwin" ]; then
#   FLAG="-it"
# else
#   FLAG="-i"
# fi
FLAG="-i"

# Zookeeper + Kafka + Peer0 - Machine 1
ORG1_CA_PATH=$(ls /var/mynetwork/certs/crypto-config/peerOrganizations/org1.example.com/ca/ | grep "_sk")

sed "$FLAG" "s/- node.hostname == .*/- node.hostname == $ORG1_HOSTNAME/g" $ZK_COMPOSE_PATH
sed "$FLAG" "s/- node.hostname == .*/- node.hostname == $ORG1_HOSTNAME/g" $KAFKA_COMPOSE_PATH
sed "$FLAG" "s/- node.hostname == .*/- node.hostname == $ORG1_HOSTNAME/g" $ORDERER0_COMPOSE_PATH
sed "$FLAG" "s/- node.hostname == .*/- node.hostname == $ORG1_HOSTNAME/g" $PEER_ORG1_COMPOSE_PATH
sed "$FLAG" "s/- node.hostname == .*/- node.hostname == $ORG1_HOSTNAME/g" $SERVICE_ORG1_COMPOSE_PATH
sed "$FLAG" "s#- FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/.*#- FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/$ORG1_CA_PATH#g" $SERVICE_ORG1_COMPOSE_PATH


# Entity1 
ORG2_CA_PATH=$(ls /var/mynetwork/certs/crypto-config/peerOrganizations/org2.example.com/ca/ | grep "_sk")
sed "$FLAG" "s/- node.hostname == .*/- node.hostname == $ORG2_HOSTNAME/g" $ORDERER1_COMPOSE_PATH
sed "$FLAG" "s/- node.hostname == .*/- node.hostname == $ORG2_HOSTNAME/g" $PEER_ORG2_COMPOSE_PATH
sed "$FLAG" "s/- node.hostname == .*/- node.hostname == $ORG2_HOSTNAME/g" $SERVICE_ORG2_COMPOSE_PATH
sed "$FLAG" "s#- FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/.*#- FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/$ORG2_CA_PATH#g" $SERVICE_ORG2_COMPOSE_PATH

# Entity2
ORG3_CA_PATH=$(ls /var/mynetwork/certs/crypto-config/peerOrganizations/org3.example.com/ca/ | grep "_sk")
sed "$FLAG" "s/- node.hostname == .*/- node.hostname == $ORG2_HOSTNAME/g" $ORDERER0_COMPOSE_PATH
sed "$FLAG" "s/- node.hostname == .*/- node.hostname == $ORG2_HOSTNAME/g" $PEER_ORG3_COMPOSE_PATH
sed "$FLAG" "s/- node.hostname == .*/- node.hostname == $ORG2_HOSTNAME/g" $SERVICE_ORG3_COMPOSE_PATH
sed "$FLAG" "s#- FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/.*#- FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/$ORG3_CA_PATH#g" $SERVICE_ORG3_COMPOSE_PATH

rm org*/**.ymlt