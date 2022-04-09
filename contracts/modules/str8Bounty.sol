// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "./interfaces/IBounty.sol";

contract str8Bounty is IBounty {

//events
//  inherited from IBounty

// modifiers 
//maybe have a modifier utility contract that can be used by all contracts?

// variables
enum BountyStatus {
    Open = 0,
    Closed = 1,
    Expired = 2,
    Cancelled = 3,
    Completed = 4,
    Assigned = 5,
    Submitted = 6
}

// assigned to a bounty as the bountyId
uint bountyCount;

// maps true to users that are approved to create bounties
mapping(address => bool) bountySubmitter;


// The bounty struct will contain all necessary information for a bounty and the mapping will allow us to identify the bounty by its id
mapping (uint => Bounty) bounties;
struct bounty {
    uint bountyId;
    uint bountyStatus;
    address bountyCreator;
    address bountyWorker;
    uint bountyReward;
    uint bountyHash;
}

// constructor

constructor () public {
    
}
//fakenatspec
    // create bounty 
    // reward, necessary work scope(ipfs?), due date, bounty status
    // made this payable but I think I need to put the reward somewhere else like a separate reward treasury.
function createBounty(uint bountyStatus, uint bountyReward) public payable returns(uint bountyId){
    require(bountySubmitter(msg.sender)==true);
    bountyCount++;
    Bounty bounty = Bounty(bountyCount, bountyStatus, msg.sender, 0x0, bountyReward, 0x0);
    bounties[bountyCount] = bounty;
    bountyCreated(msg.sender, bountyCount, bountyStatus, bountyReward, 0x0);
    return bountyCount;
}

    
    // accept bounty 
    // bounty id, msg.sender
function acceptBounty(uint bountyId) public returns(bool){
    Bounty memory bounty = bounties[bountyId];
    require(bounty.bountyCreator==msg.sender, "You are not the bounty creator");
    require(bounty.bountyStatus == BountyStatus.submitted, "Bounty is not submitted");
    bounty.bountyStatus = BountyStatus.Assigned;
    bounty.bountyWorker = msg.sender;
    bountyAssigned(msg.sender, bounty.bountyId, bounty.bountyStatus, bounty.bountyReward, bounty.bountyWorkOrder);
    return true;
}

    // reject bounty 
    // bounty id, msg.sender, rejection reason
function rejectBounty(uint bountyId) public returns(bool){
    Bounty memory bounty = bounties[bountyId];
    require(bounty.bountyCreator(msg.sender)==true);
    require(bounty.bountyStatus == BountyStatus.Open);
    bounty.bountyStatus = BountyStatus.Open;
    bounty.bountyWorker = 0x0;
    bountyAssigned(msg.sender, bounty.bountyId, bounty.bountyStatus, bounty.bountyReward, bounty.bountyWorkOrder);
    return true;

}

    // cancel bounty 
    // bounty id, msg.sender = creator, bounty status needs to be unclaimed. 
function cancelBounty(uint bountyId) public returns(bool){
    require(bounty.bountyCreator(msg.sender)==true);
    require(bounty.bountyStatus == BountyStatus.Open);
    bounty.bountyStatus = BountyStatus.Cancelled;
    bounty.bountyWorker = 0x0;
    // send bountyReward back to the treasury or wherever it came from 
    bountyAssigned(0x0, bounty.bountyId, bounty.bountyStatus, bounty.bountyReward, bounty.bountyWorkOrder);
    return true;

}  

function addBountySubmitter(address _submitter) public returns(bool){
    require(bountySubmitter(msg.sender)==true);
    return bountySubmitter[_submitter] = true;   
}
function removeBountySubmitter(address _submitter) public returns(bool){
    require(bountySubmitter(msg.sender)==true);
    return bountySubmitter[_submitter] = false;   
}

// Worker fuctions 

    // claim bounty 
    // bounty id, msg.sender    
function claimBounty() public returns(bool){
    Bounty memory bounty = bounties[bountyId];
    require(bounty.bountyStatus == BountyStatus.Open, "Bounty is not open");
    bounty.bountyWorker = msg.sender;
    return true;
}
    // submit the work order 
    // bounty id, msg.sender
function submitBounty(uint bountyId) public returns(bool){
    Bounty memory bounty = bounties[bountyId];
    require(bounty.bountyStatus == BountyStatus.Assigned, "Bounty is not assigned");
    require(bounty.bountyWorker == msg.sender, "You are not the bounty worker");
    bounty.bountyStatus = BountyStatus.Submitted;
    return true;
}

    // collect the reward  
    // bounty id, msg.sender
function CollectBounty(uint bountyId) public returns(bool){

    // withdraw from treasury as that is where the bounty reward should be stored 
    // need to inherit from treasury contract
    Bounty memory bounty = bounties[bountyId];
    useTreasury4Bounty(uint256 _amount, uint bountyId) public returns(bool);

}

}