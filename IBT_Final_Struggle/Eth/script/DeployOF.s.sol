// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/OF_Coin.sol";

contract DeployOfCoin is Script {
    function run() external {
        // Start broadcasting transactions to the network
        vm.startBroadcast();

        // Deploy the OfCoin contract with the desired name and symbol
        OfCoin token = new OfCoin("OF_Coin", "OF");

        // Log the address of the deployed contract
        console.log("OfCoin deployed at:", address(token));

        // Stop broadcasting transactions
        vm.stopBroadcast();
    }
}
