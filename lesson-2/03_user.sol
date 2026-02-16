// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Users {
    struct User {
        string name;
        uint age;
    }

    mapping(address => User) public users;

    function setUser(string calldata name, uint age) public {
        users[msg.sender] = User(name, age);
    }

    function getUser(address userAddress) external view returns (string memory name, uint256 age) {
        User memory u = users[userAddress];
        return (u.name, u.age);
    }
}

// msg is a global Solidity object that contains information about the current transaction or call.
// msg.sender → the address of the account or contract that called the function.
// msg.value → the amount of Ether (in wei) sent with the call.
// msg.data → the raw calldata sent with the function call.