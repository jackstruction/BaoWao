// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

library RoleHandler {

    enum RoleList {
        Lurker= 0,
        Member = 1,
        Contributor = 2,
        Leader = 3,
        Director = 4
    }
    enum GroupList {
        Undefined = 0,
        Operations = 1,
        Engineering = 2,
        Finance = 3, 
        Marketing = 4,
        Legal = 5,
        Support = 6,
        Sales = 7
    }
    enum StatusList {
        Active = 0,
        Inactive = 1,
        Suspended = 2,
        Deleted = 3
    }

    Struct memberRole {
        uint memberId;
        uint roleId;
        uint groupId;
        uint statusId;
    }


    // determine how to write this. I would like to go the point route where contributions in the last xx amount of days determine your place in the DAO with points diminising over time.

     function setRole(address _account, enum Role, enum Group, enum Status) internal returns() {
         // take in the account address and set the role. This will be a function that will be called by the DAO contract. 
         // I think the best way to organize this would be to loop through roles and order them based on point distributions
        //          SIDENOTE: Need to add a category to the bounties so that we're not accumulating total points and we're instead accumulating points per category.         
        
        // set role and group. Can only belong to one of each. 
        // set role to lurker if not set.
        // set group to undefined if not set.
        // set status to active if not set.



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

