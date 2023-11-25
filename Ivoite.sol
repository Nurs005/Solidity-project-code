// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface Ivoite {
    function openVoiting (string memory _name) external;
    function voite (address gang, uint voteCount) external;
    function voteCounnt (uint a, uint b) external view returns (uint);
}