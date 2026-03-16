// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../../src/uniswap/MockUniswapPair.sol";

contract UniswapInvariantTests is Test {
    MockUniswapPair pair;

    function setUp() public {
        pair = new MockUniswapPair();
        pair.addLiquidity(1000 ether, 1000 ether);
    }

    function testInitialReservesAreSet() public view {
        assertEq(pair.reserve0(), 1000 ether);
        assertEq(pair.reserve1(), 1000 ether);
    }

    function testPriceIsOneToOneInitially() public view {
        uint256 price = pair.getPrice();
        assertEq(price, 1e18);
    }

    function testSwapReducesReservesInCurrentMock() public {
        pair.swap(100 ether, 0);

        assertEq(pair.reserve0(), 900 ether);
        assertEq(pair.reserve1(), 1000 ether);
    }

    function testInitialConstantProductValue() public view {
        uint256 kBefore = pair.reserve0() * pair.reserve1();
        uint256 expectedK = (1000 ether) * (1000 ether);

        assertEq(kBefore, expectedK);
    }

    function testCannotSwapMoreThanAvailableLiquidity() public {
        vm.expectRevert("insufficient liquidity");
        pair.swap(1001 ether, 0);
    }
}