// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract OracleManipulationSimulation is Test {

    uint oraclePrice = 1000;
    uint collateral = 10;

    function borrowLimit() public view returns (uint) {
        return collateral * oraclePrice;
    }

    function testOracleManipulation() public {

        uint manipulatedPrice = 2000;

        uint borrowPower = collateral * manipulatedPrice;

        assertGt(borrowPower, borrowLimit(), "Oracle manipulation increases borrow power");
    }

}