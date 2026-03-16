// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MockCToken {

    mapping(address => uint256) public deposits;
    mapping(address => uint256) public borrows;

    uint256 public totalDeposits;
    uint256 public totalBorrows;

    uint256 public interestRate = 5; // 5%

    function deposit() external payable {
        deposits[msg.sender] += msg.value;
        totalDeposits += msg.value;
    }

    function borrow(uint256 amount) external {

        require(deposits[msg.sender] >= amount * 2, "insufficient collateral");

        borrows[msg.sender] += amount;
        totalBorrows += amount;

        payable(msg.sender).transfer(amount);
    }

    function repay() external payable {

        borrows[msg.sender] -= msg.value;
        totalBorrows -= msg.value;
    }

    function accrueInterest(address user) external {

        uint interest = (borrows[user] * interestRate) / 100;

        borrows[user] += interest;
        totalBorrows += interest;
    }

}