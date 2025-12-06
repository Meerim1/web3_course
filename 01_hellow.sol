// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; // solidity version

contract HelloWorld { // contract name or class name, since all contract similar to class in OOP
    // type public/private/internal/external variable = value
    string public message = "Hello, World!";

    // for function set visibility in the end
    // function functionName(type variable) public/private/internal/external {
    // data location calldata, memory, storage
    function setMessage(string calldata newMessage) public {
        message = newMessage;
    }
}