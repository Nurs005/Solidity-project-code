// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Randomness {
uint [] urat = [1,2,3,4,56,6,7];
 
      
        
        function getSum(uint index1, uint index2) public view returns (uint){
                uint _a = urat[index1];
                uint _b = urat[index2];
                uint sum = _a + _b;
                return sum; 
        }


        function getMinute(uint second) public pure returns (uint){
                uint minute = second / 60;
                return minute;

        }



        function getNum(int a) public pure returns (bool){
                if (a >= 0) { 
                return true;
                } else {
                        return false;
                }
        }


        function sumAndProduct(uint number) public pure returns (uint, uint){
               uint firstNumber = number / 10;
               uint secondNumber = number % 10;
               uint sum = firstNumber + secondNumber;
               uint product = firstNumber * secondNumber;
               return (sum,product);
    }



     function orderNumb(uint x, uint y, uint z) public pure returns (uint, uint) {
       uint maxnumber = x;
       uint minnumber = x;
       if (y > maxnumber) {
        maxnumber = y;
       } else if(  y < minnumber) {
        minnumber = y;
       }
       if (z > maxnumber) {
        maxnumber = z;
       } else if (z < minnumber){
        minnumber = z;
       }
       return (maxnumber, minnumber);
     }




     function generateNum(uint start, uint end) public pure returns (uint[] memory){
        uint[] memory array = new uint[](end - start + 1);
        for (uint i = start; i <= end; i++){
                array[i - start] = i;
        }
        return array;
     }




     function canculateFactorial(uint N) public view returns (uint) {
        if (N == 0 || N == 1){
                return 1;
        } else {return N * canculateFactorial(N - 1);}
     }




     mapping ( string => uint)  public  airdrop;
     string[] username;
     function dropAir () public {
        for (uint i = 0; i < username.length; i++){
                airdrop[username[i]] +=1000;
        }
     }
     function setName (string memory name) public {
        username[airdrop[name]];
       
     }
     function canculate(uint hog) public pure returns(uint){
        uint tenprocent = (hog*10)/100; 
        return tenprocent;
     }

    
     
}