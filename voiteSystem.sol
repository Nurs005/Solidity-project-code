// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract VoiteSystem{
    IERC20 a;
    constructor(address _token){
        a = IERC20(_token);
    }
   
    struct VoiteForm {
        string name;
        string[] options;
        uint tokenAmmount;
    }
    mapping (address => uint[]) public  voitersChoise;
    // в 0 индекс голосования в 1 выбранный ответ
   mapping (address => uint tokenAmmount) public rewardList;
   address[] public voiterlist;
   uint [] public opt;
   uint [] token;

   VoiteForm[] public vote;

    function makeVote (string memory _name, string[] memory _options) public {
        vote.push(VoiteForm(_name, _options, 0));
    }

    function voite (uint voitingInd, uint optInd, uint ammount) public{
         opt.push(voitingInd);
         opt.push(optInd);
        voitersChoise[msg.sender] = opt; 
        vote[voitingInd].tokenAmmount += ammount;
        token.push(ammount);
        a.approve(address(this), ammount);
        a.transferFrom(msg.sender, address(this), ammount);
        rewardList[msg.sender] = ammount;
        voiterlist.push(msg.sender);
    }

    function rewardForVoite() public {
        uint counter;
        uint winAns; 
        uint c;
        for (uint i = 0; i<vote.length; i++){
           if (opt[i] == opt[counter]){
            winAns++;
           }
        }
        if (winAns == 0){
            c = winAns;
            counter++;
        } else{
            c = winAns;
            counter++;
        }
        if (winAns>c){
            for (uint j = 0; j< voiterlist.length; j++){
               uint am = token [j] * token[j] ;
                a.transferFrom(address(this), voiterlist[j], am );
            }
        }
    }
    
}
