// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../../src/compound/MockComptroller.sol";

contract CompoundLiquidationSimulationTest is Test {
    MockComptroller comptroller;

    address alice = address(0xA11CE);

    function setUp() public {
        comptroller = new MockComptroller();
        vm.deal(alice, 10 ether);
    }

    function testAccountHasLiquidityAfterSupplyingCollateral() public {
        vm.prank(alice);
        comptroller.supplyCollateral{value: 4 ether}();

        uint256 liquidity = comptroller.getAccountLiquidity(alice);

        // collateralFactor = 50%, so borrowable liquidity = 2 ether
        assertEq(liquidity, 2 ether);
    }

    function testBorrowReducesAvailableLiquidity() public {
        vm.prank(alice);
        comptroller.supplyCollateral{value: 4 ether}();

        comptroller.recordBorrow(alice, 1 ether);

        uint256 liquidity = comptroller.getAccountLiquidity(alice);
        assertEq(liquidity, 1 ether);
    }

    function testPositionBecomesUnsafeWhenLiquidityReachesZero() public {
        vm.prank(alice);
        comptroller.supplyCollateral{value: 4 ether}();

        comptroller.recordBorrow(alice, 2 ether);

        uint256 liquidity = comptroller.getAccountLiquidity(alice);
        assertEq(liquidity, 0);
    }

    function testCannotBorrowBeyondCollateralFactor() public {
        vm.prank(alice);
        comptroller.supplyCollateral{value: 4 ether}();

        vm.expectRevert("borrow exceeds limit");
        comptroller.recordBorrow(alice, 2 ether + 1);
    }
}