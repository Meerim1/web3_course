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
}
