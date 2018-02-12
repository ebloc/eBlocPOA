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

### **Access your Ethereum Account using eBlocWallet**

In order to use eBlocWallet, first `sudo bash server.sh` should be executed, hence `geth-server` should run on the background. Open (http://ebloc.cmpe.boun.edu.tr:3002). Then on the right top corner press:

`(),` => `Add Custom Node` => `Save & Use Custom Node`. 

Now if the read warning message is removed, your eBlocWallet is connected to your `geth-server`.

`Send Ether and Tokes` => Select `Keystore File (UTC / JSON)`=>`SELECT WALLET FILE` (Your wallet is located under `eblocPOA/keystore` name starting with `UTC`) => `Unlock`

<img width="1100" alt="screen shot 2018-02-12 at 13 29 13" src="https://user-images.githubusercontent.com/18537398/36092854-dfb53d80-0ff9-11e8-9dc5-b2e788d01bd5.png">

Later you should see your account information (balance, account, etc).

<img width="1088" alt="screen shot 2018-02-12 at 13 38 48" src="https://user-images.githubusercontent.com/18537398/36092942-2fa6c0ac-0ffa-11e8-9664-4f9df315f407.png">

### **Some helpful links**

- [Managing your accounts](https://github.com/ethereum/go-ethereum/wiki/Managing-your-accounts)
- [Sending Ether on geth-client](https://github.com/ethereum/go-ethereum/wiki/Sending-ether)

Example:

```
> sender=eth.accounts[0]
"0x4e4a0750350796164d8defc442a712b7557bf282"
> receiever="0xf81cD8DC22f06b84B610F4b6B7A388F63e635bF4"
"0xf81cD8DC22f06b84B610F4b6B7A388F63e635bF4"
> eth.sendTransaction({from:sender, to:receiever, value: web3.toWei(1, "ether")})
> web3.fromWei(eth.getBalance(sender))
```

