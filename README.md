# ebloc_POA

`Geth` version should be greater or equal than 1.7.3.

Please update `DATADIR` variable on `client.sh` and `server.sh` as your path for ebloc_POA directory.


## Initializing

```
geth --datadir ~/ebloc_POA/private init custom.json
```

## Server run:

```
sudo bash server.sh
```

## Client run:

```
sudo bash client.sh
```

Geth Console:

```
Welcome to the Geth JavaScript console!

instance: Geth/v1.7.3-stable/darwin-amd64/go1.9.2
 modules: admin:1.0 clique:1.0 debug:1.0 eth:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

> net
{
  listening: true,
  peerCount: 1,
  version: "23422",
  getListening: function(callback),
  getPeerCount: function(callback),
  getVersion: function(callback)
}
```
