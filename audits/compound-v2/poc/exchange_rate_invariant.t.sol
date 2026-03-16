// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract ExchangeRateInvariant is Test {

    uint totalSupply = 1000 ether;
    uint totalCash = 500 ether;
    uint totalBorrows = 400 ether;
    uint totalReserves = 50 ether;

    function exchangeRate() public view returns (uint) {
        return (totalCash + totalBorrows - totalReserves) / totalSupply;
    }

    function testExchangeRatePositive() public {

        uint rate = exchangeRate();

        assertGt(rate, 0, "Exchange rate must always be positive");
    }

}