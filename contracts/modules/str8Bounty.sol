// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract str8Bounty is IBounty {


// I would like to make this contract very straightforward. Define scope work, and reward.

//events


// modifiers 


// variables
enum BountyStatus {
    Open = 0,
    Closed = 1,
    Expired = 2,
    Cancelled = 3,
    Completed = 4
}
uint bountyCount;

struct bounty {
    uint bountyId;
    uint bountyStatus;
    address bountyCreator;
    address bountyWorker;
    uint bountyReward;
    uint bountyWorkOrder;
}

// constructor




// interface (IBounty) functions


// functions

function assignBounty()   public ;
    // assign bounty  
    // bounty id, bounty assignee
}


function acceptBounty()  public {
    // accept bounty 
    // bounty id, msg.sender
}

function rejectBounty()  public {
    // reject bounty work
    // bounty id, msg.sender,
}


function parRejectBounty()  public {
    // reject bounty work
    // bounty id, credit, msg.sender
}


function cancelBounty() public {  
    // cancel bounty 
    // bounty id, msg.sender = creator, bounty status needs to be unclaimed. 
}

function updateBounty() public payable {
    // update bounty 
    // bounty id, new ipfs hash, new reward. 
}

function addReward() public payable  {


    // add reward - for teams with a mutual interest in the work order.
    // bounty id, amount
}


function claimBounty()  public {
    // claim bounty 
   // bounty id, msg.sender    
}
