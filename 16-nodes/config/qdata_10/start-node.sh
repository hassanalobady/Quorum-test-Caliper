#!/bin/bash

#
# This is used at Container start up to run the Tessera and geth nodes
#

set -u
set -e

### Configuration Options
TMCONF=/qdata/config.json

#GETH_ARGS="--datadir /qdata/dd --raft --raftblocktime 1000 --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum --nodiscover --unlock 0 --password /qdata/passwords.txt"
GETH_ARGS="--datadir /qdata/dd --rpcport 8545 --port 30303 --raftport 50400 --identity master-10 --raft --raftblocktime 1000 --rpc --rpccorsdomain=* --rpcaddr 0.0.0.0 --rpcvhosts=* --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,clique,raft,istanbul --ws --wsaddr 0.0.0.0 --wsorigins=* --wsapi eth,web3,quorum,txpool,net --wsport 8546 --unlock 0 --password /qdata/passwords.txt --networkid 10 --bootnodes enode://@172.13.0.2:30303,enode://@172.13.0.3:30303,enode://@172.13.0.4:30303,enode://@172.13.0.5:30303,enode://@172.13.0.6:30303,enode://@172.13.0.7:30303,enode://@172.13.0.8:30303,enode://@172.13.0.9:30303,enode://@172.13.0.10:30303,enode://@172.13.0.11:30303,enode://@172.13.0.12:30303,enode://@172.13.0.13:30303,enode://@172.13.0.14:30303,enode://@172.13.0.15:30303,enode://@172.13.0.16:30303,enode://@172.13.0.17:30303"


if [ ! -d /qdata/dd/geth/chaindata ]; then
  echo "[*] Mining Genesis block"
  /usr/local/bin/geth --datadir /qdata/dd init /qdata/genesis.json
fi

# echo "[*] Starting Constellation node"
# nohup /usr/local/bin/constellation-node $TMCONF 2>> /qdata/logs/constellation.log &

echo "[*] Starting Tessera node"
java -jar /tessera/tessera-app.jar -configfile $TMCONF >> /qdata/logs/tessera.log 2>&1 &

sleep 60

echo "[*] Starting Geth node"
PRIVATE_CONFIG=/qdata/tm.ipc nohup /usr/local/bin/geth $GETH_ARGS 2>>/qdata/logs/geth.log