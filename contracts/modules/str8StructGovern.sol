//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract str8DemoGovern is IVote {

//This contract will be more difficult to execute since I will need to be able to hash out how the organization hierarchy is defined. 
// This will be a 1 vote per wallet contract. 
// may need to break this contract out into a separate voting contract as well. 

//variables

// need to tier this bullshit up.

struct VoteList {
    uint voteId;
    uint voteType;
    enum voteResult{
        Passed,
        Failed,
        Pending
    };
}



// events 

event voteStarted(address indexed voter, uint256 indexed voteId, uint256 indexed voteType, uint256 indexed voteValue);

event voteEnded(address indexed voter, uint256 indexed voteId, uint256 indexed voteType, uint256 indexed voteValue);

event voteTallied(address indexed voter, uint256 indexed voteId, uint256 indexed voteType, uint256 indexed voteValue);

event voteResults(address indexed voter, uint256 indexed voteId, uint256 indexed voteType, uint256 indexed voteValue);


// interface functions

    // to govern we will need votes as well as a way to define how votes can be cast or who they can be cast by.
    // the module contract will need to be a technocratic type of setup with specializations and some form of fluid/dynamic leadership  

    // the only function to be used by the other people. 
    function vote(enum vote) public returns(bool){
        // weigh the vote of the user based on their role. 


        return true;
    } 

    // this function will be how to create a new vote.
    function startVote(address) public view returns(enum vote){


    }


    // this function will be how to end a new vote. probs time based, but I guess that can be instantiated in the module contract. probably a seconds based timer from the startvote function.
    function endVote() public view returns(enum vote){

    }


    // this function will be used to tally the vote, and do whatever the necessary actions are, be they contracts or just a simple function call.
    function tallyVote() public view returns(uint){


    }


    function getHistoricalVote(uint) public view returns(enum vote);

}

