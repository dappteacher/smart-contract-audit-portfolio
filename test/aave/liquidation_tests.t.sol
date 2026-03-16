// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../../src/aave/MockLendingPool.sol";

contract AaveLiquidationTests is Test {
    MockLendingPool pool;

    address alice = address(0xA11CE);

    function setUp() public {
        pool = new MockLendingPool();

        // Seed pool with enough liquidity to support borrows
        vm.deal(address(this), 100 ether);
        pool.deposit{value: 50 ether}();

        vm.deal(alice, 5 ether);
    }

    function testHealthFactorIsMaxWhenNoDebt() public {
        vm.prank(alice);
        pool.deposit{value: 2 ether}();

        assertEq(pool.healthFactor(alice), type(uint256).max);
    }

    function testUnsafePositionCanBeDetectedAfterBorrow() public {
        vm.prank(alice);
        pool.deposit{value: 2 ether}();

        vm.prank(alice);
        pool.borrow(2 ether);

        // collateral adjusted by liquidationThreshold = 1.5 ether
        // 1.5 / 2 = 0 in integer division
        assertLt(pool.healthFactor(alice), 1);
    }

    function testRepayImprovesHealthFactor() public {
        vm.prank(alice);
        pool.deposit{value: 2 ether}();

        vm.prank(alice);
        pool.borrow(2 ether);

        uint256 hfBefore = pool.healthFactor(alice);

        vm.prank(alice);
        pool.repay{value: 1 ether}();

        uint256 hfAfter = pool.healthFactor(alice);

        assertGt(hfAfter, hfBefore);
    }
}