// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract CompoundExchangeRateInvariantTest is Test {
    uint256 internal constant SCALE = 1e18;

    function _exchangeRate(
        uint256 totalCash,
        uint256 totalBorrows,
        uint256 totalReserves,
        uint256 totalSupply
    ) public pure returns (uint256) {
        require(totalSupply > 0, "totalSupply = 0");
        require(totalCash + totalBorrows >= totalReserves, "bad accounting");

        return ((totalCash + totalBorrows - totalReserves) * SCALE) / totalSupply;
    }

    function testExchangeRateIsPositiveWhenAssetsExist() public view {
        uint256 rate = this._exchangeRate(1_000 ether, 500 ether, 50 ether, 100 ether);
        assertGt(rate, 0);
    }

    function testExchangeRateIncreasesWhenBorrowsIncrease() public view {
        uint256 rate1 = this._exchangeRate(1_000 ether, 100 ether, 10 ether, 100 ether);
        uint256 rate2 = this._exchangeRate(1_000 ether, 300 ether, 10 ether, 100 ether);

        assertGt(rate2, rate1);
    }

    function testExchangeRateDecreasesWhenReservesIncrease() public view {
        uint256 rate1 = this._exchangeRate(1_000 ether, 100 ether, 10 ether, 100 ether);
        uint256 rate2 = this._exchangeRate(1_000 ether, 100 ether, 50 ether, 100 ether);

        assertLt(rate2, rate1);
    }

    function testExchangeRateRevertsOnZeroSupply() public {
        vm.expectRevert("totalSupply = 0");
        this._exchangeRate(100 ether, 50 ether, 10 ether, 0);
    }

    function testExchangeRateRevertsOnBadAccounting() public {
        vm.expectRevert("bad accounting");
        this._exchangeRate(10 ether, 5 ether, 20 ether, 1 ether);
    }
}