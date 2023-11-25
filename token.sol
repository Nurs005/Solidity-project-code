// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Token is ERC1155{
    string  a;
    constructor (string memory uri) ERC1155(uri){
             uri = a;
    }

    function mint(uint id, uint value, bytes memory data) public {
        _mint(msg.sender, id, value, data);
    }
} 