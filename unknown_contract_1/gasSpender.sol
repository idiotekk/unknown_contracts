//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

contract GasSpender {
    uint public x = 5;
    uint public y = 1;
    uint public z = 2;

    function light() public { // 27216
        x = x + 10;
    }

    function heavy() public { // 224162
        for (uint i = 0; i < 100; i++) {
            x = x + 1;
        }
    }

    function storageLocation() external pure returns(uint) {
        uint slotLocation;
        assembly {
            slotLocation := z.slot
        }
        return slotLocation;
    }

    function getValueAtSlot(uint slot) external view returns(uint) {
        uint value;
        assembly {
            value := sload(slot)
        }
        return value;
    }

    function loopChecked(uint n) public returns(uint) { // n = 10, cost 62545
        x = 0;
        for(uint256 i = 0; i < n; i++) {
            x = x + i;
        }
        return x;
    }

    function loopUnchecked(uint n) public returns(uint) { // n = 10, cost 14150
        x = 0;
        for(uint256 i = 0; i < n;) {
            unchecked{ i++; }
        }
        return x;
    }

}
