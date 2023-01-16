//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

contract IuliaTester {

    mapping(uint256 => uint256) m;

    constructor() {
        m[1] = 10;
    }

    function getValue(uint256 key) external view returns(uint256 value) {
        uint256 slot;
        assembly {
            slot := m.slot
        }
        bytes32 location = keccak256(abi.encode(key, uint256(slot))); // yeah this is how solidity maps key to value slot..
        assembly {
            value := sload(location)
        }
    }

    // check a number is prime or not
    function isPrime(uint256 x) external pure returns(bool) {

        bool p = true;

        assembly {

            if lt(x, 2) {
                p := 0
            }
            
            if lt(1, x) {
                for { let i := 2 /* initialization */ } lt(i, x) { i := add(i, 1) /* post iteration */ }{
                    if iszero(mod(x, i)) {
                        p := 0
                    }
                }
            }

        }

        return p;
    }

    //

}