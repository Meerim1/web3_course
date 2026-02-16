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
// data location: calldata, memory, storage

storage: 📦 Постоянное хранилище контракта
	•   данные сохраняются в блокчейне
	•   самое дорогое по gas
	•   используется для state variables
    •   Живёт между транзакциями.

// example 
contract Example {
    uint public count; // storage

    function set(uint _count) public {
        count = _count; // запись в storage
    }
}

--------

memory: 🧠 Временная память
    •   Временная память
	•	живёт только во время вызова функции
	•	дешевле, чем storage
	•	можно изменять
    •   После выполнения функции — данные пропадают.

// example
function sum(uint[] memory arr) public pure returns (uint) {
    arr[0] = 10; // можно
}

--------

calldata: 📨 Read-only входные данные
	•	только для параметров внешних функций
	•	нельзя менять
	•	самое дешёвое
	•	не копируется в память

// example
function sum(uint[] calldata arr) external pure returns (uint) {
    // arr[0] = 10; ❌ нельзя
}

--------

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