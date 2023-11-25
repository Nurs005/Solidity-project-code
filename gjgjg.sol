// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;


contract matrix {
 uint [5][5] public array = [[4,4,22,4,6],[5,4,2,1,1],[1,1,1,1,1],[1,3,45,6,7],[23,3,66,66,66]];
    function setarray() public {
        uint temp = 1;
        for (uint i = 0; i<5; i++){
            for(uint j = 0; j<5; j++ ){
                array[i][j] += temp;
            
            }
        }
    }
    function average () public view returns (uint[5]memory){
        uint[5] memory arr;
        uint c;
        uint count;
        for(uint i = 0; i <5; i++){
            for (uint j = 0; j<5; j++){
                 c += array[i][j];
            }
            for (uint j = 0; j<5; j++){
            uint averag = c/5;
                 if (array[i][j]< averag){
                    count++;
                 } 
                 arr[i] = count;
                 count = 0;
        }
        }
        return arr;
    }
    function searchOdd () public view returns(uint){
        uint index = 0;
        bool onlyOdd = false;
        for(uint i = 0; i<5; i++){
            for (uint j =0; j<5; j++){
                if (array[j][i]%2 == 0){
                    onlyOdd = true;
                    index = j;
                } else {
                    onlyOdd = false;
                }
                if (onlyOdd = false){
                    return index+1;
                }
            } 
        }
        return 0;
    }
    function searchmatch () public view returns (uint){
        uint counter = 0;
        for (uint i = 0; i<4; i++){
            for (uint j = 0; j<4; j++){
                if (array[i][j] != array[i][j+1]){
                    counter=i;
                }
            }
        }
        return counter;
    } 

}