#!/bin/bash
GLOBAL_ENV_LOCATION=$PWD/.env
source $GLOBAL_ENV_LOCATION

set -ev

# ORG 5
docker stack deploy -c "$SERVICE_ORG5_COMPOSE_PATH" hlf_services
sleep 3
docker stack deploy -c "$PEER_ORG5_COMPOSE_PATH" hlf_peer

