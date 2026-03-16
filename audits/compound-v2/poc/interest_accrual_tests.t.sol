// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract InterestAccrualTest is Test {

    uint borrowBalance = 1000 ether;
    uint interestRate = 5; // percent

    function accrueInterest() public {

        borrowBalance = borrowBalance + ((borrowBalance * interestRate) / 100);
    }

    function testInterestAccrual() public {

        accrueInterest();

        assertEq(borrowBalance, 1050 ether);
    }

}