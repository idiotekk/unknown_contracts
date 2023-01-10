# Memory vs storage
use memory as you can for intermediate calculations for lower gas

# types
## function types
- `public` vs `private`
- `view`, same as `constant`, which doesn't change contract's data
- `pure`, won't read or modify contract's data
- `payable`, can pay ether when calling this function

## basic types
- `string`
- `bool`
- `int`
    - `int8`, -128 to 127 (2^8 in total)
    - `int16`, -32768 to 32767
    - ...
    - `int256`
    - `int` is an alias of int256
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

# more about functions
functions that modify contract data should not return values.

# gotchas
- contract implicitly has a getter for each public variable - no getter needed.