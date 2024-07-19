package params

import (
	"github.com/airchains-network/cosmos-sdk/client"
	"github.com/airchains-network/cosmos-sdk/codec"
	"github.com/airchains-network/cosmos-sdk/codec/types"
)

// EncodingConfig specifies the concrete encoding types to use for a given app.
// This is provided for compatibility between protobuf and amino implementations.
type EncodingConfig struct {
	InterfaceRegistry types.InterfaceRegistry
	Codec             codec.Codec
	TxConfig          client.TxConfig
	Amino             *codec.LegacyAmino
}
