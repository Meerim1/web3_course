// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

///
Task 1: Crowdfunding Contract
1. Create a contract that allows users to contribute funds.
2. Each user must send 0.5 ETH to participate.
3. Store information about all contributors (addresses and their contributions).
4. Once the total contributions reach 0.5 ETH, emit an event for each contributor indicating that their funding was received.
Suggested function names:
• fund () - for contributing ETH (payable).
• getContributors () - to view all contributors.
FundingReceived (address contributor, uint amount) - event emitted when funding is received.
Concepts to practice: payable functions, events, storing data in arrays or mappings.
/// 

contract Crowdfunding {
    mapping(address => uint256) contributors;
    address[] public contributorList;

    uint256 minAmount = 0.5 ether;

    event FundingReceived (address indexed contributor, uint256 amount);

    modifier onlyMoreThanMin() {
        require(msg.value >= minAmount, 'Must sent at least 0.5 ETH');
        _;
    }

    function fund() payable external onlyMoreThanMin {
        if(contributors[msg.sender] == 0) {
            contributorList.push(msg.sender);
        }
        contributors[msg.sender] += msg.value;
        emit FundingReceived(msg.sender, msg.value);
    }

    function getContributors() public view returns (address[] memory) {
        return contributorList;
    }
}