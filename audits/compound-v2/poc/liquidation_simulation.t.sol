// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract LiquidationSimulation is Test {

    uint collateralValue = 100 ether;
    uint borrowedValue = 80 ether;

    uint liquidationThreshold = 75;

    function healthFactor() public view returns (uint) {
        return (collateralValue * liquidationThreshold) / borrowedValue;
    }

    function testLiquidationTrigger() public {

        uint hf = healthFactor();

        assertTrue(hf < 100, "Position should be liquidatable");
    }

}