#!/bin/bash
GLOBAL_ENV_LOCATION=$PWD/.env
source $GLOBAL_ENV_LOCATION

set -ev

# ORG 7
docker stack deploy -c "$SERVICE_ORG7_COMPOSE_PATH" hlf_services
sleep 3
docker stack deploy -c "$PEER_ORG7_COMPOSE_PATH" hlf_peer

