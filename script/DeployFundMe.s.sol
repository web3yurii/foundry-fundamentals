// SPDX-License-Identifier: MIT

pragma solidity ^0.8.29;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    address private constant USD_ETH_SEPOLIA = 0x694AA1769357215DE4FAC081bf1f309aDC325306;

    FundMe fundMe;

    function setUp() public {}

    function run() public returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();
        address priceFeed = helperConfig.activeNetworkConfig();
        console.log("Price Feed Address: ", priceFeed);
        console.log("Chain ID: ", block.chainid);

        vm.startBroadcast();

        fundMe = new FundMe(priceFeed);

        vm.stopBroadcast();

        return fundMe;
    }
}
