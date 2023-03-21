// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// @audit Contract   dont  Inherit from ERC20.sol  library "BadLotteryGame is ERC20"
contract  BadLotteryGame  {
    uint256 public prizeAmount;         // payout amount
    address payable[] public players;

   //@audit  players can be added whiout any limit size.      
    uint256 public num_players;        
    address payable[] public prize_winners; 
    event winnersPaid(uint256);

    //@audit  these not access control  implement on  critocal functions on the contract , a possible solution can be add Inherit form Ownable contract and implement requires.

    constructor() {}



    function addNewPlayer(address payable _playerAddress) public payable {

        //@audit not validadtion  from players  to join  

        if (msg.value == 500000) {
            players.push(_playerAddress);
        }
        num_players++;
        if (num_players > 50) {
            emit winnersPaid(prizeAmount);
        }
    }

    function pickWinner(address payable _winner) public {

        //@audit critical use for "block.timestamp" to implement randomness a attacker can manipulate the block to pick the winner.
        if ( block.timestamp % 15 == 0){    // use timestamp for random number
            prize_winners.push(_winner);
        }          
    }

    function payout() public {
        if (address(this).balance == 500000 * 100) {
            uint256 amountToPay = prize_winners.length / 100;
            distributePrize(amountToPay);
        }
    }


    function distributePrize(uint256 _amount) public {
        //@audit possible overflow " prize_winners.length" logic not correct implemented
        //@audit reentrancy attacker can recall function  and drain all funds        
        for (uint256 i = 0; i <= prize_winners.length; i++) {
            prize_winners[i].transfer(_amount);
        }
    }
}