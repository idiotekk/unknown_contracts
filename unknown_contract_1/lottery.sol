//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

contract Lottery {
    address public dealer;

    constructor() {
        dealer = msg.sender;
    }

    function getDealer() public view returns (address) {
        return dealer;
    }

}