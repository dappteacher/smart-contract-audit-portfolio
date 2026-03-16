// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MockLendingPool {

    mapping(address => uint256) public deposits;
    mapping(address => uint256) public debts;

    uint256 public liquidationThreshold = 75;

    function deposit() external payable {
        deposits[msg.sender] += msg.value;
    }

    function borrow(uint256 amount) external {

        require(healthFactor(msg.sender) > 1, "unsafe position");

        debts[msg.sender] += amount;

        payable(msg.sender).transfer(amount);
    }

    function repay() external payable {

        debts[msg.sender] -= msg.value;
    }

    function healthFactor(address user) public view returns (uint256) {

        if (debts[user] == 0) return type(uint256).max;

        uint256 collateral = deposits[user] * liquidationThreshold / 100;

        return collateral / debts[user];
    }

}