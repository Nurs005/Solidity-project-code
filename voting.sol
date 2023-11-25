// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Voting{

    IERC20 votingToken;

    constructor(address token){
        votingToken = IERC20(token);
    }
    

    struct Vote{
        string question;
        string[] options;
        uint[] results;
        mapping(uint => address[]) users;
    }

    Vote[] public votes;


    uint votePrice;

    function createVoting(string memory question, string[] memory options) public {
        uint[] memory temp = new uint[](options.length);
        uint id = votes.length;
        votes.push();
        Vote storage newVote = votes[id];
        newVote.question = question;
        newVote.options = options;
        newVote.results = temp;
    }

    function setPrice(uint price) public {
        votePrice = price;
    }

    function makeVote(uint id, uint option) public {
        // require(votingToken.balanceOf(msg.sender) >= votePrice, "Not enough tokens for voting");
        // votingToken.transferFrom(msg.sender, address(this), votePrice);
        votes[id].results[option]++;
        votes[id].users[option].push(msg.sender);
    }


    function getResults(uint id) public view returns(string memory){
        string memory result;
        uint max=0;
        uint maxIndex=0;
        for (uint i=0; i<votes[id].results.length; i++){
            if(max < votes[id].results[i]){
                max = votes[id].results[i];
                maxIndex = i;
            }
        }
        result = votes[id].options[maxIndex];
        return result;
    }


}

