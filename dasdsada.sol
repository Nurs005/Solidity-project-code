// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract chess {
     uint [5][5] public sidecoin;
    uint[5][5] public chesss;
    

  function fillArraySnake() public {
    bool direct = false;
    
    for (uint i = 0; i <5; i++){
        if (i % 2 == 0){
            for (uint j = 0; j<5; j++){
                chesss[i][j] = 1;

                }
            } else if  (direct == false){
                    chesss[i][4]= 1;
                    direct = !direct;
                } else if (direct == true){
                    chesss[i][0] = 1;
                } 
        } 
    } 
    function addNumbers () public {
        uint8 value = 1;
        for (uint i = 0; i<5; i++){
            if (i % 2 == 0) {for (uint j = 0; j<5; j++){
                sidecoin[i][j] = value;
                value++;
            }
          } else{
            for (int j = 5 -1; j>=0; j--){
                sidecoin[i][uint (j)] = value;
                value++;
            }
          }
        }
    }
    function searchMatch() public view returns (uint){
        uint ans = 0;
        uint counter = 0;
        for (uint i = 0; i<5; i++){
                if (sidecoin[i][i] == sidecoin[i][i]){
                    uint newcounter = 0;
                    newcounter += 1; 
                    if (newcounter > counter){
                        ans = sidecoin[i][i];
                        counter = newcounter;
                    }
                }
            }
            return ans;
        }
        
}
