
pragma solidity ^0.8.0;

interface IBounty ;




    // events 
    // creator events
    event bountyCreated(address indexed creator, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    event bountyAssigned(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    event bountyClaimed(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    event bountyUpdated(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    // worker events
    event workAccepted(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    event workCompleted(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);


// Claim the task as yours and start working to complete it, possibly allow multiple members to work on the task. possibly pair up, but I want to keep this general
function claimBounty()  public ;
    // claim bounty 
    // bounty id, msg.sender    

function CollectBounty(uint bountyId) ;
    // collect the reward  
    // bounty id, msg.sender
    //

function createBounty(uint bountyId, uint bountyStatus, uint bountyReward) public payable returns(bool);
    // create bounty 
    // reward, necessary work scope(ipfs?), due date, bounty status
    // made this payable but I think I need to put the reward somewhere else like a separate reward treasury.


 
// assign the bounty to a specific user, when a task is just too important to be up for grabs.  
function assignBounty() public;
    // assign bounty 
    // bounty id, bounty assignee
    // 


function acceptBounty()  public  ;
    // accept bounty 
    // bounty id, msg.sender


function rejectBounty()  public ;
    // reject bounty 
    // bounty id, msg.sender,



function parRejectBounty() public ;
    // reject bounty 
    // bounty id, credit, msg.sender



function cancelBounty() public  ;  
    // cancel bounty 
    // bounty id, msg.sender = creator, bounty status needs to be unclaimed. 


function updateBounty(uint bountyId, bytes32 ipfsHash) public payable ;
    // update bounty 
    // bounty id, new ipfs hash, new reward. 


function addReward(uint bountyId, uint rewardAmount) public payable returns() ;
    // add reward 
    // bounty id, amount
    




// 4. Work(bounties) - submit a work-order, contribute to work-order,
// delete work-order, accept workorder, reject workorder (partial pay)  reject order (no reward)


    


