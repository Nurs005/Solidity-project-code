// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


//уличный диплом
contract Storage {
    int ulichni_diplom;
    int neulichni_diplom;

    function store(int _a,int _b) public {
        ulichni_diplom = _a;
        neulichni_diplom = _b;
     } 
     function berA() public view returns (int){
         return ulichni_diplom;
    }
    function berB() public view returns (int){
        return neulichni_diplom;}

     function getNumbers() public view returns(int,int) {
         return (ulichni_diplom, neulichni_diplom);
     }
         
}