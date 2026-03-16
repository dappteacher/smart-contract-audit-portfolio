# Review Scope

## Protocol

Aave V2

## Repository

https://github.com/aave/protocol-v2

---

# Core Contracts Reviewed

The following components represent the core security boundary:

* LendingPool.sol
* LendingPoolCore.sol
* LendingPoolConfigurator.sol
* AToken.sol
* StableDebtToken.sol
* VariableDebtToken.sol
* PriceOracle.sol

---

# Components

### Lending Pool

The main entry point for protocol interactions including:

* deposits
* withdrawals
* borrowing
* repayments
* liquidations

---

### aTokens

Interest-bearing tokens representing user deposits.

Balances increase automatically as interest accrues.

---

### Debt Tokens

Track borrowing positions:

* stable debt tokens
* variable debt tokens

---

### Price Oracle

Provides asset prices used for:

* collateral valuation
* liquidation thresholds
* borrowing limits

---

# Security Focus Areas

Particular attention is given to:

* collateral accounting integrity
* liquidation incentives
* oracle dependency risks
* flash loan attack vectors
* privilege escalation risks

---

# Out of Scope

The following areas are considered outside this research scope:

* frontend interfaces
* governance systems
* cross-chain integrations
* off-chain price feeds
