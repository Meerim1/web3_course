// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StringCounter {
    // Mapping to store how many times a string occurred
    mapping(string => uint256) private stringCounts;

    // Event (optional, useful for tracking)
    event StringAdded(string value, uint256 newCount);

    // Function to add/set a string
    function setString(string calldata _value) external {
        stringCounts[_value] += 1;
        emit StringAdded(_value, stringCounts[_value]);
    }

    // Function to get how many times a string occurred
    function getStringCount(string calldata _value) external view returns (uint256) {
        return stringCounts[_value];
    }
}
