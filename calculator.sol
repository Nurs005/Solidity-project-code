// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;


contract calc {
   int a;
   int b;

   function store  (int _a, int _b) public {
       a = _a;
       b = _b;
   }

   function getC() public view returns (int, int) {
       return (a, b);
   }

   function add() public view returns (int){
       return a + b;
   }
   function multiply() public view returns (int){
       return a * b;
   }
   function divide() public view returns (int){
       return a / b;
   }
   function substraction() public view returns (int){
       return a - b;
   }


}