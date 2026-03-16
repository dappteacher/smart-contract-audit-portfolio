// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../../src/compound/MockCToken.sol";

contract CompoundInterestAccrualTests is Test {
    MockCToken cToken;

    address alice = address(0xA11CE);

    function setUp() public {
        cToken = new MockCToken();
        vm.deal(alice, 10 ether);

        vm.prank(alice);
        cToken.deposit{value: 4 ether}();

        // Borrow 2 ether against 4 ether collateral
        vm.prank(alice);
        cToken.borrow(2 ether);
    }

    function testInitialBorrowIsRecorded() public view {
        assertEq(cToken.borrows(alice), 2 ether);
        assertEq(cToken.totalBorrows(), 2 ether);
    }

    function testAccrueInterestIncreasesUserDebt() public {
        cToken.accrueInterest(alice);

        // 5% of 2 ether = 0.1 ether
        assertEq(cToken.borrows(alice), 2.1 ether);
        assertEq(cToken.totalBorrows(), 2.1 ether);
    }

    function testRepayReducesDebt() public {
        vm.prank(alice);
        cToken.repay{value: 1 ether}();

        assertEq(cToken.borrows(alice), 1 ether);
        assertEq(cToken.totalBorrows(), 1 ether);
    }

    function testAccrualThenRepayProducesExpectedDebt() public {
        cToken.accrueInterest(alice); // 2 -> 2.1

        vm.prank(alice);
        cToken.repay{value: 1 ether}();

        assertEq(cToken.borrows(alice), 1.1 ether);
        assertEq(cToken.totalBorrows(), 1.1 ether);
    }
}