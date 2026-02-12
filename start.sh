#!/bin/bash

mkdir -p /data/node1

# Only create validator key if not exists
if [ ! -f "/data/node1/consensus/validator.key" ]; then
  polygon-edge secrets init --data-dir /data/node1
fi

# Copy genesis only first time
if [ ! -f "/data/genesis.json" ]; then
  cp /app/genesis.json /data/genesis.json
fi

polygon-edge server \
  --data-dir /data/node1 \
  --chain /data/genesis.json \
  --jsonrpc 0.0.0.0:8545 \
  --libp2p 0.0.0.0:1478
