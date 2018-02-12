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

#### **Go-installation (https://github.com/golang/go/wiki/Ubuntu)**
```bash
sudo add-apt-repository ppa:gophers/archive
sudo apt-get update
sudo apt-get install golang-1.9-go
```

Put this line: `export PATH=$PATH:/usr/lib/go-1.9/bin`  into `.profile` file.

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

Please note that `Geth` version should be greater or equal than `1.7.3`.

```bash
$ geth version|grep "Version: 1"
Version: 1.7.3-stable
```

----------------------

## **eBloc Setup on Linux and macOS**

### Downloading 

```bash
cd $HOME
git clone https://github.com/avatar-lavventura/eblocPOA.git && cd eblocPOA 
eblocPath="$PWD"
```

### Create your Ethereum Account

```bash
[~] geth --datadir="$eblocPath" account new
Your new account is locked with a password. Please give a password. Do not forget this password.
Passphrase:
Repeat passphrase:
Address: {744ab3697b01015776f9578a57b081d2afdc5462}
```

Your new account is locked with a password. Please give a password. Do not forget this password. Please enter a difficult passphrase for your account. 

### Initializing

```bash
bash initialize.sh
```

### Server run:

```bash
sudo bash server.sh
```

### Client run (geth console):

```bash
bash client.sh
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

### **How to attach to eBloc Network Status**

If you want to see the status of your node on http://ebloc.cmpe.boun.edu.tr:3015 please follow: https://github.com/ebloc/eBloc/issues/2

### **Create your Ethereum Account using eBlocWallet**

In order to use eBlocWallet, first `sudo bash server.sh` should be executed, hence `geth-server` should run on the background.

Open(http://ebloc.cmpe.boun.edu.tr:3002). Than on the right top corner press:

`(),` => `Add Custom Node` => `Save & Use Custom Node`. 

Now if the read warning message is removed, your eBlocWallet is connected to your `geth-server``.

Now, you can create your Etherem address under `Generate Wallet`. 
