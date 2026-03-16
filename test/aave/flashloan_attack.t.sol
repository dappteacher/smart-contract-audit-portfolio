// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../../src/aave/MockLendingPool.sol";

contract AaveFlashloanAttackTest is Test {
    MockLendingPool pool;

    address attacker = address(0xBEEF);

    function setUp() public {
        pool = new MockLendingPool();

        // Seed pool with liquidity so borrows can be paid out
        vm.deal(address(this), 100 ether);
        pool.deposit{value: 50 ether}();

        vm.deal(attacker, 1 ether);
    }

    function testFirstBorrowIsUnsafeBecauseHealthFactorCheckHappensBeforeDebtIncrease() public {
        vm.prank(attacker);
        pool.deposit{value: 1 ether}();

        // Because healthFactor() returns max when debt == 0,
        // the first borrow can pass even if it should not.
        vm.prank(attacker);
        pool.borrow(10 ether);

        assertEq(pool.debts(attacker), 10 ether);

        // Now the position is clearly unhealthy after the borrow.
        assertLt(pool.healthFactor(attacker), 1);
    }

    function testDemonstratesBorrowCheckOrderingBug() public {
        vm.prank(attacker);
        pool.deposit{value: 1 ether}();

        uint256 hfBefore = pool.healthFactor(attacker);
        assertEq(hfBefore, type(uint256).max);

        vm.prank(attacker);
        pool.borrow(20 ether);

        uint256 hfAfter = pool.healthFactor(attacker);
        assertEq(hfAfter, 0); // (1 ether * 75%) / 20 ether truncates to zero
    }
}