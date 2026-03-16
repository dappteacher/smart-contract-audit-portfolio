# Review Scope

## Protocol

Compound V2

## Repository

https://github.com/compound-finance/compound-protocol

---

# Core Contracts Reviewed

The review focuses on the core protocol components:

* Comptroller.sol
* CToken.sol
* CErc20.sol
* CEther.sol
* InterestRateModel.sol
* PriceOracle.sol

---

# Key System Components

## Comptroller

Central risk management contract responsible for:

* collateral factor configuration
* liquidation rules
* market participation
* account liquidity calculations

---

## cTokens

Each asset in the protocol has a corresponding cToken.

Responsibilities include:

* managing deposits
* processing borrows
* calculating interest accrual
* updating exchange rates

---

## Interest Rate Model

Defines the interest rate applied to borrowers and suppliers based on pool utilization.

---

## Price Oracle

Provides asset prices used for:

* collateral valuation
* borrow limits
* liquidation eligibility

---

# Security Focus Areas

The review prioritizes analysis of:

* account liquidity calculations
* exchange rate updates
* interest accrual correctness
* oracle manipulation risks
* liquidation incentives

---

# Out of Scope

The following areas are excluded:

* governance proposals
* frontend interfaces
* cross-protocol integrations
* off-chain price feed infrastructure
