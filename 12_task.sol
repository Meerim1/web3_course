// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Pausable {
    address public admin;
    bool public paused;

    constructor() {
        admin = msg.sender;
        paused = false;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    modifier whenNotPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    function pause() public onlyAdmin {
        paused = true;
    }

    function unpause() public onlyAdmin {
        paused = false;
    }

    function performAction() public whenNotPaused {
        // action logic
    }
}
