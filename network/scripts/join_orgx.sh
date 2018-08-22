#!/bin/bash

GLOBAL_ENV_LOCATION=$PWD/scripts/.env
source $GLOBAL_ENV_LOCATION

set -ev

docker exec -it "$CH_CLI_NAME" /var/scripts/step1orgx.sh
cd $PWD/orgx
./step2orgx.sh
