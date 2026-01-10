// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint public count;

    // 50% reward
    function calculateReward(uint deposit) public pure returns (uint) {
        return count * (50 / 100);
    }

    function setCount(uint value) public {
        count = value;
    }

    function increment() public {
        count += 1;
    }

    function decrement() public {
        require(count > 0, "Below zero");
        count -= 1;
    }
}
