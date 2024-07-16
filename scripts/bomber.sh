#!/bin/bash
KEYRING="test"
CHAINID="station-1"
KEY="node"
ITERATIONS=1000
for ((i=1; i<=ITERATIONS; i++))
do
  echo "Iteration $i"
  ./build/wasmstationd tx bank send $KEY wasmstation148p9k67uuf6smg30e32ndyf0kq9jxx6k6hat95 1stake --keyring-backend $KEYRING --chain-id $CHAINID -y
  sleep 2
done
