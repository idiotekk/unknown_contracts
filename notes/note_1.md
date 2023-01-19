# gas

## block limit
- block limit = 30M gas, not static


## how to save gas
- deployment
    * smaller contracts save gas on deployment

- transaction cost = op-code + transaction data + memory + storage
    * cheapter op-codes
    * smaller transaction data
    * less memory (solidity has no garb collector)
    * less storage

## misc

- a `payable` function is cheaper because it doesn't check send ether = 0
- 21000 for every transaction (see $G_{transaction}$ in yellow paper): used for verification of bunch of things: signature, enough balance etc.
- calling functions in library saves bytecode because the functions are not part of your contract
- single line swaps `(a, b) = (b, a)`