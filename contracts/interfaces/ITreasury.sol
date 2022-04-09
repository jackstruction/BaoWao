// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

interface ITreasury {


// Treasury - Add to treasury, whatever it is where you bomb yourself or whatever, withdraw from treasury  

// events
    event TreasuryDeposit(address indexed treasury, uint256 amount);
    event TreasuryWithdrawal(address indexed treasury, uint256 amount);
    event TreasurySpent(address indexed treasury, uint256 amount);

    // user functions 

    function deposit(uint256 _amount) public payable;

    function withdraw(uint256 _amount) external;

    // view functions 

    function getTreasuryBalance() public view returns (uint256);

    function getUserBalance(address _user) public view returns (uint256);

    // DAO/Admin functions
    // use treasury funds for non-bounty expenses
    function useTreasury(uint256 _amount) public returns(bool);
    // use treasury funds for a bounty 
    function useTreasury4Bounty(uint256 _amount, uint bountyId) public returns(bool);
    
    

}

