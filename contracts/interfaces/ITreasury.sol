// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

interface ITreasury {


// Treasury - Add to treasury, whatever it is where you bomb yourself or whatever, withdraw from treasury  

// events 
    event TreasuryAdded(address indexed treasury, uint256 amount);
    event TreasuryWithdrawn(address indexed treasury, uint256 amount);
    event TreasurySpent(address indexed treasury, uint256 amount);


    // user functions 

    function addToTreasury(uint256 _amount) external;
    function withdrawFromTreasury(uint256 _amount) external;

    // view functions 

    function getTreasuryBalance() external view returns (uint256);

    // DAO/Admin functions

    function useTreasuryFunds(uint256 _amount) external;

    function useTreasuryFundsForBounty(uint256 _amount) external;
    
    

}

