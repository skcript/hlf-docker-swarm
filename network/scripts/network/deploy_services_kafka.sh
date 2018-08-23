#!/bin/bash

GLOBAL_ENV_LOCATION=$PWD/.env
source $GLOBAL_ENV_LOCATION
set -ev 

# KAFKA & ZOOKEEPER
docker stack deploy -c "$ZK_COMPOSE_PATH" hlf_zk
sleep 3
docker stack deploy -c "$KAFKA_COMPOSE_PATH" hlf_kafka
sleep 3