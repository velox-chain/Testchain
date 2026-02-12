#!/bin/bash

mkdir -p /data/node1

if [ ! -f "/data/node1/consensus/validator.key" ]; then
  polygon-edge secrets init --data-dir /data/node1
fi

if [ ! -f "/data/genesis.json" ]; then
  cp /app/genesis.json /data/genesis.json
fi

polygon-edge server \
  --data-dir /data/node1 \
  --chain /data/genesis.json \
  --jsonrpc 0.0.0.0:8545 \
  --libp2p 0.0.0.0:1478
