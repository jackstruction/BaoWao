// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

interface IProposal {
    

// submit on-chain proposal 
function submitPropOn(uint256 _proposalId, string _proposalName, string _proposalDesc, uint256 _proposalCost) public payable;
// submit off-chain proposal
function submitPropOff(uint256 _proposalId, string proposalHash) public payable;
// vote proposal 
function voteProp(uint256 _proposalId, bool _vote) public;
// accept proposal
function acceptProp(uint256 _proposalId) public;
// reject proposal
function rejectProp(uint256 _proposalId) public;
// tally proposal votes
function tallyProp(uint256 _proposalId) public view returns (uint256, uint256);



}