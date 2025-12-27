// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Chainlink interface
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract EthPriceConsumer {
    AggregatorV3Interface public priceFeed;

    constructor(address _priceFeed) {
        priceFeed = AggregatorV3Interface(_priceFeed);
    }

    function getLatestPrice() external view returns (int256 price) {
        (, price, , ,) = priceFeed.latestRoundData();
        return price;
    }
}
