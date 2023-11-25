// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract wallet {

    mapping (address => uint) balance;

    function getBlance(address owner) public view returns (uint) {
        return balance [owner];
    }
 function deposit() public payable {
     require(msg.value > 0, "amount should be grater than zero");
     balance[msg.sender] += msg.value;
 }

 function sendTokens(address _to, uint amount) public {
      require(balance[msg.sender] > 0, "U tebya ne ulichni diplom");
      balance[msg.sender] -= amount;
      balance [_to] += amount;
      payable (_to).transfer(amount);
 }
 function withdraw(uint _amount) public {
     require(_amount <= balance[msg.sender], "koi ey");
     payable (msg.sender).transfer(_amount);
     balance [msg.sender] -= _amount;
 }

 
}