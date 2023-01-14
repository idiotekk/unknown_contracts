no capital letters in this note (unless absolutely necessary)

# data location
- `calldata`, can't be modified
- `memory`
    - memory cost is quadratic if [large](https://ethereum.github.io/yellowpaper/paper.pdf#page=28). (e.g. tornado cash)
    - memory is not cleared throughout the transaction, even if all references to a memory are out of scope.
- `storage`

# types
## function types
- `public` vs `private`
- `view`, same as `constant`, which doesn't change contract's data
- `pure`, won't read or modify contract's data
- `payable`, can pay ether when calling this function

### more about functions
functions that modify contract data should not return values.

## basic types
- `string`
- `bool`
- `int`
    - `int8`, -128 to 127 (2^8 in total)
    - `int16`, -32768 to 32767
    - ...
    - `int256`
    - `int` is an alias of int256
    - smaller int types cost more in exeuction because it need to trim the data at the slot to get the correct int
- `uint`
- `fixed`, 'fixed' point number
- `ufixed`
- `address`

## reference types
- fixed array.
```solidity
uint[3] public myArray;
```
- dynamic array. `int[]`
```solidity
uint[] public a;
a.push(1);
a.push(10);
a.length;
```
- mapping. `mapping(string=>string)`
- struct.
```solidity
struct Car {
    string make;
    stirng model;
    unit year;
}
```

## time units
- `seconds`, `minutes`, `hours`, `days`, `weeks`. can't follow variables.
```solidity
function f(uint start, uint delta) public {
    require (block.timestamp >= start + delta * 1 days);
}
```

# special variables
- `block`
- `msg`
- `tx`
- `gasleft`
- `blockhash(uint blockNumber)`

# error handling
- `assert` error checking
- `require` validation
- `revert`
- `revert(string memory reason)`



# gotchas
- contract implicitly has a getter for each public variable - no getter needed.
