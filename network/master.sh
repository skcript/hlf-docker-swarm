#!/bin/bash

docker swarm leave -f
./setup_swarm.sh
./create_network.sh
TOKEN=$(docker swarm join-token worker | grep "docker swarm join")

ssh fabric@192.168.0.1 $TOKEN
ssh fabric@192.168.0.2 $TOKEN