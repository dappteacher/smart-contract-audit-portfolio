# Protocol Architecture

Understanding Compound’s architecture is essential to identify potential security risks.

---

# High-Level Design

Compound V2 is a **pooled lending protocol** where assets are supplied into liquidity pools.

Borrowers can access liquidity by posting collateral and maintaining sufficient account liquidity.

Interest rates adjust dynamically based on supply and demand.

---

# Core Components

## Comptroller

The Comptroller acts as the **risk management layer** of the protocol.

Key responsibilities include:

* verifying collateral sufficiency
* enforcing borrow limits
* approving market interactions
* enabling liquidation eligibility

Most protocol safety checks are enforced here.

---

## cToken Contracts

Each market in Compound is implemented as a cToken contract.

Examples include:

* cETH
* cDAI
* cUSDC

Responsibilities include:

* tracking deposits
* tracking borrow balances
* updating interest accrual
* processing redemptions

---

## Interest Accrual Mechanism

Interest is accrued periodically when certain functions are called.

The protocol updates interest using the `accrueInterest()` function.

Correct execution of this mechanism is critical for accurate accounting.

---

## Liquidation System

When an account becomes undercollateralized, liquidators may repay part of the borrower's debt and receive collateral at a discount.

This mechanism ensures protocol solvency.

---

# Key Security Invariants

The protocol must maintain several key invariants:

* total borrowed assets must not exceed available liquidity
* collateral value must exceed borrow value
* exchange rate calculations must remain consistent
* interest accrual must not corrupt balances
