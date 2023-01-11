//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

contract Lottery {
    address public dealer;
    address[] public players;

    constructor() {
        dealer = msg.sender;
    }

    function enter() public payable {
        require(msg.value > .01 ether, "not enough ether");
        players.push(msg.sender);
    }

}