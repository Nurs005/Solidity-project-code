// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import"./Ivoite.sol";

contract UserVoit{
 
 Ivoite a;

 constructor (address _vote){
    a = Ivoite(_vote);
 }
 function openVoite(string memory _voteName) public {
     a.openVoiting(_voteName);
 }
 function vote (uint Id) public {
    a.voite(msg.sender, Id);
 }
 function voiteCount (uint iid, uint id) public view returns (uint){
    return a.voteCounnt(iid, id);
 }
}