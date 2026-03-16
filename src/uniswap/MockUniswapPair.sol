// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MockUniswapPair {

    uint256 public reserve0;
    uint256 public reserve1;

    function addLiquidity(uint256 amount0, uint256 amount1) external {

        reserve0 += amount0;
        reserve1 += amount1;
    }

    function getPrice() public view returns (uint256) {

        require(reserve1 > 0, "invalid reserves");

        return (reserve0 * 1e18) / reserve1;
    }

    function swap(uint256 amount0Out, uint256 amount1Out) external {

        require(amount0Out < reserve0 && amount1Out < reserve1, "insufficient liquidity");

        reserve0 -= amount0Out;
        reserve1 -= amount1Out;

        // simplistic swap model
    }

}