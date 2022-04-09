// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

interface IVote {
    

// events 
event voteStarted(address indexed voter, uint256 indexed voteId, uint256 indexed voteType, uint256 indexed voteValue);

event voteEnded(address indexed voter, uint256 indexed voteId, uint256 indexed voteType, uint256 indexed voteValue);

event voteTallied(address indexed voter, uint256 indexed voteId, uint256 indexed voteType, uint256 indexed voteValue);

event voteResult(address indexed voter, uint256 indexed voteId, uint256 indexed voteType, uint256 indexed voteValue);


// interface functions

    // to govern we will need votes as well as a way to define how votes can be cast or who they can be cast by.
    // one of the module contracts will need to be a technocratic type of setup with specializations and some form of fluid/dynamic leadership , whereas one of them will give each member a single vote.  


// member voting functions
    function voteClassic(enum vote, uint ballotId) public returns(bool);


    function voteMultiChoice(uint vote, uint ballotId) public returns(bool);


    // this function will be how to create a new vote.
    function startVote(uint ballotId) public view returns(bool);

    function startVoteTimed(uint ballotId, uint votingWindow) public view returns(bool);

    // this function will be how to end a new vote. probs time based, but I guess that can be instantiated in the module contract. probably a seconds based timer from the startvote function.
    function endVote(uint ballotId) public view returns(bool);


    // this function will be used to tally the vote, and do whatever the necessary actions are, be they contracts or just a simple function call.
    function tallyVote(uint ballotId) public view returns(uint);


    function getHistoricalVote(uint ballotId) public view returns(enum vote);




}