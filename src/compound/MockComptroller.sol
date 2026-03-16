// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MockComptroller {

    mapping(address => uint256) public collateral;
    mapping(address => uint256) public borrows;

    uint256 public collateralFactor = 50; // 50%

    function supplyCollateral() external payable {
        collateral[msg.sender] += msg.value;
    }

    function borrowAllowed(address user, uint256 amount) public view returns (bool) {

        uint256 maxBorrow = (collateral[user] * collateralFactor) / 100;

        return (borrows[user] + amount <= maxBorrow);
    }

    function recordBorrow(address user, uint256 amount) external {

        require(borrowAllowed(user, amount), "borrow exceeds limit");

        borrows[user] += amount;
    }

    function getAccountLiquidity(address user) external view returns (uint256) {

        uint256 maxBorrow = (collateral[user] * collateralFactor) / 100;

        if (maxBorrow > borrows[user]) {
            return maxBorrow - borrows[user];
        }

        return 0;
    }

}