// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract Animal{
function makeSound () public virtual view returns (string memory){
    return "sound";
}
function makeMove () public virtual pure returns (string memory){
    return "smth made move";
}
}
    contract Dog is Animal{
        function makeSound() public override  pure returns (string memory){
            return "bark";
        }
        function makeMove () public override pure returns (string memory){
            return "dog ran";
        }
    }
    contract Cat is Animal{
        function makeSound() public override pure returns (string memory){
            return "meow";
        }
        function makeMove() public override  pure returns (string memory){
            return "cat walking";
        }
    }
    contract Bird is Animal{ 
        function makeSound () public override  pure returns (string memory){
            return "twitter";
        }
        function makeMove() public override pure returns (string memory){
            return "bird flyed";
        }
    }





contract bankAccounts{

mapping (address => uint) public balance;
 
 function depposit() public virtual payable {
    require(msg.value > 0, "Ammount should be  more than zero");
    balance[msg.sender] += msg.value;
 }
 function withdraw (uint ammount) public virtual {
    payable (msg.sender).transfer(ammount);
    balance[msg.sender] -= ammount;
 } 
}
 contract savingAccounts is bankAccounts {
  
 }
 contract CheckingAccount is bankAccounts{

 }
 contract FixedDepositAccount is bankAccounts{
    
 }