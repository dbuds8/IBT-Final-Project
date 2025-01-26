// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/OF_Coin.sol";

contract OfCoinTest is Test {
    OfCoin token;

    function setUp() public {
        token = new OfCoin("OF_Coin", "MTK");
    }

    function testMint() public {
        token.mint(address(this), 1000);
        assertEq(token.balanceOf(address(this)), 1000);
    }

    function testBurn() public {
        token.mint(address(this), 1000);
        token.burn(address(this), 500);
        assertEq(token.balanceOf(address(this)), 500);
    }
}
