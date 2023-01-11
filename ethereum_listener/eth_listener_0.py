# import the following dependencies
import json
from web3 import Web3
import asyncio

# add your blockchain connection information
infura_url = 'https://mainnet.infura.io/v3/b46dedf0dde54f20b49bc3b560ec6a54'
web3 = Web3(Web3.HTTPProvider(infura_url))

if __name__ == "__main__":

    x = web3.eth.get_balance("0xE5d4924413ae59AE717358526bbe11BB4A5D76b9")