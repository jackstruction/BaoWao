// SPDX-License-Identifier: GPL-3.0

import "../interfaces/ITreasury.sol"

pragma solidity ^0.8.0;

contract str8Treasury is ITreasury {


// Treasury - Add to treasury, whatever it is where you bomb yourself or whatever, withdraw from treasury  

// events 
    event TreasuryAdded(address indexed treasury, uint256 amount);
    event TreasuryWithdrawn(address indexed treasury, uint256 amount);
    event TreasurySpent(address indexed treasury, uint256 amount);


    // user functions 

    function addToTreasury(uint256 _amount) public{
        // add tokens to treasury, emit event
        // require amount greater, amount!=0, member good standing

    }
    


    function withdrawFromTreasury(uint256 _amount) public{
        // withdraw tokens from treasury, emit event
        // require amount invested greater, amount!=0, member good standing

    }



    // view functions 

    function getTreasuryBalance() external view returns (uint256);

    // DAO/Admin functions

    function useTreasuryFunds(uint256 _amount) external {


    }

    function useTreasuryFundsForBounty(uint256 _amount) external;
    
    

}

