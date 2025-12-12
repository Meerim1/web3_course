// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; // solidity version

contract HelloWorld { 
    string public message = "Hello, World!";
   
    function setMessage(string calldata newMessage) public {
        message = newMessage;
    }
}

// contract name or class name, since all contract similar to class in OOP
// type public/private/internal/external variable = value
// for function set visibility in the end
// function functionName(type variable) public/private/internal/external {
// data location calldata, memory, storage