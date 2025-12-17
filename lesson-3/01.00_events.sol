// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint public count;

    // Events
    event Increment(address indexed caller, uint newCount);
    event Decrement(address indexed caller, uint newCount);

    function increment() public {
        count += 1;
        emit Increment(msg.sender, count);
    }

    function decrement() public {
        require(count > 0, "Below zero");
        count -= 1;
        emit Decrement(msg.sender, count);
    }
}

// Binance/ByBit account top up
// Metamas notification