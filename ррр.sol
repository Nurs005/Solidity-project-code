// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Helth{
    uint public helthAmmount = 100;
    function helthy() public virtual {
     require(helthAmmount<= 99, "Your helth is full");
     helthAmmount++;
    }
    function damage () public virtual {
        require (helthAmmount> 0, "You death");
        helthAmmount--;
    }
}
    contract Mana{
        uint public mana = 100;
        function addMana() public virtual{
            require(mana<=99, "your mana is full");
            mana++;
        }
        function substractionMana() public virtual {
            require(mana> 0,"you did not have any mana");
            mana--;
        }
    }
    contract Hero is Helth, Mana{
      uint agility;
         uint power;
         uint intelect;
    }



    contract Knight is Hero{
        constructor (){
         agility = 100;
         power = 10;
         intelect = 50;
        }
         string uniqSkill = "rivok";
        function getSkills () public view returns (uint, uint, uint){
            return (agility, power, intelect);
        }
        function atack () public pure returns (string memory){
          return "knight atacled";
        }
        function protect() public pure returns (string memory){
            return "knight protected himself";
        }
    }



       contract Elf is Hero{
        constructor (){
         agility = 50;
         power = 30;
         intelect = 100;
        }
         string uniqSkill = "fire";
        function getSkills () public view returns (uint, uint, uint, string memory){
            return (agility, power, intelect, uniqSkill);
        }
        function atack () public pure returns (string memory){
          return "Elf atacled";
        }
        function protect() public pure returns (string memory){
            return "Elf protected himself";
        }
       }


       contract Org is Hero{
        constructor (){
         agility = 10;
         power = 100;
         intelect = 30;
        }
         string uniqSkill = "rage";
        function getSkills () public view returns (uint, uint, uint, string memory){
            return (agility, power, intelect, uniqSkill);
        }
        function atack () public pure returns (string memory){
          return "Org atacked";
        }
        function protect() public pure returns (string memory){
            return "Org protected himself";
        }
       }