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

function createBounty() {
    // create bounty 
    // reward, necessary work scope(ipfs?), due date, bounty status
}

function dibsOnBounty() {
    // dibs on bounty 
    // bounty id, dibs amount, dibs date, msg.sender
} 

function assignBounty() {
    // assign bounty 
    // bounty id, bounty assignee
}


function claimBounty() {
    // claim bounty 
    // bounty id, msg.sender    
}

//
function acceptBounty() {
    // accept bounty 
    // bounty id, msg.sender
}

function rejectBounty() {
    // reject bounty 
    // bounty id, msg.sender,

}

function parRejectBounty() {
    // reject bounty 
    // bounty id, credit, msg.sender

}

function cancelBounty() {  
    // cancel bounty 
    // bounty id, msg.sender = creator, bounty status needs to be unclaimed. 
}

function updateBounty() {
    // update bounty 
    // bounty id, new ipfs hash, new reward. 
}

function addReward() {
    // add reward 
    // bounty id, amount

}
