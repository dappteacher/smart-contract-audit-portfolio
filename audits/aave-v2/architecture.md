# Protocol Architecture

Understanding the architecture is essential for identifying security boundaries.

---

# High-Level Model

Aave V2 is a **pooled lending protocol**.

Users deposit assets into liquidity pools and receive **aTokens** in return.

Borrowers can borrow assets using deposited collateral.

---

# Core Components

## Lending Pool

The LendingPool contract is the main interaction point for users.

Key functions include:

* deposit
* withdraw
* borrow
* repay
* liquidation

This contract orchestrates interactions between collateral, debt tokens, and reserves.

---

## Reserve System

Each supported asset has an associated **reserve configuration**.

The reserve tracks:

* total liquidity
* total borrows
* interest rate parameters
* collateral eligibility

---

## aTokens

When users deposit assets, they receive **aTokens** representing their claim on the pool.

Properties:

* transferable
* interest-bearing
* redeemable for underlying assets

---

## Debt Tokens

Borrowed positions are represented using debt tokens.

Two types exist:

* stable rate debt
* variable rate debt

These tokens track borrower obligations.

---

## Price Oracle

The oracle system provides asset price feeds used to determine:

* collateral value
* borrowing limits
* liquidation eligibility

Oracle correctness is therefore **critical for protocol safety**.

---

# Key Security Properties

The protocol must maintain several critical invariants:

* total collateral value must exceed borrowed value
* liquidations must restore solvency
* reserve accounting must remain consistent
* interest accrual must not corrupt balances
