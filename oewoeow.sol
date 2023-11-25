// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract kikano{
    uint[6] public array;

    uint [5][5] public arr =[[1,5,5,5,5],[5,5,2,5,5],[5,3,5,5,5],[5,5,1,5,5],[5,5,5,1,5]];
    function ssetArray(uint[6] memory test) public {
        array = test;
    }
    function swapArrayHalf() public {
        
        for (uint i=0; i<=2; i++){
            for(int j = 5; j>2; j--){
                uint a = i;
                uint b =uint (j);
                (array[a], array[b]) = (array[b], array[a]);
            }
    }
}
    function nullBetween() public {
        uint min = array[0];
        uint max = array[0];
    for (uint i = 0; i<6; i++){
        if(array[i]>=max){
            max = array[i];
        }
        if (array[i]<=min){
            min = array[i];
        }

        for (uint j = 0; j<6; j++){
            if (array[j]>min && array[j]< max){
                array[j] = 0;
            }
        }
    }

  }

  function returnaa() public view returns(uint[6]memory){
    return array;
  }
  function rotate () public {
    for (uint i = 0; i<5; i++){
        array [i] = array [i+1];
    }
    array[5] = 0;
  }
   


  // Дальше уже не домашка





  function sumOfculumn() public view  returns(uint[] memory){
    uint[]memory testt = new uint[](5);
    uint sum = 0;
    for (uint i = 0; i<5; i++){
        for (uint j = 0; j<5; j++){
            sum += arr[j][i];
        }
            testt[i] = sum;
            sum = 0;
    }
    return testt;
    
  }
  function searchMin() public view returns(uint[]memory){
    uint[] memory tss = new uint[](5);
   
    for (uint  i = 0; i<5; i++){
         uint min = arr[i][0];
        for (uint j = 0; j<5; j++)
        if (arr[i][j]< min){
            min = arr[i][j];
        }
        tss[i] = min;

    }
    return tss;
  }
  function gggi() public view returns (uint, uint){
    uint index = 0;
    uint _sum = 0;
    uint temp=100;
    for (uint i = 0; i<5; i++){
        for (uint j =0; j<5; j++){
           _sum += arr[j][i];         
        }
        if (temp > _sum){
            temp = _sum;
            index = i;
        }
        _sum=0;
          
    }
    return(index, temp);
  }
}
