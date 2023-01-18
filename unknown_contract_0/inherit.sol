// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;


contract Parent {

    // uint private x = 1;
    uint internal x = 1; // this allows children contract to access x

    modifier requireXPositive {
        require(x > 0, " x is 0 ");
        _;
    }

}

contract Child is Parent {

    //uint public x = 0;

    constructor () {
        x = 0;
    }

    function getX() public view requireXPositive returns (uint) {
        return x;
    }

}