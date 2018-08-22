#!/bin/bash

set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

# CH org
docker stack deploy -c "$ZK_COMPOSE_PATH" hlf_zk
sleep 3
docker stack deploy -c "$KAFKA_COMPOSE_PATH" hlf_kafka
sleep 3