// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Store {

    struct List {
        string service;
        uint status;
    }
    struct dogeMark {
        string dogeName;
        uint prise;
    }
    dogeMark[] public dogg;

   List[] public serv;

   function statpush(string memory serp, uint stat) public  {
     serv.push(List(serp, stat));
   }
   function namePush(string memory name, uint prise) public {
    dogg.push(dogeMark(name, prise));
   }
  function getStat(uint snatus) public view returns (string[] memory){
    string[] memory servv = new string[](serv.length);
    for (uint i = 0; i < serv.length; i++ ){
        if (serv[i].status == snatus){
            servv[i] = serv[i].service; 
        }
    }
    return servv;
  }
  function sumOfAllserv() public view returns(uint){
    uint sum = 0;
    for (uint i = 0; i< serv.length; i++){
        sum = serv.length;
    }
    return sum;
  }
  function changeStat(uint index, uint spatus) public{
    serv[index].status = spatus;
  }
    

}