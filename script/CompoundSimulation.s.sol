// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "forge-std/console2.sol";

import "../src/compound/MockComptroller.sol";
import "../src/compound/MockCToken.sol";

contract CompoundSimulation is Script {
    function run() external {
        vm.startBroadcast();

        MockComptroller comptroller = new MockComptroller();
        MockCToken cToken = new MockCToken();

        console2.log("=== Compound V2 Mock Simulation ===");
        console2.log("MockComptroller deployed at:", address(comptroller));
        console2.log("MockCToken deployed at:", address(cToken));

        // Seed cToken with liquidity from broadcaster
        cToken.deposit{value: 10 ether}();
        console2.log("Seeded MockCToken with 10 ether liquidity");
        console2.log("Total deposits:", cToken.totalDeposits());

        // Simulated user
        address user = vm.addr(1);

        vm.deal(user, 5 ether);
        console2.log("User:", user);
        console2.log("User funded with 5 ether");

        // User supplies collateral to Comptroller
        vm.startPrank(user);
        comptroller.supplyCollateral{value: 4 ether}();
        console2.log("User supplied 4 ether collateral");

        uint256 liquidityBefore = comptroller.getAccountLiquidity(user);
        console2.log("Account liquidity before borrow:", liquidityBefore);

        // Register borrow in comptroller
        comptroller.recordBorrow(user, 2 ether);
        console2.log("Borrow of 2 ether approved by comptroller");

        // User deposits collateral into cToken so borrow passes cToken's own check
        cToken.deposit{value: 4 ether}();
        console2.log("User deposited 4 ether into MockCToken");

        // Borrow from cToken
        cToken.borrow(2 ether);
        console2.log("User borrowed 2 ether from MockCToken");

        uint256 userDebtBefore = cToken.borrows(user);
        console2.log("User debt before accrual:", userDebtBefore);

        vm.stopPrank();

        // Accrue interest
        cToken.accrueInterest(user);
        uint256 userDebtAfter = cToken.borrows(user);

        console2.log("User debt after 5 percent interest accrual:", userDebtAfter);
        console2.log("Total borrows after accrual:", cToken.totalBorrows());

        uint256 liquidityAfter = comptroller.getAccountLiquidity(user);
        console2.log("Account liquidity after borrow record:", liquidityAfter);

        console2.log("=== Simulation Complete ===");

        vm.stopBroadcast();
    }
}