# Homework 4
##  Solidity
To this [contract](https://gist.github.com/extropyCoder/77487267da199320fb9c852cfde70fb1)
1. Add a variable to hold the address of the deployer of the contract
2. Update that variable with the deployer's address when the contract is
deployed.
3. Write an external function to return
   -  Address 0x000000000000000000000000000000000000dEaD if called by
the deployer
   - The deployer's address otherwise
## DogCoin contract
1. In Remix, create a new file called DogCoin.sol .
2. Define the pragma compiler version to 0.8.18 .
3. Before the pragma version, add a license identifier
// SPDX-License-Identifier: UNLICENSED .
1. Create a contract called DogCoin.
2. Create a variable to hold the total supply, with an initial amount of 2 million.
3. Make a public function that returns the total supply.
4. Make a public function that can increase the total supply in steps of 1000.
5. Declare an address variable called owner . this address will be allowed to
change the total supply
1. Next, create a modifier which only allows an owner to execute certain
functions.
1.  Make your change total supply function public , but add your modifier so
that only the owner can execute it.
1.  Create a constructor to initialise the state of the contract and within the
constructor, store the owner's address.
1.  Create an event that emits the new value whenever the total supply changes.
When the supply changes, emit this event.
1.  In order to keep track of user balances, we need to associate a user's
address with the balance that they have.
a) What is the best data structure to hold this association ?
b) Using your choice of data structure, set up a variable called balances to
keep track of the number of tokens that a user has.
1.  We want to allow the balances variable to be read from the contract, there
are 2 ways to do this.
What are those ways ?
Use one of the ways to make your balances variable visible to users of the
contract.
1.  Now change the constructor, to give all of the total supply to the owner of
the contract.
1.  Now add a public function called transfer to allow a user to transfer their
tokens to another address. This function should have 2 parameters :
Why do we not need the sender's address here ?
What would be the implication of having the sender's address as a parameter ?
1.  Add an event to the transfer function to indicate that a transfer has taken
place, it should log the amount and the recipient address.
1.  We want to keep a record for each user's transfers. Create a struct called
Payment that stores the transfer amount and the recipient's address.
1.  We want to have a payments array for each user sending the payment.
Create a mapping which returns an array of Payment structs when given this
user's address.
Resources
[Official Solidity Documentation](https://docs.soliditylang.org/en/latest/)
[Globally Available Variables](https://docs.soliditylang.org/en/v0.8.6/units-and-global-variables.html)