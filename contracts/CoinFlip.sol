// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract CoinFlip {
    //address of the contract owner / deployer
    address public owner;
    //variable for tracking the balance of the contract
    uint256 public contractBalance;

    // constructor that would initialise the owner
    constructor() {
        owner = msg.sender;
    }

    //logging the event of coin flip
    event LogCoinFlipped(
        address indexed player,
        bool result,
        uint256 amountWon
    );

    //coin flip method that can recieve ether
    function FlipCoin() public payable {
        require(msg.value > 0, "Insufficient ether");

        //local variables
        uint256 betAmount = msg.value;
        uint256 winnings = 0;

        //generate a random number btw 0 and 1 (the side of the coin - 0 is true, 1 is false)
        uint256 randomNumber = uint256(
            keccak256(abi.encodePacked(block.timestamp, msg.sender))
        ) % 2;
        //block.timestamp returns the seconds since 1970
        //msg.sender is the address of the contract deployer
        //abi.encodePacked takes arguments and returns a single byte array
        //keccak256 return the hashed value
        //uint256 would give an unsigned integer of max 256 bits
        // modulo 2 - returns the reminder value after the number is divided by 2

        //boolean to hold the check - which can be true || false
        bool hasPlayerWon;

        if (randomNumber == 0) {
            hasPlayerWon = true;
        } else {
            hasPlayerWon = false;
        }

        //the check
        if (hasPlayerWon) {
            winnings = betAmount * 2;
            payable(msg.sender).transfer(winnings);
            contractBalance -= betAmount;
        } else {
            contractBalance += betAmount;
        }

        //logging the outcome of the coin flip
        emit LogCoinFlipped(msg.sender, hasPlayerWon, winnings);
    }
}
