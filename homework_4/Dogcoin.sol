// SPDX-License-Identifier: UNLICENSED

// 2. Define the pragma compiler version to 0.8.18 .

pragma solidity 0.8.19;

// 4.Create a contract called DogCoin.

contract Dogcoin {
    uint public decimals = 18;
    // 5. Create a variable to hold the total supply, with an initial amount of 2 million.
    uint public totalSupply = 20000* (10 ** decimals);
    // 8.Declare an address variable called owner . this address will be allowed to change the total supply
    address public owner;
     

    /* 
      13 . In order to keep track of user balances, we need to associate a user's
    address with the balance that they have.
   a) What is the best data structure to hold this association ?
    a mapping is best structure to use 
   b) Using your choice of data structure, set up a variable called balances to keep track of the number of tokens that a user has.
    
    */

    // 18. We want to keep a record for each user's transfers. Create a struct called Payment that stores the transfer amount and the recipient's address.

    struct Payment {
        uint amount;
        address recipient;
    }

    // 14. We want to allow the balances variable to be read from the contract, there are 2 ways to do this. What are those ways? Use one of the ways to make your balances variable visible to users of the contract.

    mapping(address => uint) public balances;

    //  19. We want to have a payments array for each user sending the payment. Create a mapping which returns an array of Payment structs when given this user's address.

    mapping(address => Payment[]) public payments;

    // 9. Next, create a modifier which only allows an owner to execute certain function

    modifier onlyOwner() {
        require(msg.sender == owner, "Only  the owner can execute function");
        _;
    }
    //  12. Create an event that emits the new value whenever the total supply changes. When the supply changes, emit this event.

    event TotalSupplyChanged(uint newSupply);

    //  17. Add an event to the transfer function to indicate that a transfer has taken place, it should log the amount and the recipient address.

    event Transfer(address indexed from, address indexed to, uint amount);

    // 11. Create a constructor to initialise the state of the contract and within the constructor, store the owner's address.

    constructor() {
        owner = msg.sender;

        // 16. Now change the constructor, to give all of the total supply to the owner of the contracts
        balances[owner] = totalSupply;
    }

    // 6.Make a public function that returns the total supply

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    // 7.Make a public function that can increase the total supply in steps of 1000.
    // 10. Make your change total supply function public , but add your modifier so that only the owner can execute it.

    function increaseTotalSupply(uint256) public onlyOwner {
        totalSupply += 1000;
        emit TotalSupplyChanged(totalSupply);
    }

    function transfer(uint256 _amount, address _recipient) public {

        require (balances[msg.sender] >= _amount, "Insufficient balance to send  a payment");

        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
        payments[msg.sender].push(Payment(_amount, _recipient));
        emit Transfer(msg.sender, _recipient, _amount);
    }

    function getPayments(address _user) public view returns (Payment[] memory) {
        return payments[_user];
    }
}
