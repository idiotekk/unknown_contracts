import os
import time
import asyncio
from pprint import pprint
import json
from web3 import Web3
from utils import address_to_abi

http_address = "https://mainnet.infura.io/v3/{}".format(os.getenv("INFURA_API_KEY"))
w3 = Web3(Web3.HTTPProvider(http_address))
assert w3.isConnected()
#addr = "0x5Af0D9827E0c53E4799BB226655A1de152A425a5" # milady
addr = "0x00000000006c3852cbEf3e08E8dF289169EdE581" # seaport
abi = address_to_abi(addr, from_cache=True)
contract = w3.eth.contract(address=addr, abi=abi)

def handle_event(event):
    pprint("-"*100)
    pprint(dict(event))
    pprint("#"*100)

def log_loop(event_filter, poll_interval):
    while True:
        for event in event_filter.get_new_entries():
            handle_event(event)
        time.sleep(poll_interval)

def main():
    #block_filter = w3.eth.filter('latest')
    #log_loop(block_filter, 2)
    event_filter = contract.events.OrderFulfilled.createFilter(fromBlock='latest')
    log_loop(event_filter, 2)

if __name__ == '__main__':
    main()