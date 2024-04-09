#!/bin/bash
# Description: Initialize the node

command -v jq > /dev/null 2>&1 || { echo >&2 "jq not installed. More info: https://stedolan.github.io/jq/download/"; exit 1; }


KEY=node
CHAINID=station-1
MONIKER=noooblien
KEYRING="test"
cd ../  ;
rm -f  ./build
make build
# Remove the existing data
rm -rf ~/.wasmstationd

# Initialize the node
./build/wasmstationd init $MONIKER \
    --chain-id $CHAINID

#Print the genesis file to verify everything worked
cat  ~/.station-wasmd/config/genesis.json

# Prepare your account
./build/wasmstationd keys add $KEY \
    --keyring-backend $KEYRING

# Add the account to genesis
grep bond_denom ~/.stationwasmd/config/genesis.json

# Add the account balance to genesis

./build/wasmstationd genesis add-genesis-account $KEY 100000000stake \
    --keyring-backend $KEYRING

# Create a gentx

./build/wasmstationd genesis gentx $KEY 70000000stake \
    --keyring-backend $KEYRING \
    --chain-id $CHAINID

# Collect the gentxs
./build/wasmstationd genesis collect-gentxs \







