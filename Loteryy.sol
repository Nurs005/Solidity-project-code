// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Lotery is Ownable{
    
    
    IERC20 a;
    constructor (address _LOT) Ownable(msg.sender){
        a = IERC20(_LOT);
       
    }

    function setTokenAddress(address _token) public onlyOwner {
        a = IERC20(_token);
    }

    struct loteryStayckers{
        address Stakers;
        uint luckyNum;
        bool wasOrNot;
    }

    loteryStayckers[] public stakerList;


    
    uint public price = 100000000;
    uint private  winNum;
    uint public finally;
    bool public openOrClose;
    


    function fixOwner(address newOwn) public onlyOwner{
        _transferOwnership(newOwn);
    }
    
    event Registration ( uint indexed  lucky, bool indexed sucsees);
    
    event WinnerEatDinner (address indexed  winner, string indexed yepe);

    
    function openReg(bool opcl) public onlyOwner {
        openOrClose = opcl;
    }

    function regLotery() public {
        require(openOrClose == true, "Registration is not open");
        a.transferFrom(msg.sender, address(this), price);
        uint value = uint (blockhash(block.number - 1));
        uint time = block.timestamp;
        uint yourNum = uint (keccak256(abi.encode(value, time)));
        uint luck = yourNum % 9000 + 1000;
       stakerList.push (loteryStayckers(msg.sender, luck, true));
       emit Registration( luck, true);

    }

    

    function fixPrice(uint prise) public onlyOwner {
        price = prise;
    } 
    
    function generateWinNum(uint win) public onlyOwner {
        require(win > 1000, "Your win number too short");
        require(win < 10000, "Your win number too long");
        winNum = win;
    }
    
    function setTimeSearchWin (uint time) public onlyOwner{
        finally  = time;  //https://www.unixtimestamp.com/
    }
    function searchWiner () public onlyOwner {
        require (block.timestamp >= finally, "Final time hasn't arrived yet!");
    for (uint i = 0; i<stakerList.length; i++){
        if (stakerList[i].wasOrNot == true){
            if (stakerList[i].luckyNum == winNum){
            a.transfer(owner(), tem);
            a.transfer(stakerList[i].Stakers, a.balanceOf(address(this)));
            emit WinnerEatDinner(stakerList[i].Stakers, "God bllesed you!!!");
            }
        }
        stakerList[i].wasOrNot = false;
      }
    }

    uint tem;
    function commision() internal {
         tem = a.balanceOf(address(this)) * 100 / 3;
    } 

}