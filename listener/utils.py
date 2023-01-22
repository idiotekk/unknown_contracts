#!/usr/bin/python
import argparse
import requests
import json

# Exports contract ABI in JSON

ABI_ENDPOINT = 'https://api.etherscan.io/api?module=contract&action=getabi&address='

parser = argparse.ArgumentParser()
parser.add_argument('addr', type=str, help='Contract address')

def address_to_abi(addr : str, from_cache :bool=True) -> list:
    """
    Get abi from contract address.
    addr : str
    from_cache ： bool
        if True, check cache file first
    """
    cache_file = f"/tmp/{addr}.abi.json"
    if from_cache:
        try:
            with open(cache_file) as f:
                abi_json = json.load(f)
                print(f"read from {cache_file}")
                return abi_json
        except Exception:
            print(f"failed to read from {cache_file}")

    response = requests.get('%s%s'%(ABI_ENDPOINT, addr))
    response_json = response.json()
    abi_json = json.loads(response_json['result'])

    with open(cache_file, "w") as f:
        json.dump(abi_json, f)
        print(f"cached to: {cache_file}")
    return abi_json

if __name__ == '__main__':
    args = parser.parse_args()
    addr = args.addr
    result = address_to_abi(addr)
    out_file = f"{addr}.abi.json"
    open(out_file, 'w').write(result)
    print(out_file)
