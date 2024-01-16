
# Insurance Contracts

## LoanInsurance

### Overview

The `LoanInsurance` contract provides functionality for loan insurance, allowing users to purchase insurance policies to cover loans and make claims if the loan defaults. This contract extends the functionality of the `Ownable` contract.

### Features

-   Users can purchase insurance policies with specified premium, collateral amount, loan amount, coverage percentage, and expiration period.
-   Policies store information such as premium, collateral amount, loan amount, coverage percentage (in basis points), and expiration timestamp.
-   Users can make claims on active policies, receiving a payout if the policy is still valid.

### Usage

1.  Deploy the `LoanInsurance` contract, specifying the initial owner's address.
2.  Users can purchase policies using the `purchasePolicy` function by providing the necessary parameters.
3.  Claims can be made using the `makeClaim` function, ensuring the policy is still valid.

## WalletInsurance

### Overview

The `WalletInsurance` contract provides functionality for wallet insurance, allowing users to purchase insurance policies for their wallets. Similar to the `LoanInsurance` contract, this contract also extends the functionality of the `Ownable` contract.

### Features

-   Users can purchase insurance policies with specified premium, coverage limit, and expiration period.
-   Policies store information such as premium, coverage limit, and expiration timestamp.
-   Users can make claims on active policies, receiving a payout if the policy is still valid.

### Usage

1.  Deploy the `WalletInsurance` contract, specifying the initial owner's address.
2.  Users can purchase policies using the `purchasePolicy` function by providing the necessary parameters.
3.  Claims can be made using the `makeClaim` function, ensuring the policy is still valid.

## Getting Started

To deploy and interact with these contracts, follow these steps:

1.  Deploy the respective contract (either `LoanInsurance` or `WalletInsurance`) by providing the initial owner's address.
2.  Users can then purchase policies using the `purchasePolicy` function with the required parameters.
3.  Claims can be made using the `makeClaim` function, ensuring the policy is still valid.

## Notes

-   The contracts utilize the OpenZeppelin `Ownable` contract for ownership functionality.
-   Make sure to comply with any licensing terms specified in the contracts.
