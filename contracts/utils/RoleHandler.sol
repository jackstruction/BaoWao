// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract RoleHandler {

    enum RoleList {
        Lurker= 0,
        Member = 1,
        Contributor = 2,
        Leader = 3,
        Director = 4
    }

    // determine how to write this. I would like to go the point route where contributions in the last xx amount of days determine your place in the DAO with points diminising over time.

     function setRole(address _account) internal returns(enum role) {
         // take in the account address and set the role. This will be a function that will be called by the DAO contract. 
         // I think the best way to organize this would be to loop through roles and order them based on point distributions
        //          SIDENOTE: Need to add a category to the bounties so that we're not accumulating total points and we're instead accumulating points per category. 
        // 5 or 6 categories should suit a normal organization. ie: 
        /* Operations 
            Product
            Engineering 
            Support
            Marketing 
            Finance
            Legal
            */

            // determine when roles should be assigned, is it as bounties are completed they are placed appropriately? this approach may save gas compared to the above approach.
            // having each role set at bounty completion will solve the need to enumerate through all users.
            // also maybe consider popping users, but that seems like a lot of work.  
     }
}

