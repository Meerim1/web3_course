// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Faucet {
    // Allow the contract to receive ETH
    receive() external payable {}

    function withdraw() external {
        uint256 amount = 0.1 ether;
        require(address(this).balance >= amount, "Insufficient balance");

        payable(msg.sender).transfer(amount);
    }
}
