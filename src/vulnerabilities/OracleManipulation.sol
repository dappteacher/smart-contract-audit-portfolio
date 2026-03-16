// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OracleManipulation {

    uint256 public price = 1000; // oracle price

    mapping(address => uint256) public collateral;

    function updatePrice(uint256 newPrice) external {

        price = newPrice;
    }

    function deposit() external payable {

        collateral[msg.sender] += msg.value;
    }

    function borrowPower(address user) public view returns (uint256) {

        return collateral[user] * price;
    }

}