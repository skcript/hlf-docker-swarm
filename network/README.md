## hlf-multichannel-docker-swarm

- Create the swarm and network
```
./setup_swarm.sh
./create_network.sh
```

- After Joining, in compose file, update the node hostnames.
- Deploy Kafka
```
./deploy_services.sh
```
- Deploy the services for respective hostname. Example
```
./scripts/ch/network/deploy_services_machine1.sh
```
- Repeat above until all services are deployed
- Install the channels. Example
```
./scripts/ch/channel/create_and_join_ch.sh
```
- Fetch and Join the channel from an other node
```
./scripts/state/channel/fetch_and_join_ch.sh
```
- Repeat all until channels are configured
- Install the chaincodes. Example
```
./scripts/ch/chaincode/install_ch_cc.sh
```
- Install the same in corresponding org
```
./scripts/state/chaincode/install_ch_cc.sh
```
- Repeat until all done
