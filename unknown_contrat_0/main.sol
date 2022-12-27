// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;


contract Inbox {

    string public txt;
    constructor(string initTxt) public {
        txt = initTxt;
    }

    function setMsg(string newTxt) public {
        txt = newTxt;
    }

    function getMsg() public view returns (string) {
        return txt;
    }
}