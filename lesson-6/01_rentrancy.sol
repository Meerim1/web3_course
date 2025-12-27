// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract EtherBank {
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient");

        // ❌ External call before state update
        payable(msg.sender).transfer(amount);

        balances[msg.sender] -= amount;
    }
}
