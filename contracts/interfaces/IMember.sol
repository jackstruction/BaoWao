// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;


interface IMember {

function joinDAO() public payable returns (uint memberId);

function leaveDAO() public returns (bool);

function kickMember(uint memberId) public returns (bool);

function isMember() public view returns (bool);


}