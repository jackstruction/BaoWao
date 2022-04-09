
pragma solidity ^0.8.0;

interface IBounty {


    // events 
    // creator events
    event bountyCreated(address indexed creator, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    event bountyAssigned(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    event bountyClaimed(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    event bountyUpdated(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    // worker events
    event workAccepted(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    event workCompleted(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);



//Creator functions 

function createBounty(uint bountyStatus, uint bountyReward) public payable returns(uint bountyId);
    // create bounty 
    // reward, necessary work scope(ipfs?), due date, bounty status
    // made this payable but I think I need to put the reward somewhere else like a separate reward treasury.
    
function acceptBounty() public returns(bool);
    // accept bounty 
    // bounty id, msg.sender


function rejectBounty() public returns(bool);
    // reject bounty 
    // bounty id, msg.sender, rejection reason


function cancelBounty(uint bountyId) public  returns(bool);  
    // cancel bounty 
    // bounty id, msg.sender = creator, bounty status needs to be unclaimed. 


// Worker fuctions 

function claimBounty() public returns(bool);
    // claim bounty 
    // bounty id, msg.sender    

function submitBounty(uint bountyId) public returns(bool);
    // submit the work order 
    // bounty id, msg.sender

function CollectBounty(uint bountyId) public returns(bool);
    // collect the reward  
    // bounty id, msg.sender

}