
# M1 incompatible packages
saw error
```
...
tried: '/opt/homebrew/lib/python3.9/site-packages/Crypto/Util/../Cipher/_raw_ecb.abi3.so' (mach-o file, but is an incompatible architecture (have 'x86_64', need 'arm64e'))
...
```
when `import web3`.
reproducable by
```
python3
> from Crypto.PublicKey import ECC
```
solved by
```

pip uninstall pycryptodome
pip install pycryptodome --no-cache-dir --verbose
```
similar issue with `lru-dict`, `pyethash`
```
pip3 uninstall lru-dict
arch -arm64 pip install lru-dict --no-cache
pip3 uninstall pyethash
arch -arm64 pip install pyethash --no-cache
```