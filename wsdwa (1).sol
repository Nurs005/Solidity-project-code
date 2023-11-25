// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract arrayy {
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
        for (uint a = 0; a< 3; a++){
         for(uint b= 0; b<3; b++){
          if (joj[a][b] % 2 == 0){
             sumi[a][b] = joj[a][b];
          }
           
         }
    }
    return sumi;
}


  function dioganal() public  {
        uint dioga = 1;
        for (uint c = 0; c< 5; c++){
           for (uint d = 5 ; d > 0; d--){
            array[c][d] = dioga;
           }
        }
    }


    function addNumbers() public{
        uint temp = 1;
        for (uint f = 0; f< 6 ; f++){
            for (uint g = 0; g< 6;g++){
                array[f][g] = temp;
                temp++;
            }
        }
    }


    function minMax() public view returns(uint, uint){
         uint maxValue = array[0][0];
         uint minValue = array [0][0];
         for (uint h = 0; h <6; h++){
            for (uint l = 0; l <6; l++){
                if (array[h][l]> maxValue){
                    maxValue = array [h][l];
                } for (uint x = 0; x >6; x++){
                    for (uint y = 0; y>6; y++){
                        if(array[x][y] < minValue){
                            minValue = array[x][y];
                        }
                    }
                }
            }
         }
         return (maxValue, minValue);
    }
}