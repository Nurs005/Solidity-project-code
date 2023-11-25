// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract MarketPlace{
    IERC20 b;
   ERC721 a;
   constructor (address _token, address boken){
    a = ERC721(_token);
    b = IERC20(boken);
   }
   function checkNFT(address _owner) public view returns (uint){
       return a.balanceOf(_owner);
   }
   function checkCountOFNFT(uint tokenID) public view returns (address){
    return a.ownerOf(tokenID);
   }
   function safeExcange(address _from, address _to, uint tokenID) public {
    a.safeTransferFrom(_from, _to, tokenID);
   }
   function trustControl (address trustee, uint tokenID ) public {
    a.approve(trustee, tokenID);
   }
   function getApproved(uint256 _tokenId) public  view returns (address){
    return a.getApproved(_tokenId);
   }
   function setForOperator (bool approved) public  {
    a.setApprovalForAll(address(this), approved);
   }
   function getSmartRoot () public view returns(bool){
   return a.isApprovedForAll(msg.sender, address(this));
   }
   function buyNFt (address to, uint256 value, uint tokenID ) public returns (bool){
   safeExcange(address(this), msg.sender, tokenID);
   return b.transfer(to, value);

   }


}