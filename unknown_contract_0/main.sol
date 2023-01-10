// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;


contract Inbox {

    string public txt;

    constructor(string memory initTxt) {
        txt = initTxt;
    }

    function setMsg(string memory newTxt) public {
        txt = newTxt;
    }

}