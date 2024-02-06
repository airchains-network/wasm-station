# Description: Initialize the node

command -v jq > /dev/null 2>&1 || { echo >&2 "jq not installed. More info: https://stedolan.github.io/jq/download/"; exit 1; }


KEY=node
CHAINID=staion-1
MONIKER=noooblien
KEYRING="test"

make build
# Remove the existing data
rm -rf ./private/.station-wasmd

# Initialize the node
./build/stationwasmd init demo \
    --home ./private/.station-wasmd \
    --chain-id $CHAINID

#Print the genesis file to verify everything worked
cat ./private/.station-wasmd/config/genesis.json

# Prepare your account
./build/stationwasmd keys add $KEY \
    --home ./private/.station-wasmd \
    --keyring-backend $KEYRING

# Add the account to genesis
grep bond_denom ./private/.station-wasmd/config/genesis.json

# Add the account balance to genesis

./build/stationwasmd genesis add-genesis-account $KEY 100000000stake \
    --home ./private/.station-wasmd \
    --keyring-backend $KEYRING

# Create a gentx

./build/stationwasmd genesis gentx $KEY 70000000stake \
    --home ./private/.station-wasmd \
    --keyring-backend $KEYRING \
    --chain-id $CHAINID

# Collect the gentxs
./build/stationwasmd genesis collect-gentxs \
    --home ./private/.station-wasmd





