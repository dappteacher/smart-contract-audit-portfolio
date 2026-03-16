// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../../src/vulnerabilities/OracleManipulation.sol";

contract CompoundOracleManipulationSimulationTest is Test {
    OracleManipulation oracleLike;
    address alice = address(0xA11CE);

    function setUp() public {
        oracleLike = new OracleManipulation();
        vm.deal(alice, 5 ether);

        vm.prank(alice);
        oracleLike.deposit{value: 1 ether}();
    }

    function testBorrowPowerReflectsInitialPrice() public view {
        // initial price = 1000
        assertEq(oracleLike.borrowPower(alice), 1000 ether);
    }

    function testManipulatedPriceArtificiallyInflatesBorrowPower() public {
        uint256 beforePower = oracleLike.borrowPower(alice);

        oracleLike.updatePrice(2500);

        uint256 afterPower = oracleLike.borrowPower(alice);

        assertGt(afterPower, beforePower);
        assertEq(afterPower, 2500 ether);
    }

    function testPriceDropReducesBorrowPower() public {
        oracleLike.updatePrice(500);

        assertEq(oracleLike.borrowPower(alice), 500 ether);
    }

    function testAnyoneCanUpdatePriceIsTheCoreVulnerability() public {
        address attacker = address(0xBEEF);

        vm.prank(attacker);
        oracleLike.updatePrice(10_000);

        assertEq(oracleLike.price(), 10_000);
    }
}