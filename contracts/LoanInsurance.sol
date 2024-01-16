/**
 * @title LoanInsurance
 * @author Buzor
 * @notice This contract provides loan insurance functionality
 * @dev Allows users to purchase insurance policies to cover loans, and make claims if loan defaults
 */
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

contract LoanInsurance is Ownable {
    constructor(address initialOwner) Ownable(initialOwner) {}

    struct Policy {
        uint256 premium;
        uint256 collateralAmount;
        uint256 loanAmount;
        uint256 coveragePercentage; // in basis points
        uint256 expiration;
    }

    mapping(address => Policy) public policies;

    function purchasePolicy(
        uint256 _premium,
        uint256 _collateralAmount,
        uint256 _loanAmount,
        uint256 _coveragePercentage,
        uint256 _expiration
    ) external {
        policies[msg.sender] = Policy({
            premium: _premium,
            collateralAmount: _collateralAmount,
            loanAmount: _loanAmount,
            coveragePercentage: _coveragePercentage,
            expiration: block.timestamp + _expiration
        });
    }

    function makeClaim() external {
        require(policies[msg.sender].expiration > block.timestamp, "Policy expired");
        uint256 payoutAmount = (policies[msg.sender].loanAmount * policies[msg.sender].coveragePercentage) / 10000;
        payable(msg.sender).transfer(payoutAmount);
        delete policies[msg.sender];
    }
}
