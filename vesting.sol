// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Vesring is Ownable{

    IERC20 a;
    constructor(address _token)Ownable(msg.sender){
        a = IERC20(_token);
    }
    struct Vesting{
        uint ammount;
        uint alredyWitrawAmmount;
        uint vestingStart;
        uint realeseDate;
        bool isRealised;
    }

    mapping (address => Vesting) vesters;

    

    function setVester(address user, uint amount, uint duration) public {
        Vesting memory newVesting = Vesting({
            ammount: amount,
            vestingStart: block.timestamp,
            realeseDate: duration,
            alredyWitrawAmmount: 0,
            isRealised: false
        });
        vesters[user] = newVesting;
    }
    function withdraw() public {
    require(!vesters[msg.sender].isRealised, "You alredy, witraw");
    require(a.transfer(msg.sender, getAviableAmmount()));
    
    } 

    function getAviableAmmount() public view returns(uint){
        if(vesters[msg.sender].vestingStart + vesters[msg.sender].realeseDate <= block.timestamp)
        {
            return vesters[msg.sender].ammount - vesters[msg.sender].alredyWitrawAmmount;
        } else 
        {
            return 
            vesters[msg.sender].ammount * (block.timestamp - vesters[msg.sender].vestingStart) 
           / vesters[msg.sender].realeseDate - vesters[msg.sender].alredyWitrawAmmount;
        }
    }
}
    
