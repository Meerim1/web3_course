// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@chainlink/contracts/src/v0.8/automation/AutomationCompatible.sol";

contract AutoCounter is AutomationCompatible {
    uint256 public counter;
    uint256 public lastRun;
    uint256 public interval = 60;

    constructor() {
        lastRun = block.timestamp;
    }

    function checkUpkeep(
        bytes calldata
    ) external view override returns (bool upkeepNeeded, bytes memory) {
        upkeepNeeded = (block.timestamp - lastRun) > interval;
    }

    function performUpkeep(bytes calldata) external override {
        if ((block.timestamp - lastRun) > interval) {
            lastRun = block.timestamp;
            counter++;
        }
    }
}
