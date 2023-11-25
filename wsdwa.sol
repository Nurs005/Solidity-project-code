// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract arrayy{
    uint[3][3] public joj =[[1,2,3],[4,5,6],[7,8,9]];
    uint [6][6] public array;
    
    
    function addOne() public view returns(uint) {
    uint sum;
    for (uint i = 0; i< 3; i++){
         for(uint j= 0; j<3; j++){
          sum += joj[i][j];
           
         }
    }
    return sum;
    
   
}
    function addi() public view  returns(uint[3][3] memory) {
        uint [3][3] memory sumi;
        for (uint i = 0; i< 3; i++){
         for(uint j= 0; j<3; j++){
          if (joj[i][j] % 2 == 0){
             sumi[i][j] = joj[i][j];
          }
           
         }
    }
    return sumi;
}
    function dioganal() public  {
        uint dioga = 1;
        for (uint i = 0; i<5; i++){
           for (uint j = 5; j> 0; j--){
            array[i][j] += dioga;
           }
        }
    }
    function addNumbers() public{
        uint temp = 1;
        for (uint i = 0; i<6; i++){
            for (uint j = 0; j<6;j++){
                array[i][j] = temp;
                temp++;
            }
        }
    }
    function minMax() public view returns(uint[6][6]memory){
        uint minNum = 1;
        uint maxNumb = 36;
        uint[6][6] memory ariba;
        for (uint i = 0; i<6; i++){
            for (uint j = 0; j<6; j++){
                if (array[i][j] <= minNum){
                    ariba[i][j] = array[i][j];
                } else if (
                    array [i][j] >= maxNumb){
                    ariba [i][j] = array [i][j];
                }
            }
        }
        return ariba;
    }
}