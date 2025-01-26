// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract OfCoin is ERC20, Ownable {
    constructor(string memory name, string memory symbol) 
        ERC20("OF_Coin","OF") 
        Ownable(msg.sender) // Pass the deployer's address to the Ownable constructor
    {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) public onlyOwner {
        _burn(from, amount);
    }
    function getBalance(address account) public view returns (uint256){
        return balanceOf(account);
    }
}

