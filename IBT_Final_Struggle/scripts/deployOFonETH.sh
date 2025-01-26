#!/bin/bash

# Add the directory containing `anvil` and `forge` to the PATH
export PATH="/home/davyjones/.foundry/bin:$PATH"

# Open another new terminal window and run the `forge script` command
konsole -e bash -c "cd ~/IBT_Final_Struggle/Eth/;forge script script/DeployOF.s.sol:DeployOfCoin --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80; exec bash"
