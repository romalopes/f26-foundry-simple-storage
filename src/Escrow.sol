// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Escrow {
    event Approved(uint256);

    address public depositor;
    address public beneficiary;
    address public arbiter;

    constructor(address _arbiter, address _beneficiary) payable {
        // depositor = new address();
        beneficiary = _beneficiary;
        arbiter = _arbiter;
        depositor = msg.sender;
    }

    function approve() external payable {
        require(msg.sender == arbiter, "Only arbiter can approve");

        uint256 balance = address(this).balance;

        (bool success,) = beneficiary.call{value: balance}("");
        require(success, "Transfer failed");

        emit Approved(balance);
    }
}
