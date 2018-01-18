# POA

## Initializing

```
geth --datadir ~/POA/private init custom.json
```

## Server run:

```
geth --datadir ~/POA/private --rpcaddr 127.0.0.1 --rpc --rpcport 8546 --rpccorsdomain="*" --networkid 23422 --rpcapi eth,net,web3,personal console 
admin.addPeer("enode://9bf6226691a72cb6df99398e64f5d858305890f7679d7501871428de8d29ccf29d52d6021a5c316064bc3168cb1b241fd07a35b7a5f0d8e770e6bd58b9aa3722@79.123.177.145:3016");
```

## Client run:

