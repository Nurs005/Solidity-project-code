// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";
contract PireGen is ERC20{
    IERC20 token1;
    IERC20 token2;
    constructor(address t1, address t2) ERC20("LiquditiProve", "LP"){
        token1 = IERC20(t1);
        token2 = IERC20(t2);
    }
    uint reserve1;
    uint reserve2;
    uint k;

    function addLiquid(uint ammount1, uint ammount2) public {
        token1.transferFrom(msg.sender, address(this), ammount1);
        token2.transferFrom(msg.sender, address(this), ammount2);
        reserve1+= ammount1;
        reserve2 += ammount2;
        k = reserve1 * reserve2;
        _mint(msg.sender, Math.sqrt(reserve1 * reserve2));
    }
    function removeLP(uint LPsAmmount) public {
        _burn(msg.sender, LPsAmmount);
        uint dolya = (LPsAmmount*reserve1)/totalSupply();
        token1.transfer(msg.sender, dolya);
        token2.transfer(msg.sender, dolya);
        reserve1 -= dolya;
        reserve2 -= dolya;
    }
        function getPriseOfX(uint x) public view returns(uint){
            return reserve2 - (k/(reserve1 + x));
        }
        function getPriseOfY(uint y) public view returns(uint){
            return reserve1 - (k/(reserve2 + y));
        }
        
        function trade(uint ammount1, uint ammount2) public {
            if (ammount1 == 0)
            {
                token2.transferFrom(msg.sender, address(this), ammount2);
                token1.transfer(msg.sender, getPriseOfX(ammount2));
                reserve2 += ammount2;
                reserve1 -= getPriseOfX(ammount2);
            }
            if (ammount2 == 0)
            {
                token1.transferFrom(msg.sender, address(this), ammount1);
                token2.transfer(msg.sender, getPriseOfY(ammount1));
                reserve1 += ammount1;
                reserve2 -= ammount2;
            }
        }
}