import os
import pprint
import json
from web3 import Web3, EthereumTesterProvider
from utils import address_to_abi

#w3 = Web3(EthereumTesterProvider())
#assert w3.isConnected()

#ipc_address = os.path.expandvars('/Users/$USER/Library/Ethereum/geth.ipc')
#w3 = Web3(Web3.IPCProvider(ipc_address))
http_address = "https://mainnet.infura.io/v3/{}".format(os.getenv("INFURA_API_KEY"))
w3 = Web3(Web3.HTTPProvider(http_address))
assert w3.isConnected()

# get block
#pprint.pprint(dict(w3.eth.get_block(3391)))

addr = "0x5Af0D9827E0c53E4799BB226655A1de152A425a5" # milady
abi = address_to_abi(addr, from_cache=True)
contract = w3.eth.contract(address=addr, abi=abi)
print(
    contract.functions.ownerOf(9399).call() # owner of 9399
)