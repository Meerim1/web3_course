// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variables {
    uint public a = 10;

    function read() public view returns (uint) {
        return a;
    }

    function add(uint b) public pure returns (uint) {
        return b + 1;
    }
}
