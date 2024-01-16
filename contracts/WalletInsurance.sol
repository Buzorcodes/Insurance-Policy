// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title WalletInsurance
 * @dev This contract provides wallet insurance functionality
 */
contract WalletInsurance is Ownable {

    constructor(address initialOwner) Ownable(initialOwner) {}

    struct Policy {
        uint256 premium;
        uint256 coverageLimit;
        uint256 expiration;
    }

    mapping(address => Policy) public policies;

    function purchasePolicy(uint256 _premium, uint256 _coverageLimit, uint256 _expiration) external {
        policies[msg.sender] =
            Policy({premium: _premium, coverageLimit: _coverageLimit, expiration: block.timestamp + _expiration});
    }

    function makeClaim() external {
        require(policies[msg.sender].expiration > block.timestamp, "Policy expired");
        payable(msg.sender).transfer(policies[msg.sender].coverageLimit);
        delete policies[msg.sender];
    }
}
