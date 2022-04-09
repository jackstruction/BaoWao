
pragma solidity ^0.8.0;

interface IBounty ;


//Creator functions 

    // create 

    // update 

    // delete


// Worker Functions 

    // read 

    // claim 

    // events 
    // creator events
    event bountyCreated(address indexed creator, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    event bountyAssigned(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    event bountyClaimed(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    event bountyUpdated(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);
    // worker events
    event workAccepted(address indexed worker, uint bountyId, uint bountyStatus, uint bountyReward, uint bountyWorkOrder);


function createBounty(uint bountyId, uint bountyStatus, uint bountyReward) public payable returns(bool);
    // create bounty 
    // reward, necessary work scope(ipfs?), due date, bounty status
    // made this payable but I think I need to put the reward somewhere else like a separate reward treasury.

function dibsOnBounty(uint bountyId) ;
    // dibs on bounty 
    // bounty id, msg.sender
    //
 

function assignBounty()  public ;
    // assign bounty 
    // bounty id, bounty assignee



function claimBounty()  public  ;
    // claim bounty 
    // bounty id, msg.sender    



function acceptBounty()  public  ;
    // accept bounty 
    // bounty id, msg.sender


function rejectBounty()  public  ;
    // reject bounty 
    // bounty id, msg.sender,



function parRejectBounty() public ;
    // reject bounty 
    // bounty id, credit, msg.sender



function cancelBounty() public  ;  
    // cancel bounty 
    // bounty id, msg.sender = creator, bounty status needs to be unclaimed. 


function updateBounty() public payable ;
    // update bounty 
    // bounty id, new ipfs hash, new reward. 


function addReward() public payable ;
    // add reward 
    // bounty id, amount






// 4. Work(bounties) - submit a work-order, contribute to work-order,
// delete work-order, accept workorder, reject workorder (partial pay)  reject order (no reward)


    


