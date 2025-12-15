// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; // solidity version

contract HelloWorld { 
    string public message = "Hello, World!";
   
    function setMessage(string calldata newMessage) public {
        message = newMessage;
    }

    function getMessage() public {
        return message;
    }
}

// contract name or class name, since all contract similar to class in OOP
// type public/private/internal/external variable = value
// for function set visibility in the end
// function functionName(type variable) public/private/internal/external {
// data location calldata, memory, storage

Value types
bool
int, int8 … int256
uint, uint8 … uint256 // signature and number
address, address payable
bytes1 … bytes32
enum

int8 -> 1 byte // 256
int16 → 2 bytes // 65,535
int32 → 4 bytes
int128 → 16 bytes
int256 → 32 bytes

Reference types
string
bytes
array (fixed & dynamic) // uses less gass when fixed
struct
mapping