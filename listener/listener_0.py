from web3 import Web3, EthereumTesterProvider
w3 = Web3(EthereumTesterProvider())
assert w3.isConnected()