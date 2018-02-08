# **Connect into Private Ethereum Blockchain (eBlocPOA)**

## **Preinstallations**

### **Installation Instructions for Mac**

```bash
brew install go
git clone https://github.com/ethereum/go-ethereum
cd go-ethereum
make geth
```
### **Installation Instructions for Linux**

#### **Go-installation**
```bash
tar -zxvf  go1.9.3.linux-amd64.tar.gz -C /usr/local/
sudo tar -zxvf  go1.7.1.linux-amd64.tar.gz -C /usr/local/
export PATH=$PATH:/usr/local/go/bin
cp  /usr/local/go/src/go /usr/bin/go
```

#### **Geth Installation**

```bash
sudo apt-get install git
git clone https://github.com/ethereum/go-ethereum 
sudo apt-get install -y build-essential libgmp3-dev golang
cd go-ethereum/
git pull
make geth
```

After go-ethereum is installed copy `geth` into` /usr/local/bin`:

```bash
[~] ls go-ethereum/build/bin
geth
[~] sudo cp build/bin/geth /usr/local/bin/
[~] which geth
/usr/local/bin/geth
```
Now when you just type `geth`, it should work.

`Geth` version should be greater or equal than `1.7.3`.

```
$ geth version|grep "Version: 1"
Version: 1.7.3-stable
```

----------------------

## **eBloc Setup on Linux and macOS**

### Downloading 

```
cd $HOME
git clone https://github.com/avatar-lavventura/eblocPOA.git && cd eblocPOA
eblocPath="$PWD" && echo $eblocPath
```

### Create your Ethereum Account

```
[~] geth --datadir="$eblocPath" account new
Your new account is locked with a password. Please give a password. Do not forget this password.
Passphrase:
Repeat passphrase:
Address: {744ab3697b01015776f9578a57b081d2afdc5462}
```

Your new account is locked with a password. Please give a password. Do not forget this password. Please enter a difficult passphrase for your account. 

### Initializing

```
geth --datadir="$eblocPath/private" init custom.json
```
Please update `DATADIR` variable on `client.sh` and `server.sh` as your path for eblocPOA directory.

```
var=$(echo $eblocPath | sed 's/\//\\\//g')
sed -i.bak "s/^\(DATADIR=\).*/\1$var/" server.sh && rm server.sh.bak
sed -i.bak  "s/^\(DATADIR=\).*/\1$var/" client.sh && rm client.sh.bak
```

### Server run:

```
sudo bash server.sh
```

### Client run (geth console):

```
sudo bash client.sh
```

If you are successfully connected into `eblocPOA` network inside `geth` console; `peerCount` should return 1 or more, after running `net`.

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
