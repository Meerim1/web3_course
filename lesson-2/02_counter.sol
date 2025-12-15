// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint public count;

    function increment() public {
        count += 1;
    }

    function decrement() public {
        require(count > 0, "Below zero");
        count -= 1;
    }
}

/*
// 1. User error (use require)
require(amount > 0, "Amount must be > 0");

// 2. Same check but using custom error
if (amount == 0) revert AmountZero();

// 3. Authorization check
if (msg.sender != owner) revert NotOwner();

// 4. Invariant check
assert(owner != address(0));
*/