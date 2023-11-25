// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;



contract blya{
   int[] public blin;
   uint [] public vublic;
 
 function setArray(int setnum) public {
  blin.push(setnum);
 }
 function setChota(uint _setnum) public {
    vublic.push(_setnum);
 }
    function searchRepeat() public view returns(int){
        bool positiveNegtv = !(blin[0] > 0); 
        for (uint i = 1; i<blin.length; i+=1){
            if ((blin[i]>0) == positiveNegtv){
                positiveNegtv = !positiveNegtv;
            }else{ 
                return blin[i];
            }
        }
        return 0;
    }
    function swapMinMax()  public {
        uint minI = 0;
        uint maxI = vublic.length - 1;
        uint mini = 0;
        uint maxi = 0;
        uint temp;
        for (uint i = 0; i<vublic.length; i++){
                if (vublic[i]< minI){
                    minI = vublic[i];
                    mini = i;
                 }
                 if (vublic[i]> maxI){
                    maxI = vublic[i];
                    maxi = i;
                 }
                 if (mini < maxi) {
                    temp = vublic[mini];
                 vublic[mini] = vublic[maxi];
                 vublic[maxi] = vublic[mini];
                 }

                 
                }
        }
        
     

    function search() public view  returns (uint) {
        uint maxCount = 1;

        for (uint i = 0; i < vublic.length; i++) {
            uint num = vublic [i];
            num++;

            if (num > maxCount) {
                maxCount = num;
            }
        }

        return maxCount;
    }

  //  function setvublic(uint[] memory testVublic) public{
   //     vublic = testVublic;
    //}

   // function swappp() public {
  //  for (uint i = 0; i<vublic.length; i+=2){
    
 //           (vublic[i],vublic[i+1]) = (vublic[i+1], vublic[i]);
        
 //   }
    }
  