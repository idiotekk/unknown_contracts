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

    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(players, block.timestamp, block.difficulty)));
    }

    function pickWinner() public dealerOnly {
        require(players.length > 0, "number of players must be positive");
        uint winnerIndex = random() % players.length;
        address payable winnerAddress = payable(players[winnerIndex]);
        winnerAddress.transfer(address(this).balance);
        players = new address[](0); // reset player list
    }

    function nPlayers() public view returns (uint) {
        return players.length;
    }

    modifier dealerOnly() {
        require(msg.sender == dealer);
        _;
    }

}