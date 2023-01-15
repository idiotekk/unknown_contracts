//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

contract IuliaTester {

    // check a number is prime or not
    function isPrime(uint x) external pure returns(bool) {

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